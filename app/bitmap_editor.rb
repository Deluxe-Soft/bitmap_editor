require_relative 'bitmap'
require_relative 'monkey'
require_relative 'uiactions'

class BitmapEditor

  include UiActions

  def run
    @running = true
    @initialized = false
    puts 'type ? for help'
    while @running
      print '> '

      input = gets.chomp
      tokenized = input.split(" ")
      first_letter = tokenized[0].upcase

      case first_letter
        when '?'
          show_help
        when 'X'
          exit_console
        when 'S'
          show_table
        when 'I'
          init_matrix(tokenized)
        when 'L'
          draw_single_pixel(tokenized)
        when 'V'
          draw_vertical_segment(tokenized)
        when 'H'
          draw_horizontal_segment(tokenized)
        when 'C'
          clear_table
        else
          puts 'Unrecognised command :('
      end

    end
  end

end
