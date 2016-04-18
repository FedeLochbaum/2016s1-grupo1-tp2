require_relative 'point_mixin'

class PointCut
  include Point_Mixin

  def initialize(condition)
    @condition = condition
  end

end