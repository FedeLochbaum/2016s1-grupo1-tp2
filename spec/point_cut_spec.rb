require 'rspec'
require_relative '../model/conditionsJoinPoint/condition_point_for_arity'
require_relative '../model/conditionsJoinPoint/condition_point_starting_with'
require_relative '../model/conditionPointCut/condition_point_cut_and'
require_relative '../model/join_point'
require_relative '../model/point_cut'

describe 'PointCut con varios Join' do

  before :each do
    cpointArity = ConditionPointForArity.new 0
    join1 = JoinPoint.new(cpointArity)

    cpointName = ConditionPointStartingWith.new "affected_classes"
    join2 = JoinPoint.new(cpointName)

    conditionCutAnd = ConditionPointCutAnd.new [join2,join1]

    @PointCut = PointCut.new conditionCutAnd

  end

  it 'PointCut usa affected_classes devolviendo todas las clases afectadas' do
    expect(@PointCut.affected_classes).to match_array [PointCut, JoinPoint]
  end

  it 'PointCut usa affected_methods devolviendo todos los metodos afectados' do
    expect(@PointCut.affected_methods).to match_array [PointCut, :affected_classes, JoinPoint, :affected_classes]
  end

  it 'PointCut usa affected_method? devolviendo si afecta o no al metodo' do
    expect(@PointCut.affects_method? String, :to_s).to be false
  end

end