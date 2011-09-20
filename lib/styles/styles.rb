class Wordcram
  module Style

    #######################
    # Angler
    #######################

    def angled_at(angle)
      wordcram.angled_at(angle)
    end

    def angled_between(from, to)
      wordcram.angled_between(from, to)
    end


    #######################
    # Case
    #######################

    def text_case(option)
      case option
      when :lower
        wordcram.lower_case()
      when :upper
        wordcram.upper_case()
      when :default
        wordcram.keep_case()
      end
    end


    #######################
    # Color
    #######################

    def colors(*colors)
      if colors.size == 1
        wordcram.with_color(*colors)
      else
        wordcram.with_colors(*colors)
      end
    end

    def blue
      color(0, 0, 255)
    end

    def green
      color(0, 255, 0)
    end

    def orange
      color(255, 127, 0)
    end

    def black
      color(0, 0, 0)
    end

    def white
      color(255, 255, 255)
    end

    def yellow
      color(255, 255, 0)
    end

    def red
      color(255, 0, 0)
    end


    #######################
    # Font
    #######################

    def fonts(*fonts)
      if fonts.size == 1
        wordcram.with_font(*fonts)
      else
        wordcram.with_fonts(*fonts)
      end
    end


    #######################
    # Padding
    #######################

    def word_padding(padding)
      wordcram.with_word_padding(padding)
    end


    #######################
    # Sizer
    #######################

    def sized_by_weight(options)
      wordcram.sized_by_weight(options[:min], options[:max])
    end

    def sized_by_rank(options)
      wordcram.sized_by_rank(options[:min], options[:max])
    end


    #######################
    # Sources
    #######################

    def from(content, options = {})
      case options[:as]
      when :text
        wordcram.from_text_string(content)
      when :text_file
        wordcram.from_text_file(content)
      when :web_url
        wordcram.from_web_page(content)
      when :html_file
        wordcram.from_html_file(content)
      when :html_string
        wordcram.from_html_string(content)
      else
        wordcram.from_text_string(content)
      end
    end


    #########################
    # Placer
    #########################

    def create_placer(name)
      placer = ''
      case name
      when :horizontal_line
        placer = horizontal_line
      when :center_clump
        placer = center_clump
      when :horiz_band_anchored_left
        placer = horiz_band_anchored_left
      when :swirl
        placer = swirl
      when :upper_left
        placer = upper_left
      when :wave
        placer = wave
      end
      placer
    end

    def placer(placer=nil, &block)
      if placer.nil?
        placer = Placer.new &block
      else
        placer = create_placer(placer)
      end
      wordcram.with_placer(placer)
    end


    ##########################
    # Bundled Placers
    ##########################

    def horizontal_line
      Java.wordcram.Placers.horiz_line
    end

    def center_clump
      Java.wordcram.Placers.center_clump
    end

    def horiz_band_anchored_left
      Java.wordcram.Placers.horiz_band_anchored_left
    end

    def swirl
      Java.wordcram.Placers.swirl
    end

    def upper_left
      Java.wordcram.Placers.upper_left
    end

    def wave
      Java.wordcram.Placers.wave
    end

  end
end