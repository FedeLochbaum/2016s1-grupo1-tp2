require_relative '../model/when_execution'
class AfterExecution < WhenExecution

  def execute_code a_class, a_selector, a_block
    case (a_class.instance_method a_selector).arity
      #Asumo que solo sirve para 0 o 1 parametros
      when 0  then Proc.new { self.send(a_selector); a_block.call}
      when 1  then Proc.new {|x|  self.send(a_selector, x); a_block.call}
      else Proc.new{a_block.call}
    end
  end
end