class Condition_AndPointCut < Condition_pointCut

  def cumple(a_class,selector)
    @joins.all? {|join| join.affects_method? a_class,selector} #no estoy seguro si es cumple.creo que si
  end

end