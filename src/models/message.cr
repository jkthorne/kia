require "json"

class Kai::Models::Message
  include JSON::Serializable
  include JSON::Serializable::Unmapped

  property role : String
  property content : String

  def initialize(@role : String, @content : String)
  end
end
