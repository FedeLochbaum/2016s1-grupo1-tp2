require 'condition_point'

class ConditionPoint_ForFirstName < ConditionPoint

  def cumple(a_class,selector)
    selector.to_s.start_with? @condition
  end

end