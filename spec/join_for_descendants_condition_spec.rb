require 'rspec'
require_relative '../model/conditionsJoinPoint/condition_point_for_descendants'

describe 'Condition @conditionForDescendants' do

  before :each do
    @conditionForDescendants = ConditionPointForDescendants.new Array

  end

  it 'la @@conditionForDescendants responde si un metodo de una clase, cumple' do
    expect(@conditionForDescendants.satisfy(Class,:new)).to be false
  end

  it 'la @@conditionForDescendants responde si un metodo de una clase, cumple' do
    expect(@conditionForDescendants.satisfy(String,:to_s)).to be true
  end
end