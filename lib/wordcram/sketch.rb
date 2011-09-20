class Wordcram
  class Sketch < Processing::App
    include Style
    attr_accessor :wordcram, :block

    def initialize(&block)
      @block = block
      super()
    end

    def canvas(&block)
      self.instance_eval(&block)
    end

    def setup
      @wordcram = Java.wordcram.WordCram.new(self)

      self.instance_eval(&@block)

      @wordcram.draw_all()
    end

    def save_to(path)
      saveFrame(path)
    end

  end
end
