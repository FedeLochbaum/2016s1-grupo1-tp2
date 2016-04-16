require_relative "condition_point"

class ConditionPointMatchingName < ConditionPoint

  def satisfy(a_class, selector)
    @condicion.any? {|name| selector.to_s.match(name)}
  end

end