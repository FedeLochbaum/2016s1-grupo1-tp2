require_relative '../../model/join_point'
require_relative '../../model/conditionsJoinPoint/condition_point_for_descendants'
require_relative '../../model/conditionsJoinPoint/condition_point_for_classes'

def joinPoint
  joinPointB = JoinPointBuilder.new
  joinPointB
end


class JoinPointBuilder
  attr_accessor :joinPoint,:klasses

  def initialize
    @joinPoint = JoinPoint.new nil
  end

  def any_class
    for_class Class
  end

  def for_class klazz
    @klasses = klazz
    for_classes [klazz]
  end

  def for_classes list
    @joinPoint.condition = ConditionPointForClasses.new list
    self
  end

  def or_descendats
    @joinPoint.condition = ConditionPointForDescendants.new @klasses
    self
  end

  def all_methods
    @joinPoint.affected_methods
  end


end