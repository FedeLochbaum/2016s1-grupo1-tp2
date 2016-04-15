class Point_cut

  def initialize(condition)
    @condition = condition #condicion por la cual operar
  end

  def affected_classes

  end

  def affected_methods

  end

  def affects_method?(a_class,selector)
    @condition.cumple(a_class,selector)#ahora lo pono aca, pero es lo mismo que el join, estyo repitiendo logica, a refactorizar desp
  end




end