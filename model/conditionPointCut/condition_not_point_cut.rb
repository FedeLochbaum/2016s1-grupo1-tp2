require_relative "condition_point_cut"

class Condition_not_point_cut < Condition_pointCut

  def cumple(a_class,selector)
    not @joins.affects_method?(a_class,selector)
  end
end