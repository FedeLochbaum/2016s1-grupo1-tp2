require 'rspec'
require_relative '../model/conditionsJoinPoint/condition_point_starting_with'

describe 'Condition @conditionForStartingWith' do

  before :each do
    @conditionForStartingWith = ConditionPointStartingWith.new "to_"

  end

  it 'la @@conditionForStartingWith responde si un metodo de una clase, cumple' do
    expect(@conditionForStartingWith.satisfy(Class,:new)).to be false
  end

  it 'la @@conditionForStartingWith responde si un metodo de una clase, cumple' do
    expect(@conditionForStartingWith.satisfy(String,:to_yaml)).to be true
  end
end