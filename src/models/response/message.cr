require "json"

class Kai::Model::Response::Message
  include JSON::Serializable
  include JSON::Serializable::Unmapped

  property id : String
  property type : String
  property role : String
  property content : Array(Kai::Model::Response::Content)
  property model : String
  property stop_reason : String
  property stop_squence : String
  property usage : Usage
end
