class Advise
attr_accessor :code, :when
  def initialize(a_code,when_to_execute)
    @code=a_code
    @when_execution= when_to_execute
  end

  def apply_to a_class,a_selector
     a_class.extend(ObservatedByAdvise).addObserver(self)
     new_selector = "#{self}_#{a_selector.to_s}".to_sym

     a_class.send :alias_method, new_selector, a_selector
     a_class.send :private, new_selector
     a_class.send :define_method, a_selector, self.excute_code(a_class, new_selector, code)
  end

  def execute_code a_class, a_selector, a_block
    when_execution.execute_code a_class, a_selector, a_block
  end


end