class PangrammicSurplus
  class << self

    def for(input)
      Vector.subtract(input, MinimalCount.for(input))
    end

  end
end
