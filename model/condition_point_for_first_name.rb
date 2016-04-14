class ConditionPoint_ForFirstName
  attr_accessor :condition

  def initialize(condition)
    @condition = condition
  end

  def cumple(a_class,selector)
    selector.to_s.start_with? @condition
  end

end