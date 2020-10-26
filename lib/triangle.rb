class Triangle
  attr_reader :m, :b, :l
  def initialize(m, b, l)
    @m = m
    @b = b
    @l = l
  end

  def kind 
    validate_triangle
    if m == b && b == l
      :equilateral
    elsif m == b || b== l || m == l
      :isosceles
    else 
      :scalene
    end
  end

  def validate_triangle
    real_triangle = [(m + b > l), (m + l > b) , (l + b > m)]
    [m, b, l].each do |side|
      real_triangle << false if side <= 0 
    raise TriangleError if real_triangle.include?(false)
    end
  end



  class TriangleError < StandardError
    # triangle error code
  end
end

