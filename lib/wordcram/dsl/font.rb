module Font                             
  def with_fonts( *fonts )
    @wordcram.with_fonts(*fonts)	
  end  
  
  def with_font( fonts )
    @wordcram.with_font(fonts)	
  end
end