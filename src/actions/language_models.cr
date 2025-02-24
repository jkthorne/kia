require "http/client"

class Kai::Actions::LanguageModels
  def index
    response = HTTP::Client.get(
      "https://api.x.ai/v1/language_models",
    )

    if response.success?
      return Kai::Models::Response::LanguageModel.from_json(response.body)
    else
      raise "Failed to get language models: #{response.body}"
    end
  end

  def show(id : String)
    response = HTTP::Client.get(
      "https://api.x.ai/v1/language_models/#{id}",
    )

    if response.success?
      return Kai::Models::Response::LanguageModel.from_json(response.body)
    else
      raise "Failed to get language model: #{response.body}"
    end
  end
end
