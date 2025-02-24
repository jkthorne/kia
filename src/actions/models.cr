require "http/client"

require "../models/response/model"

class Kai::Actions::Models
  def send
    response = HTTP::Client.get(
      "https://api.x.ai/v1/models",
    )
  end
end
