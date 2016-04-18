require_relative "point_mixin"

class JoinPoint
  include Point_Mixin

  def initialize(condition)
    @condition = condition
  end

end