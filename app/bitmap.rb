class Bitmap
  attr_reader :size_x, :size_y

  def initialize(size_x, size_y)
    @size_x = size_x
    @size_y = size_y
    create_and_init_matrix
  end

  def print_table
    @matrix.each do |row|
      puts row.each { |p| p }.join('')
    end

    return
  end

  def [](index)
    @matrix[index]
  end

  def draw_pixel(x, y, col)
    x = x.to_i - 1
    y = y.to_i - 1

    self[y][x] = col
  end

  def draw_vert(x, y1, y2, col)
    for y in (y1..y2)
      draw_pixel(x,y, col)
    end
  end

  def draw_hor(x1, x2, y, col)
    for x in (x1..x2)
      draw_pixel(x,y, col)
    end
  end

  def do_zero_matrix
    (1..@size_x).each do |j|
      (1..@size_y).each do |i|
        draw_pixel(j,i, "O")
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