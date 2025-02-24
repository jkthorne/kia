require "http/client"

require "../models/response/model"

class Kai::Actions::Models
  def index
    response = HTTP::Client.get(
      "https://api.x.ai/v1/models",
    )

    if response.success?
      return Kai::Models::Response::Model.from_json(response.body)
    else
      raise "Failed to get models: #{response.body}"
    end
  end

  def show(id : String)
    response = HTTP::Client.get(
      "https://api.x.ai/v1/models/#{id}",
    )

    if response.success?
      return Kai::Models::Response::Model.from_json(response.body)
    else
      raise "Failed to get model: #{response.body}"
    end
  end
end
