module Kai
  VERSION = "0.1.0"

  enum Model
    Grok2Latest = 0

    def self.from_s(str : String) : Model
      case str
      when "grok-2-latest"
        Grok2Latest
      else
        raise ArgumentError.new("Unknown model: #{str}")
      end
    end

    def to_s : String
      case self
      when Grok2Latest
        "grok-2-latest"
      else
        raise "BUG: Unhandled enum value #{super}"
      end
    end
  end
  
  MODEL       = Model::Grok2Latest
  STREAM      = false
  TEMPERATURE = 0.0
end
