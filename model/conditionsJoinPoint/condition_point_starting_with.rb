require_relative "condition_point"

class ConditionPointStartingWith < ConditionPoint

  def satisfy(a_class, selector)
    selector.to_s.start_with? @condition
  end

end