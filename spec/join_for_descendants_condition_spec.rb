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
    methodsDescendats=joinPoint.for_class(Integer).or_descendats.all_methods
    expect(methodsDescendats.size).to eq 64721
  end

  it 'creacion de un joinPoint con starting with' do

    methodsDescendatsWithStartingWith = joinPoint.for_class(Integer).or_descendats.methods starting_withh("foo")
    expect(methodsDescendatsWithStartingWith.size).to eq 0
  end

  it 'creacion de un joinPoint con in' do

    methodsDescendatsWithIn=joinPoint.for_class(Integer).or_descendats.methods inn("foo", "bar") #falta resolver esto
    expect(methodsDescendatsWithIn.size).to eq 0
  end


end