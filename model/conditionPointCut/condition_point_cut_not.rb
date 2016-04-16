require_relative "condition_point_cut"

class ConditionPointCutNot < ConditionPointCut

  def satisfy(a_class, selector)
    not @joins.affects_method?(a_class,selector)
  end
end