class ConditionPoint_ForNameAndSet < Condition
    attr_accessor :condition

  def initialize(condition)
    @condition = condition
  end

  def cumple(a_class,selector)
    selector.to_s.match(@condicion) #aca la condition es el nombre a filtrar.
  end

  def cumple(a_class,selectors)
    selectors.all? {|selector| cumple(a_class,selector)}
  end

end