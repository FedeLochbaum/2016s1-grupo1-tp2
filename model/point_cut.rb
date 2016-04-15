class Point_cut

  def initialize(condition)
    @condition = condition #condicion por la cual operar
  end

  def affected_classes
    obtenerTodasLasClases.filter {|a_class| algunoCumple a_class}
  end

  def algunoCumple(a_class)
    a_class.instance_methods.any? {|selector| affects_method?(a_class,selector)}
  end

  def affected_methods
      res = []
      obtenerTodasLasClases.each {|a_class| agregarSelectoresQueCumplen(a_class,res)}
      res
  end

  def agregarSelectoresQueCumplen(a_class,lista)
    a_class.instance_methods.each {|selector| agregaSiCumple(selector,a_class,lista)}
  end

  def agregaSiCumple(selector,a_class,lista)
    if(affects_method? a_class,selector)
      lista.add(a_class,selector)
    end
  end

  def obtenerTodasLasClases
    ObjectSpace.each_object(Class)
  end

  def affects_method?(a_class,selector)
    @condition.cumple(a_class,selector)#ahora lo pono aca, pero es lo mismo que el join, estyo repitiendo logica, a refactorizar desp
  end




end