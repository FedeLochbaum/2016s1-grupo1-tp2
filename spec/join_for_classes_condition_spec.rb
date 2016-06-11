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

  it 'test de joinPoint de dsl ' do
    methodsAnyClass = joinPoint.any_class.all_methods
    expect(methodsAnyClass.size).to eq 64083

    methodsClass = joinPoint.for_class(Integer).all_methods
    expect(methodsClass.size).to eq 64194

    methodsClasses = joinPoint.for_classes([JoinPoint, Integer]).all_methods
    expect(methodsClasses.size).to eq 64204
  end
end