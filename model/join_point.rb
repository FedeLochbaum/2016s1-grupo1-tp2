class JoinPoint

  def initialize(condition)
    @condition = condition
  end

  def filtrarMetodos(a_class)
    a_class.instance_methods.filter {|selector| @condition.cumple(a_class,selector)}
  end



end