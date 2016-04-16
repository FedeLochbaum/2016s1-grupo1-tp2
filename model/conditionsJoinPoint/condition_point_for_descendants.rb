require_relative "condition_point"

class ConditionPointForDescendants < ConditionPoint

  def satisfy(a_class, selector)#aca la condition es una clase, y agarro todos sus descencientes
    des = ObjectSpace.each_object(Class).select {|klass| klass < @condition_rule}
    des.push(@condition_rule)
    des.any? {|klass| klass.instance_methods.include? selector}

  end

end