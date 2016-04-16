class Sumador
  attr_accessor :summand
  def initialize summand
    @summand=summand
  end
  def plus number
    @summand=@summand+number
  end
  def mul number
    @summand= @summand*number
  end
end