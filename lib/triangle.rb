require "pry"
class Triangle
  attr_reader :side1, :side2, :side3, :sides

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [side1, side2, side3]
  end

  def kind
    if self.invalid?
        raise TriangleError
    elsif self.equilateral?
      :equilateral
    elsif self.isosceles?
      :isosceles
    elsif self.scalene?
      :scalene
    end
  end

  def invalid?
    if (self.sides.any?{ |side| side <= 0} ||
      self.side1 + self.side2 <= side3 ||
      self.side2 + self.side3 <= side1 ||
      self.side3 + self.side1 <= side2)
      true
    end
  end

  def equilateral?
    true if sides.uniq.count == 1
  end

  def isosceles?
    true if sides.uniq.count == 2
  end

  def scalene?
    true if sides.uniq.count == 3
  end

  class TriangleError < StandardError
    def message
      "This is not a valid triangle!"
    end
  end
  # binding.pry
end