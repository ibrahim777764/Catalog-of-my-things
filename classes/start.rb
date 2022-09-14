require_relative './factory'
require_relative './options'

class Start
  def initialize
    @factory = Factory.new
  end

  def start
    loop do
      options
      input = gets.chomp
      @factory.handle_input(input)
    end
  end
end

start = Start.new
start.start
