class Condition_or_point_cut < Condition_pointCut

  def cumple(a_class,selector)
    @list.any? {|join| join.cumple a_class,selector} #lo mismo, no se si es cumple, pero asi es la idea
  end

end