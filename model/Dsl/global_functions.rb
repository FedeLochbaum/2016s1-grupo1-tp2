require_relative '../../model/join_point'
require_relative '../../model/advise'
require_relative '../../model/point_cut'
require_relative '../../model/aspect'
require_relative '../../model/conditionsJoinPoint/condition_point_for_descendants'
require_relative '../../model/conditionsJoinPoint/condition_point_for_classes'
require_relative '../../model/conditionPointCut/condition_point_cut_or'
require_relative '../../model/conditionPointCut/condition_point_cut_and'
require_relative '../../model/conditionsJoinPoint/conditionPoint_ForNameAndSet'
require_relative '../../model/conditionsJoinPoint/condition_point_starting_with'
require_relative '../../model/conditionPointCut/condition_point_cut_not'

def joinPoint
  JoinPointBuilder.new
end
def advise
  AdviseBuilder.new
end
def In *words
  ConditionPointMatchingName.new words
end
def startingWith word
  ConditionPointStartingWith.new word
end
class AdviseBuilder
  attr_accessor :advise,:aspect

  def initialize
    @advise= Advise.new nil,nil
    @aspect=Aspect.new nil,nil
  end

  def declare &block
    instance_eval &block
    @aspect.addIfNotNil @advise
    @aspect
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
  #def in(*words)
  #  ConditionPointMatchingName.new words
  #end
  #def starting_with word
  #  ConditionPointStartingWith.new word
  #end

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
    self
  end

  def methods condition
    condition1 = JoinPoint.new @joinPoint.condition
    condition2 = JoinPoint.new condition
    @joinPoint.condition = ConditionPointCutAnd.new [condition1,condition2]
    self
  end

  def | (joinPointBuilder)
     PointCut.new (ConditionPointCutOr.new [@joinPoint,joinPointBuilder.joinPoint])
  end

  def & joinPointBuilder
   PointCut.new (ConditionPointCutAnd.new [@joinPoint,joinPointBuilder.joinPoint])
  end




end