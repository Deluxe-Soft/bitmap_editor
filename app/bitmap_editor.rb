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
          if @initialized
            @matrix.print_table
          else
            puts "Matrix already not initialized :( See HELP"
          end
        else
          tokenized_input = input.split(" ")
          first_letter = tokenized_input[0]

          case first_letter
            when 'I'
              size_x, size_y = tokenized_input[1], tokenized_input[2]
              @matrix = Bitmap.new(size_x.to_i, size_y.to_i)
              @initialized = true
            when 'L'
              if @initialized
                params = tokenized_input[1..3]
                @matrix.draw_pixel(*params)
              else
                puts "Matrix already not initialized :( See HELP"
              end
            when 'V'
              if @initialized
                params = tokenized_input[1..4]
                @matrix.draw_vert(*params)
              else
                puts "Matrix already not initialized :( See HELP"
              end
            when 'H'
              if @initialized
                params = tokenized_input[1..4]
                @matrix.draw_hor(*params)
              else
                puts "Matrix already not initialized :( See HELP"
              end
            when 'C'
              if @initialized
                @matrix.do_zero_matrix
              else
                puts "Matrix already not initialized :( See HELP"
              end
            else
              puts 'Unrecognised command :('
          end

      end
    end
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
end
