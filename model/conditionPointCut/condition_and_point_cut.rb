class Condition_AndPointCut < Condition_pointCut
#voy a dejar lo dela lista, porque necesito tener los join en algun lado, tambine podria tener los como parametro, a ver desp
  def cumple(a_class,selector)
    @list.all? {|join| join.cumple a_class,selector} #no estoy seguro si es cumple.creo que si
  end

end