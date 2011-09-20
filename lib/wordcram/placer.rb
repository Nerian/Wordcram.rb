class Wordcram
  class Placer
    def initialize(&block)
      @block = block
    end

    def place(word, index, count, word_width, word_height, field_width, field_height)
      data = {}
      data[:word]         = word
      data[:index]        = index
      data[:count]        = count
      data[:word_width]   = word_width
      data[:word_height]  = word_height
      data[:field_width]  = field_width
      data[:field_height] = field_height

      pos = @block.call(data)

      Processing::PVector.new(pos[0], pos[1])
    end

  end
end
