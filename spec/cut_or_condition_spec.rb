require 'rspec'
require_relative '../model/conditionsJoinPoint/condition_point_for_classes'
require_relative '../model/conditionsJoinPoint/condition_point_starting_with'
require_relative '../model/conditionPointCut/condition_point_cut_or'
require_relative '../model/join_point'

describe 'Condition ORcut con varios Join' do

  before :each do
    conditionForClasses = ConditionPointForClasses.new [Class]
    join1 = JoinPoint.new conditionForClasses
    conditionForStartingWith = ConditionPointStartingWith.new "new"
    join2 = JoinPoint.new conditionForStartingWith
    list = [join1,join2]
    @conditionOr = ConditionPointCutOr.new list
  end

  it 'la ConditionOR responde si un metodo de una clase, cumple' do
    expect(@conditionOr.satisfy(Class,:new)).to be true
  end

  it 'la ConditionOR responde si un metodo de una clase, cumple' do
    expect(@conditionOr.satisfy(Class,:instance_method?)).to be false
  end
end