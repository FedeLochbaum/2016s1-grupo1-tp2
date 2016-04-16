require_relative '../model/join_point'
require_relative '../model/point_cut'
require_relative '../model/advice'

class Aspect

  attr_accessor :interest_point, :advises

  def initialize(interest_point, advise1, advise2=nil)
    @interest_point = interest_point
    @advises = []
    addIfNotNil(advise1)
    addIfNotNil(advise2)
  end
  def addIfNotNil advise
    if not advise.nil?
      advises.push(advise)
    end
  end
  def apply
    advises.each {|adv| apply_advise_to_methods adv,interest_point.affected_methods}
  end
  def apply_advise_to_methods advise,class_and_method_tuples
    class_and_method_tuples.each {|tuple| advise.apply_to tuple.klass,tuple.selector}
  end
end