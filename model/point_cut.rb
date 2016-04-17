require_relative 'point_mixin'

class PointCut
  include Point_Mixin
#Esta identico a JoinPoint, inclusive parece no ser necesario la existencia de estas dos clases, busquemos una forma de de darle sentido a estas clases o saquemoslas
  def initialize(condition)
    @condition = condition
  end

end