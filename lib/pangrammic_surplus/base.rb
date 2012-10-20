class PangrammicSurplus
  class << self

    def for(input, allow_negatives = false)
      minimal = MinimalCount.for(input)
      surplus = Vector.subtract(input, minimal)

      (allow_negatives || satisfiable?(surplus)) ? surplus : nil
    end

    private
    def satisfiable?(surplus)
      surplus.all? { |_, v| v >= 0 }
    end

  end
end
