module Case                    
  def lower_case()
    @wordcram.lower_case()    
  end
  
  def upper_case()
    @wordcram.upper_case()    
  end
  
  def keep_case()
    @wordcram.keep_case()    
  end         
  
  def case(option)  
    case option
      when :lower
        lower_case()
      when :upper
        upper_case()
      when :default
        keep_case  
      end    
  end
end