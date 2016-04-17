class ClassAndSelectorTuple
  attr_accessor :klass, :selector

  def initialize klass,selector
    @klass=klass
    @selector=selector
  end
end