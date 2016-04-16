require_relative "condition_point"

class ConditionPointForClasses < ConditionPoint

  def satisfy(a_class, selector)
    @condition_rule.any? {|klass| klass.instance_methods.include? selector}
  end

end