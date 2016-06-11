require 'rspec'
require_relative '../model/conditionsJoinPoint/condition_point_for_classes'
require_relative '../model/Dsl/global_functions'

describe 'Condition forClasses' do

  before :each do
    @joinPoint = ConditionPointForClasses.new [Class]
  end

  it 'la @conditionForClasses responde si un metodo de una clase, cumple' do
    expect(@joinPoint.satisfy(Class,:new)).to be true
  end

  it 'la @conditionForClasses responde si un metodo de una clase, cumple' do
    expect(@joinPoint.satisfy(String,:to_yaml)).to be false
  end

end