require 'rspec'
require_relative '../model/conditionsJoinPoint/condition_point_for_descendants'
require_relative '../model/Dsl/global_functions'
require_relative '../model/conditionPointCut/condition_point_cut_and'
require_relative '../model/conditionsJoinPoint/condition_point_for_classes'
require_relative '../model/conditionsJoinPoint/condition_point_starting_with'
require_relative '../model/extra_for_tests/sumador'
require_relative '../model/advise'
require_relative '../model/aspect'
require_relative '../model/point_cut'
require_relative '../model/join_point'
describe 'My behaviour' do

  before :each do
    @sum=Sumador.new 1
  end

  it 'test de joinPoint de dsl ' do
    joinPointVar = joinPoint.any_class.all_methods.joinPoint
    expect(joinPointVar.affected_methods.size).to be_between 0 ,65000

    joinPointVar2 = joinPoint.for_class(Integer).all_methods.joinPoint
    expect(joinPointVar2.affected_methods.size).to be_between 0 ,65000

    joinPointVar3 = joinPoint.for_classes([JoinPoint, Integer]).all_methods.joinPoint
    expect(joinPointVar3.affected_methods.size).to be_between 0 ,65000
  end

  it 'creacion de un joinPoint de descendencia con el Dsl' do
    joinPointVar=joinPoint.for_class(Integer).or_descendats.all_methods.joinPoint
    expect(joinPointVar.affected_methods.size).to be_between 0,66000
  end

  it 'creacion de un joinPoint con starting with' do

    joinPointVar = (joinPoint.for_class(Integer).or_descendats.methods starting_withh("int")).joinPoint
    expect(joinPointVar.affected_methods.size).to eq 8
  end

  it 'creacion de un joinPoint con in' do

    joinPointVar=(joinPoint.for_class(Integer).or_descendats.methods inn("times", "succ")).joinPoint
    expect(joinPointVar.affected_methods.size).to eq 13
  end

  it 'creacion de un PointCut con or' do

    pointCutVar= joinPoint.for_class(Sumador)
                     .all_methods |
                      (joinPoint.for_class(Sumador)
                           .methods starting_withh("plus"))
    expect(pointCutVar.affected_methods.size).to be_between 0 ,65000
  end

  it 'creacion de un PointCut con and' do

    pointCutVar= joinPoint.for_class(Sumador)
                     .all_methods &
                      (joinPoint.for_class(Sumador)
                           .methods starting_withh("plus"))
    expect(pointCutVar.affected_methods.size).to eq 1
  end


  it 'creacion de aspecto con before' do
    aspect=
        advise.declare do
          before do
            for_class(Sumador).all_methods & (for_class(Sumador).methods starting_withh("plus"))
          end
          execute do
            @sum.mul 2
          end
        end

    aspect.apply

    expect(@sum.plus 1).to eq 3

  end


end