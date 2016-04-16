require_relative "condition_point_cut"

class ConditionPointCutOr < ConditionPointCut

  def satisfy(a_class, selector)
    @joins.any? {|join| join.affects_method? a_class,selector} #lo mismo, no se si es cumple, pero asi es la idea
  end

end