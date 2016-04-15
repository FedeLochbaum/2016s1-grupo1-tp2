require_relative "condition_point"

class Condition_point_for_heritage < ConditionPoint

  def cumple(a_class,selector)#aca la condition es una clase, y agarro todos sus descencientes
    des = ObjectSpace.each_object(Class).select {|iclass| iclass <= @condition} #OJO, no se si <= me dice si es decenciente de. hay que preguntar
    des.any? {|classDes| classDes.instance_methods.include? selector}
  end

end