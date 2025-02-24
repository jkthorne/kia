require "json"

class Kai::Models::LanguageModel
  include JSON::Serializable
  include JSON::Serializable::Unmapped

  property id : String
  property fingerprint : String
  property created : Int32
  property object : String
  property owned_by : String
  property version : String
  property input_modalities : Array(String)
  property output_modalities : Array(String)
  property prompt_text_token_price : Int32
  property prompt_image_token_price : Int32
  property completion_text_token_price : Int32
  property aliases : Array(String)
end
