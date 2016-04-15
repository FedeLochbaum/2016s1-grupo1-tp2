require_relative "condition_point"

class ConditionPoint_ForNameAndSet < ConditionPoint

  def cumple(a_class,selector)
    @condicion.any? {|name| selector.to_s.match(name)}
  end

end