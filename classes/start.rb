require_relative './factory'

def start
    factory = Factory.new
    loop do
        factory.display_list
        option = gets.chomp.to_i
        break if option == 11
        factory.dispatch(option)
    end
    factory.on_exit
end
start