require 'rspec'
require_relative '../model/conditionPointCut/condition_point_cut_and'
require_relative '../model/conditionsJoinPoint/condition_point_for_classes'
require_relative '../model/conditionsJoinPoint/condition_point_starting_with'
require_relative '../model/extra_for_tests/sumador'
require_relative '../model/advise'
require_relative '../model/aspect'
require_relative '../model/point_cut'
require_relative '../model/Dsl/global_functions'
require_relative '../model/join_point'
describe 'Aspect' do

  before :each do
    @sum=Sumador.new 1
    code= Proc.new {@sum.mul 2}
    advise_before=Advise.new code,BeforeExecution.new
    advise_after=Advise.new code,AfterExecution.new


    conditionForClasses = ConditionPointForClasses.new [Sumador]
    join1 = JoinPoint.new conditionForClasses
    conditionStartingWith = ConditionPointStartingWith.new "plus"
    join2 = JoinPoint.new conditionStartingWith
    list = [join1,join2]
    conditionCutAnd = ConditionPointCutAnd.new list
    pointCut= PointCut.new conditionCutAnd

    @aspect= Aspect.new pointCut,advise_before,advise_after
  end

  it 'deberia afectar al metodo plus de la clase Sumador y al sumar 1 con 1 deberia multiplicar por 2 al inicio y al final dando 6 como resultado ' do

    @aspect.apply
    expect(@sum.plus 1).to eq 6
  end

  it 'deberia NO afectar al metodo plus de la clase Sumador y al sumar 1 con 1,  dando 2 como resultado ' do

    @aspect.apply
    expect(@sum.plus 1).to eq 6
    @aspect.unapply
    expect(@sum.plus 1).to eq 7
  end

end