class JoinPoint

  def initialize(condition)
    @condition = condition
  end

  def filtrarMetodos(a_class)
    a_class.instance_methods.filter {|selector| @condition.cumple(a_class,selector)}#no estoy seguro si el filtrado se ahce aca
  end

  def affects_method?(a_class,selector)
    @condition.cumple(a_class,selector)
  end



end