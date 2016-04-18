require_relative '../model/extra_for_tests/class_and_selector_tuple'
module Point_Mixin

  def affected_classes
    allClasses.select {|klass| anySatisfy klass}
  end

  def anySatisfy(a_class)
    a_class.instance_methods.any? {|selector| affects_method?(a_class,selector)}
  end

  def affected_methods
    res = affected_methodsAndClasses.map {|tuple| tuple.selector}
  end

  def affected_methodsAndClasses
    res = []
    affected_classes.each {|klass| addSelectorsSatisfyingCondition(klass, res)}
    res
  end

  def addSelectorsSatisfyingCondition(a_class, list_to_fill)
    a_class.instance_methods.each {|selector| addIfSatisfy(selector, a_class, list_to_fill)}
  end

  def addIfSatisfy(selector, a_class, list_to_fill)
    if(affects_method? a_class,selector)
      list_to_fill.push(ClassAndSelectorTuple.new a_class,selector)
    end
  end

  def allClasses
    ObjectSpace.each_object(Class)
  end

  def affects_method?(a_class,selector)
    @condition.satisfy(a_class, selector)
  end

end