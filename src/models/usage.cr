require "json"

class Kai::Models::Usage
  include JSON::Serializable

  property prompt_tokens : Int32
  property completion_tokens : Int32
  property total_tokens : Int32
  property prompt_tokens_details : PromptTokensDetails

  class PromptTokensDetails
    include JSON::Serializable

    property text_tokens : Int32
    property audio_tokens : Int32
    property image_tokens : Int32
    property cached_tokens : Int32
  end
end
