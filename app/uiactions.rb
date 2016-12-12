require_relative 'validator'

module UiActions

  include Validator

  public

  def clear_table
    initialized?
    @matrix.do_zero_matrix
  end

  def draw_horizontal_segment(params)
    horizontal_test!(params)
    @matrix.draw_hor(*params[1..4])
  end

  def draw_vertical_segment(params)
    vertical_test!(params)
    @matrix.draw_vert(*params[1..4])
  end


  def draw_single_pixel(params)
    drawing_test!(params)
    @matrix.draw_pixel(*params[1..3])
  end

  def init_matrix(params)
    init_test!(params)
    @matrix = Bitmap.new(*params[1,2])
  end

  def exit_console
    puts 'goodbye!'
    @running = false
  end

  def show_help
    puts "? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image
X - Terminate the session"
  end

  def show_table
    initialized?
    @matrix.print_table
  end

end