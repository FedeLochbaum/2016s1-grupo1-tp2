require_relative 'conditionsJoinPoint/condition_point_for_arity'
require_relative 'join_point'
require_relative 'conditionsJoinPoint/condition_point_for_first_name'
require_relative 'conditionPointCut/condition_and_point_cut'
require_relative 'conditionPointCut/condition_not_point_cut'
require_relative 'point_cut'
require_relative 'conditionPointCut/condition_or_point_cut'

cpointArity = ConditionPoint_ForArity.new(1)
join1 = JoinPoint.new(cpointArity)

cpointName = ConditionPoint_ForFirstName.new("get")
join2 = JoinPoint.new(cpointName)

list = [join1,join2]

conditionCutAnd = Condition_AndPointCut.new(list)
cutAnd = Point_cut.new(conditionCutAnd)

conditioncutNegado = Condition_not_point_cut.new(join1)
cutNeg = Point_cut.new(conditioncutNegado)

listOr = [cutNeg,cutAnd]

conditionCutOr = Condition_or_point_cut.new(listOr)
cutOr = Point_cut.new(conditionCutOr)

print (cutAnd.affected_classes)
#print (cutNeg.affected_methods)
#print (cutNeg.affects_method? Point_cut,:affected_classes)
#print (cutOr.affected_methods)

#comenta el que quieras, es mas que nada para que veas un unico resultado