require_relative 'point_mixin'

class PointCut
  include Point_Mixin
  attr_accessor :condition

  def initialize(condition)
    @condition = condition
  end

end