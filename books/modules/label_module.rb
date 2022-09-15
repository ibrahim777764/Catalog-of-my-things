require_relative '../label'
require_relative '../persist_files/persist_labels'
class LabelModule
  include LabelsPersistence
  def initialize
    @labels = load_labels || []
  end

  def list_labels
    if @labels.empty?
      puts 'There is no labels to display'
    else
      puts 'Here is the list of labels'
      puts
      @labels.each_with_index do |label, index|
        puts "#{index}) \"Title #{label.title}\"Color #{label.color}\""
      end
    end
  end
end
