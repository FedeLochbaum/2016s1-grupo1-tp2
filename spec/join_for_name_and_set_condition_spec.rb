require 'rspec'
require_relative '../model/conditionsJoinPoint/conditionPoint_ForNameAndSet'

describe 'Condition @conditionForNameAndSet' do

  before :each do
    @conditionForNameAndSet = ConditionPointMatchingName.new ["n","a"]

  end

  it 'la @conditionForNameAndSet responde si un metodo de una clase, cumple' do
    expect(@conditionForNameAndSet.satisfy(Class,:new)).to be true
  end

  it 'la @conditionForNameAndSet responde si un metodo de una clase, cumple' do
    expect(@conditionForNameAndSet.satisfy(String,:to_s)).to be false
  end
end