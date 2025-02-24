require "json"

class Kai::Model::Response::ApiKey
  include JSON::Serializable
  include JSON::Serializable::Unmapped

  property redacted_api_key : String
  property user_id : String
  property name : String
  property create_time : String
  property modify_time : String
  property modified_by : String
  property team_id : String
  property acls : Array(String)
  property api_key_id : String
  property team_blocked : Bool
  property api_key_blocked : Bool
  property api_key_disabled : Bool
end
