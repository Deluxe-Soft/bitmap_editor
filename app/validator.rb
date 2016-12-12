require_relative 'monkey'

module Validator

  def vertical_test!(params)
    initialized?
    raise ArgumentError unless check_types(1,3, params) && check_intersect(params) && inequality(params[2], params[3]) && last_is_letter(params)
  end

  def horizontal_test!(params)
    initialized?
    raise ArgumentError unless check_types(1,3, params) && is_between?(params[1], 1, @matrix.size_x) && inequality(params[1], params[2]) && is_between?(params[3], 1, @matrix.size_y) && last_is_letter(params)
  end

  def init_test!(params)
    raise ArgumentError unless check_types(1,2, params) && is_between?(params[1], 1,250) && is_between?(params[2], 1,250)
    @initialized = true
  end

  def drawing_test!(params)
    initialized?
    raise ArgumentError unless check_types(1,2, params)  && check_intersect(params) && last_is_letter(params)
  end

  private

  def check_types(from, to, params)
    params[from, to].all?(&:is_integer?)
  end

  def is_between?(param, from, to)
    param.to_i.between?(from, to)
  end

  def check_intersect(params)
    is_between?(params[1], 1, @matrix.size_x) && is_between?(params[2], 1, @matrix.size_y)
  end

  def last_is_letter(params)
    params.last.between?('A', 'Z')
  end

  def inequality(p1, p2)
    p1.to_i <= p2.to_i
  end

  def initialized?
    raise ArgumentError, "Matrix already not initialized :( See HELP" unless @initialized
  end

end