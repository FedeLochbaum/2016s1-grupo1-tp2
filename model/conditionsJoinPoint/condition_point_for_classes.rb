require_relative "condition_point"

class Condition_point_for_classes < ConditionPoint

  def cumple(a_class,selector)
    @condicion.any? {|iclass| iclass.instance_methods.include? selector}
  end

end