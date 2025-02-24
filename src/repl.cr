require "./kai"
require "./models/message"
require "./actions/completions"

class Kai::REPL
  @role : String = "user"
  @empty_count : Int32 = 0
  @messages : Array(Kai::Models::Message) = [] of Kai::Models::Message

  def initialize
    @empty_count = 0
    @messages = [] of Kai::Models::Message
  end

  def start
    puts "Welcome to the Kai REPL"

    loop do
      print "> "
      input = (gets || "").chomp

      if input.empty?
        @empty_count += 1
        if @empty_count >= 3
          puts "Exiting REPL mode due to 3 consecutive empty inputs."
          break
        end
        next
      else
        @empty_count = 0
      end

      if input == "clear"
        system("clear")
        next
      end
      if input == "exit"
        puts "Goodbye!"
        exit(0)
      end
      if input == "help"
        puts "Type 'clear' to clear the screen, 'exit' to quit, or a message to send it to Kai."
        print "You can also set the role with --role ROLE.\n"
        print "You can also set the model with --model MODEL.\n"
        next
      end

      message = Kai::Models::Message.new(role: @role, content: input)
      @messages << message
      response = Kai::Actions::Completions.new.send(@messages)

      puts response.choices.last.message.content
    end
  end
end
