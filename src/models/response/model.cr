require "json"

class Kai::Model::Response::Model
  include JSON::Serializable
  include JSON::Serializable::Unmapped

  property id : String
  property object : String
  property created : Int32
  property owned_by : String
end