require_relative '../model/before_execution'
require_relative '../model/after_execution'
require_relative '../model/observated_by_advise'
class Advise

attr_accessor :code, :when_execution
  def initialize(a_code,when_to_execute)
    @code=a_code
    @when_execution= when_to_execute
  end

  def apply_to a_class,a_selector
     a_class.extend(ObservatedByAdvise).addObserver(self)
     #la idea es hacerlo a traves de observer, falta esta parte por ahora
       new_selector = "#{self}_#{a_selector.to_s}".to_sym
     if not(a_class.instance_methods.include? new_selector)
       a_class.send :alias_method, new_selector, a_selector
       a_class.send :private, new_selector
       a_class.send :define_method, a_selector, execute_code(a_class, new_selector, code)
     end
  end

  def unapply_to a_class,a_selector
    dif = "#{self}_#"
    str = a_selector.to_s
    old_selector = (str[dif.chars.length,str.chars.length]).to_sym
    a_class.send :alias_method, old_selector, a_selector
    a_class.send :private, old_selector
  end

  def execute_code a_class, a_selector, a_block
    when_execution.execute_code a_class, a_selector, a_block
  end


end