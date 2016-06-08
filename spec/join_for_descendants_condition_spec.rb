require 'rspec'
require_relative '../model/conditionsJoinPoint/condition_point_for_descendants'
require_relative '../model/Dsl/global_functions'
require_relative '../model/join_point'

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

  it 'creacion de un joinPoint de descendencia con el Dsl' do
    methodsDescendats=joinPoint.for_class(Array).or_descendats.all_methods
    expect(methodsDescendats.size).to eq 68210

    #methodsDescendatsWithIn=joinPoint.for_class(JoinPoint).or_descendats.methods #in ("foo", "bar") #falta resolver esto
    #expect(methodsDescendatsWithIn.size).to eq 63309
  end


end