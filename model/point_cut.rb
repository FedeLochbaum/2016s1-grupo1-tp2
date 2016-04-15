require 'point_mixin'
class Point_cut
  include Point_Mixin

  def initialize(condition)
    @condition = condition
  end

end