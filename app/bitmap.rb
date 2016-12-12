class Bitmap
  attr_reader :size_x, :size_y

  def initialize(size_x, size_y)
    @size_x = size_x
    @size_y = size_y
    create_and_init_matrix
  end

  def print_table
    @matrix.each do |row|
      puts row.each { |p| p }.join(" ")
    end

    return
  end

  def [](index)
    @matrix[index]
  end

  def do_zero_matrix
    (0...@size_y).each do |i|
      (0...@size_x).each do |j|
        @matrix[i][j] = 'O'
      end
    end
  end

  private
  def create_and_init_matrix
    allocate_matrix
    do_zero_matrix
  end

  def allocate_matrix
    @matrix = Array.new(@size_y)

    (0...@size_y).each do |i|
      @matrix[i] = Array.new(@size_x)
    end
  end
end