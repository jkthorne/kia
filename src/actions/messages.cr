require "http/client"

require "../models/completion"

class Kai::Actions::Messages
  def send(model : String,
            max_tokens : Int32,
            messages : Array(Kai::Models::Message),
           )
    response = HTTP::Client.post(
      "https://api.x.ai/v1/messages",
      headers: HTTP::Headers{
        "Content-Type"  => "application/json",
        "Authorization" => "Bearer #{ENV["XAI_API_KEY"]}",
      },
      body: {
        "model" => model,
        "max_tokens" => max_tokens,
        "messages" => messages,
      }.to_json,
    )
  end
end
