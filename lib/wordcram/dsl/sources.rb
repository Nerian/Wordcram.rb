module Sources 

  def from(options = {} )
    key = options.keys.first
    value = options.values.first
    case key
      when :text_string
        from_text_string(value)
      when :text_file
        from_text_file(value)
      when :web_url
        from_web_page(value) 
      when :html_file
        from_html_file(value) 
      when :html_string
        from_html_string(value)
      else
        raise "Invalid Input. Options: :text_string, :text_file, :web_url, :html_file, :html_string"     
    end       
  end
  
  def from_text_string(text)                          
    @wordcram.from_text_string(text)
  end      
  
  def from_web_page(url)
    @wordcram.from_web_page(url)    
  end
  
  def from_html_file(path)
    @wordcram.from_html_file(path)    
  end                            
  
  def from_html_string(html_string)
    @wordcram.from_html_string(html_string)    
  end                         
  
  def from_text_file(path)                     
    @wordcram.from_text_file(path)        
  end
  
end