require_relative "condition_point"

class ConditionPoint_ForArity < ConditionPoint

  def cumple(a_class,selector)
    (a_class.instance_method selector).arity == @condition
  end


end