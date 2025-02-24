require "json"

require "./choice"
require "./usage"

class Kai::Models::Completion
  include JSON::Serializable

  property id : String
  property object : String
  property created : Int32
  property model : String
  property choices : Array(Choice)
  property usage : Usage
  property system_fingerprint : String
end
