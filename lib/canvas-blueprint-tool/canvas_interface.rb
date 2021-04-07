class CanvasInterface

  def self.associate(options)
    puts "Associating course #{options[:course_id]} with blueprint course #{options[:blueprint_id]}"
  end

  def self.publish(options)
    puts "Publishing course #{options[:course_id]}"
  end
end