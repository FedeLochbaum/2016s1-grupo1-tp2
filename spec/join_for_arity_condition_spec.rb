require 'rspec'
require_relative '../model/conditionsJoinPoint/condition_point_for_arity'
require_relative '../model/join_point'

describe 'Condition forArity' do

  before :each do
    @conditionForArity = ConditionPointForArity.new 0
  end

  it 'la ConditionforArity responde si un metodo de una clase, cumple' do
    expect(@conditionForArity.satisfy(String,:to_s)).to be true
  end

  it 'la ConditionforArity responde si un metodo de una clase, cumple' do
    expect(@conditionForArity.satisfy(String,:to_enum)).to be false
  end
end