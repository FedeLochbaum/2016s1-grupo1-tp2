class ClassAndSelectorTuple
  attr_accessor :klass, :selector

  def new klass,selector
    @klass=klass
    @selector=selector
  end
end