require "option_parser"

require "./kai"
require "./models/message"
require "./actions/completions"
require "./repl"

class Kai::CLI
  @role = "user"

  def self.run
    new.run
  end

  def run
    OptionParser.parse do |parser|
      parser.banner = "Usage: kai [options]"
      parser.on("-h", "--help", "Show this help message") do
        puts parser
        exit
      end

      parser.on("-v", "--version", "Show the version") do
        puts Kai::VERSION
        exit
      end
      
      parser.on("-r", "--role ROLE", "The role to send messages as") do |role|
        @role = role
      end

      # parser.on("-m", "--model MODEL", "The model to use") do |model|
      #   Kai::MODEL = model
      # end
      
      # parser.on("-s", "--stream", "Stream completions") do
      #   Kai::STREAM = true
      # end
      
      # parser.on("-t", "--temperature TEMPERATURE", "The temperature to use") do |temperature|
      #   Kai::TEMPERATURE = temperature.to_f32
      # end

      parser.on("--repl", "Start the REPL") do
        Kai::REPL.new.start
      end
    end
  end
end

Kai::CLI.run
