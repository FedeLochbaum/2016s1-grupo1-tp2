require 'rspec'
require_relative '../model/conditionsJoinPoint/condition_point_for_classes'
require_relative '../model/conditionsJoinPoint/condition_point_starting_with'
require_relative '../model/conditionPointCut/condition_point_cut_not'
require_relative '../model/join_point'

describe 'Condition NOTcut con varios Join' do

  before :each do
    conditionForClasses = ConditionPointForClasses.new [Class]
    join1 = JoinPoint.new conditionForClasses
    @conditionNot = ConditionPointCutNot.new join1
  end

  it 'la ConditionNOT responde si un metodo de una clase, cumple' do
    expect(@conditionNot.satisfy(Class,:new)).to be false
  end

  it 'la ConditionNOT responde si un metodo de una clase, cumple' do
    expect(@conditionNot.satisfy(Class,:instance_method?)).to be true
  end
end