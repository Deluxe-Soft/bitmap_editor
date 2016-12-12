require_relative 'bitmap'

class BitmapEditor

  def run
    @running = true
    @initialized = false
    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp
      case input
        when '?'
          show_help
        when 'X'
          exit_console
        when 'S'
          show_table
        else
          tokenized_input = input.split(" ")
          first_letter = tokenized_input[0]

          case first_letter
            when 'I'
              init_matrix(tokenized_input)
            when 'L'
              draw_single_pixel(tokenized_input)
            when 'V'
              draw_vertical_segment(tokenized_input)
            when 'H'
              draw_horizontal_segment(tokenized_input)
            when 'C'
              clear_table
            else
              puts 'Unrecognised command :('
          end

      end
    end
  end

  def clear_table
    if @initialized
      @matrix.do_zero_matrix
    else
      puts "Matrix already not initialized :( See HELP"
    end
  end

  def draw_horizontal_segment(params)
    if @initialized
      params = params[1..4]
      @matrix.draw_hor(*params)
    else
      puts "Matrix already not initialized :( See HELP"
    end
  end

  def draw_vertical_segment(params)
    if @initialized
      params = params[1..4]
      @matrix.draw_vert(*params)
    else
      puts "Matrix already not initialized :( See HELP"
    end
  end

  def draw_single_pixel(params)
    if @initialized
      params = params[1..3]
      @matrix.draw_pixel(*params)
    else
      puts "Matrix already not initialized :( See HELP"
    end
  end

  def init_matrix(params)
    size_x, size_y = params[1], params[2]
    @matrix = Bitmap.new(size_x.to_i, size_y.to_i)
    @initialized = true
  end

  private
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
      if @initialized
        @matrix.print_table
      else
        puts "Matrix already not initialized :( See HELP"
      end
    end
end
