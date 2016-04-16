require 'rspec'
require_relative  '../model/advise'
require_relative '../model/extra_for_tests/sumador'


describe 'Advise' do

  before :each do
    @sum=Sumador.new 1
    code= Proc.new {@sum.mul 2}
    @advise=Advise.new code,BeforeExecution.new
  end

  it 'Al sumarle 1 a 1, deberia dar 3 por que antes se multiplicaria por 2 al 1' do

    @advise.apply_to(Sumador,:plus)
    expect(@sum.plus 1).to eq 3
  end

  it 'Al sumarle 1 a 1, deberia dar 4 por que despues se multiplicaria por 2 al resultado' do

    @advise.when_execution =AfterExecution.new
    @advise.apply_to(Sumador,:plus)
    expect(@sum.plus 1).to eq 4
  end

end