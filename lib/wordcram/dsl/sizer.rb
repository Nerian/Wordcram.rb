module Sizer     
  def sized_by_weight(options)
    @wordcram.sized_by_weight(options[:min], options[:max])    
  end
  
  def sized_by_rank(options)
    @wordcram.sized_by_rank(options[:min], options[:max])    
  end  
end