require 'json'
module LabelsPersistence
  def store_labels(labels)
    data = []
    labels.each do |label|
      data << { title: label.title, color: label.color }
    end
    File.write('./json_files/labels.json', JSON.generate(data))
  end

  def load_labels
    data = []
    file = './json_files/labels.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |label|
      data << Label.new(label['title'], label['color'])
    end
    data
  end
end
