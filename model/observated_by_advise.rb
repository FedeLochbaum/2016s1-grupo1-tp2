module ObservatedByAdvise
  def addObserver(an_object)
   if @observers.nil?
     @observers=[]
   end
    @observers.push(an_object)
  end

  def observers
    @observers
  end
end