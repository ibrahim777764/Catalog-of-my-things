require_relative '../label'

module LabelModule
  def list_labels
    if @labels.empty?
      puts 'There is no labels to display'
    else
      puts 'Here is the list of labels'
      puts
      @labels.each_with_index do |label, index|
        puts "#{index}) \"#{label.title}\""
      end
    end
  end
end
