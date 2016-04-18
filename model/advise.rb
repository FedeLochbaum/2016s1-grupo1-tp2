require_relative '../model/before_execution'
require_relative '../model/after_execution'
class Advise

attr_accessor :code, :when_execution
  def initialize(a_code,when_to_execute)
    @code=a_code
    @when_execution= when_to_execute
  end

  def apply_to a_class,a_selector
       new_selector = "#{self}_#{a_selector.to_s}".to_sym
     if not(classIncludeMethod a_class,new_selector)
       a_class.send :alias_method, new_selector, a_selector
       a_class.send :private, new_selector
       a_class.send :define_method, a_selector, execute_code(a_class, new_selector, code)
     end
  end

  def classIncludeMethod a_class,a_selector
    a_class.private_instance_methods.include? a_selector
  end

  def unapply_to a_class,a_selector
    methods=(a_class.private_instance_methods).select{|selector| (selector.to_s).end_with?("_#{a_selector.to_s}")}

    if (not methods.empty?)
      a_class.send :public, methods[0]
      a_class.send :public, a_selector
      a_class.send :define_method, a_selector ,(a_class.send :instance_method , methods[0])
      methods.each {|met|a_class.send :remove_method, met}
    end
  end

  def execute_code a_class, a_selector, a_block
    when_execution.execute_code a_class, a_selector, a_block
  end


end