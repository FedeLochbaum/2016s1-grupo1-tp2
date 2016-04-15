
cpointArity = ConditionPoint_ForArity.new(5)
join1 = JoinPoint.new(cpointArity)

cpointName = ConditionPoint_ForFirstName("test")
join2 = JoinPoint.new(cpointName)

list = [cpointArity,cpointName]

conditionCutAnd = Condition_AndPointCut(list)
cutAnd = Point_Cut.new(conditionCutAnd)

conditioncutNegado = Condition_not_point_cut(join1)
cutNeg = Point_Cut.new(conditioncutNegado)

#algo asi habria que hcer para instanciarse un cut