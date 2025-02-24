require "json"

require "./message"

class Kai::Models::Choice
  include JSON::Serializable
  include JSON::Serializable::Unmapped

  property index : Int32
  property message : Kai::Models::Message
  property finish_reason : String
end
