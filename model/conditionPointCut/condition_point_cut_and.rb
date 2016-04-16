require_relative "condition_point_cut"

class ConditionPointCutAnd < ConditionPointCut

  def satisfy(a_class, selector)
    @joins.all? {|join| join.affects_method? a_class , selector}
  end

end