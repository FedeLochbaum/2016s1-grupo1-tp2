require 'condition_point_cut'

class Condition_or_point_cut < Condition_pointCut

  def cumple(a_class,selector)
    @joins.any? {|join| join.affects_method? a_class,selector} #lo mismo, no se si es cumple, pero asi es la idea
  end

end