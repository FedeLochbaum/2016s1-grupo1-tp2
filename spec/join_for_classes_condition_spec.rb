require 'rspec'
require_relative '../model/conditionsJoinPoint/condition_point_for_classes'

describe 'Condition forClasses' do

  before :each do
    @conditionForClasses = ConditionPointForClasses.new [Class]

  end

  it 'la @conditionForClasses responde si un metodo de una clase, cumple' do
    expect(@conditionForClasses.satisfy(Class,:new)).to be true
  end

  it 'la @conditionForClasses responde si un metodo de una clase, cumple' do
    expect(@conditionForClasses.satisfy(String,:to_yaml)).to be false
  end
end