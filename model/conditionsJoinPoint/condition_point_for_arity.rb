class ConditionPoint_ForArity < ConditionPoint

  def cumple(a_class,selector)
    selector.arity == @condition
  end


end