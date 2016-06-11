require_relative '../../model/join_point'
require_relative '../../model/conditionsJoinPoint/condition_point_for_descendants'
require_relative '../../model/conditionsJoinPoint/condition_point_for_classes'
require_relative '../../model/conditionPointCut/condition_point_cut_or'
require_relative '../../model/conditionPointCut/condition_point_cut_and'
require_relative '../../model/conditionsJoinPoint/conditionPoint_ForNameAndSet'
require_relative '../../model/conditionsJoinPoint/condition_point_starting_with'

def joinPoint
  JoinPointBuilder.new
end
def advise
  AdviseBuilder.new
end
def inn(*words)
  ConditionPointMatchingName.new words
end
def starting_withh word
  ConditionPointStartingWith.new word
end
class AdviseBuilder
  attr_accessor :advise

  def initialize
    @advise= Advise.new nil,nil
    @aspect=Aspect.new nil,nil
  end

  def declare &block
    instance_eval &block
    @aspect.addIfNotNil @advise
    @aspect.apply
  end
  def before &block
     @advise.when_execution = BeforeExecution.new
     @aspect.interest_point = instance_eval(&block)
  end
  def after &block
    @advise.when_execution = AfterExecution.new
    @aspect.interest_point = instance_eval(&block)
  end
  def execute &block
    @advise.code = Proc.new &block
  end

  def for_class a_class
    joinPoint.for_class a_class
  end


end
###########################################
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
    condition1 = JoinPoint.new @joinPoint.condition
    condition2 = JoinPoint.new ConditionPointForDescendants.new @klasses
    @joinPoint.condition = ConditionPointCutOr.new [condition1,condition2]
    self
  end

  def all_methods
    @joinPoint.affected_methods
  end

  def methods condition
    condition1 = JoinPoint.new @joinPoint.condition
    condition2 = JoinPoint.new condition
    @joinPoint.condition = ConditionPointCutAnd.new [condition1,condition2]
    all_methods
  end
#Estos dos puede ir aca o en JoinPoint , segun que decidamos que hacen los demas metodos que tenemos dudas.
  def or joinPoint
     PoinCut.new ConditionPointCutOr @joinPoint,joinPoint
  end

  def and joinPoint
    PoinCut.new ConditionPointCutAnd @joinPoint,joinPoint
  end


end