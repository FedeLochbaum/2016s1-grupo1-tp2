require_relative 'conditionsJoinPoint/condition_point_for_arity'
require_relative 'join_point'
require_relative 'conditionsJoinPoint/condition_point_for_first_name'
require_relative 'conditionPointCut/condition_and_point_cut'
require_relative 'point_cut'

cpointArity = ConditionPoint_ForArity.new(5)
join1 = JoinPoint.new(cpointArity)

cpointName = ConditionPoint_ForFirstName.new("a")
join2 = JoinPoint.new(cpointName)

list = [cpointArity,cpointName]

conditionCutAnd = Condition_AndPointCut.new(list)
cutAnd = Point_cut.new(conditionCutAnd)

conditioncutNegado = Condition_not_point_cut.new(join1)
cutNeg = Point_Cut.new(conditioncutNegado)

print (cutNeg.affected_classes)

#algo asi habria que hcer para instanciarse un cut