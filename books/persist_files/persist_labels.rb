require 'json'
module LabelsPersistence
  def store_labels(labels)
    data = []
    # file = './labels.json'
    # return unless File.exist?(file)

    labels.each do |label|
      data << { title: label.title, color: label.color }
    end
    File.write('./labels.json', JSON.generate(data))
  end

  def load_labels
    data = []
    file = './labels.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |label|
      data << Label.new(label['title'], label['color'])
    end
    data
  end
end
