require_relative '../model/conditionPointCut/condition_point_cut_and'
require_relative '../model/conditionsJoinPoint/condition_point_for_classes'
require_relative '../model/conditionsJoinPoint/condition_point_starting_with'
require_relative '../model/extra_for_tests/sumador'
require_relative '../model/advise'
require_relative '../model/aspect'
require_relative '../model/point_cut'
require_relative '../model/join_point'


@sum=Sumador.new 1
code= Proc.new { @sum.mul 2 }
advise_before=Advise.new code, BeforeExecution.new
advise_after=Advise.new code, AfterExecution.new

conditionForClasses = ConditionPointForClasses.new [Sumador]
join1 = JoinPoint.new conditionForClasses
conditionStartingWith = ConditionPointStartingWith.new "plus"
join2 = JoinPoint.new conditionStartingWith
list = [join1, join2]
conditionCutAnd = ConditionPointCutAnd.new list
pointCut= PointCut.new conditionCutAnd

@aspect= Aspect.new pointCut, advise_before
@aspect.apply
puts(Sumador.private_instance_methods(false))
@aspect.unapply
puts(Sumador.private_instance_methods(false))
