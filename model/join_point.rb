require_relative "point_mixin"

class JoinPoint
  include Point_Mixin
  attr_accessor :condition

  def initialize(condition)
    @condition = condition
  end

end