class Image
  
  def initialize (picture)
    @picture = picture
  end

  def output_image
    @picture.each do |row_of_pixels|
      puts row_of_pixels.join
    end
  end

  def blur
    @picture.each_with_index do |row, row_index|
      row.each_with_index do |pixel, column_index|
        if pixel == 1
          if row_index -1 >= 0
            @picture[row_index -1][column_index] = 1
          end 
          if row_index +1 < @picture.length
            @picture[row_index+1][column_index] = 1
          end 
          if column_index -1 >= 0
            @picture[row_index][column_index-1] = 1
          end 
          if column_index +1 < @picture[row_index].length
            @picture[row_index][column_index+1] = 1
          end
        end 
          self.output_image
          puts "----"
      end
    end
  end
  

end

image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 1],
[0, 0, 0, 0]
])

image.output_image
image.blur
image.output_image

