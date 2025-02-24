require "http/client"

class Kai::Actions::ApiKeys
  def index
    response = HTTP::Client.post(
      "https://api.x.ai/v1/api_keys",
    )
  end
end