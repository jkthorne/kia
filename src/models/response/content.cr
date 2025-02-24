require "json"

class Kai::Model::Response::Content
  include JSON::Serializable
  include JSON::Serializable::Unmapped

  property type : String
  property text : String
end
