class NeoTable

  def self.construct(asteroids)
    @asteroids = asteroids
    puts divider
    puts header
    create_rows(@asteroids, column_data)
    puts divider
  end

  def self.column_data
    column_labels.each_with_object({}) do |(col, label), hash|
      hash[col] = {
        label: label,
        width: [@asteroids.map { |astroid| astroid[col].size }.max, label.size].max}
    end
  end
    
  def self.column_labels
    { name: "Name", diameter: "Diameter", miss_distance: "Missed The Earth By:" }
  end
  
  def self.divider
    "+-#{column_data.map { |_,col| "-"*col[:width] }.join('-+-') }-+"
  end 

  def self.header
    "| #{ column_data.map { |_,col| col[:label].ljust(col[:width]) }.join(' | ') } |"
  end

  def self.format_row_data(row_data, column_info)
    row = row_data.keys.map { |key| row_data[key].ljust(column_info[key][:width]) }.join(' | ')
    puts "| #{row} |"
  end

  def self.create_rows(astroid_data, column_info)
    rows = astroid_data.each { |astroid| format_row_data(astroid, column_info) }
  end

end