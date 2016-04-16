require_relative 'conditionsJoinPoint/condition_point_for_arity'
require_relative 'join_point'
require_relative 'conditionsJoinPoint/condition_point_starting_with'
require_relative 'conditionPointCut/condition_point_cut_and'
require_relative 'conditionPointCut/condition_point_cut_not'
require_relative 'point_cut'
require_relative 'conditionPointCut/condition_point_cut_or'

cpointArity = ConditionPointForArity.new(1)
join1 = JoinPoint.new(cpointArity)

cpointName = ConditionPointStartingWith.new("get")
join2 = JoinPoint.new(cpointName)

list = [join1,join2]

conditionCutAnd = ConditionPointCutAnd.new(list)
cutAnd = Point_cut.new(conditionCutAnd)

conditioncutNegado = ConditionPointCutNot.new(join1)
cutNeg = Point_cut.new(conditioncutNegado)

listOr = [cutNeg,cutAnd]

conditionCutOr = ConditionPointCutOr.new(listOr)
cutOr = Point_cut.new(conditionCutOr)

#print (cutAnd.affected_classes)
#print (cutNeg.affected_methods)
#print (cutNeg.affects_method? Point_cut,:affected_classes)
#print (cutOr.affected_methods)

#comenta el que quieras, es mas que nada para que veas un unico resultado