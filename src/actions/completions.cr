require "http/client"

require "../models/completion"

class Kai::Actions::Completions
  def send(messages : Array(Kai::Models::Message),
           model : String = Kai::MODEL.to_s,
           frequency_penalty : Float32 = 0.0,
           # logit_bias : Hash(String, Float32) = {}, TODO Implement logit bias
           logprobs : Bool = false,
           max_tokens : Int32 = 16384,
           n : Int32 = 1, # Number of completions to generate
           presence_penalty : Float32 = 0.0,
           response_format : String? = nil,
           seed : Int32? = nil,
           stop : String? = nil,
           stream : Bool = Kai::STREAM, # TODO: Implement streaming
           stream_options : Hash(String, String)? = nil,
           temperature : Float64 = Kai::TEMPERATURE,
           tool_choice : (String | Object)? = nil,
           tools : Array(String) = [] of String,
           top_logprobs : Int32 = 0,
           top_p : Float64 = 1.0,
           user : String? = nil,)
    if (frequency_penalty < -2.0 || frequency_penalty > 2.0)
      raise "Frequency penalty must be between -2.0 and 2.0"
    end

    if (presence_penalty < -2.0 || presence_penalty > 2.0)
      raise "Presence penalty must be between -2.0 and 2.0"
    end
    
    if (response_format &&
       response_format["type"] != "text" &&
       response_format["type"] != "json_object" &&
       response_format["type"] != "json_schema"
         )
      raise "Response format must be 'json' or 'text'"
    end
    
    if (stop && stop.length > 4)
      raise "Stop must be less than 4 segments"
    end
    
    if (stream == false)
      if stream_options.try(&.present?)
        raise "Stream options are only valid when streaming"
      end
    end
    
    if (temperature < 0.0 || temperature > 2.0)
      raise "Temperature must be between 0.0 and 2.0"
    end
    
    if (top_logprobs < 0 || top_logprobs > 8)
      raise "Top logprobs must be between 0 and 8"
    end
    
    if (top_p < 0.0 || top_p > 1.0)
      raise "Top p must be between 0.0 and 1.0"
    end

    response = HTTP::Client.post(
      "https://api.x.ai/v1/chat/completions",
      headers: HTTP::Headers{
        "Content-Type"  => "application/json",
        "Authorization" => "Bearer #{ENV["XAI_API_KEY"]}",
      },
      body: {
        "messages"    => messages,
        "model"       => Kai::MODEL,
        "stream"      => Kai::STREAM,
        "temperature" => Kai::TEMPERATURE,
      }.to_json,
    )

    if response.success?
      return Kai::Models::Completion.from_json(response.body)
    else
      raise "Failed to send messages: #{response.body}"
    end
  end
end
