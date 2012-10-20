class PangrammicSurplus::MinimalCount
  class << self

    def for(input)
      terms = input.map { |k, v| term(k, v) }
      ps::Vector.add(*terms)
    end

    private
    def term(character, count)
      hash = ps::WordHash.for(count)
      hash[character] += 1
      hash
    end

    def ps
      PangrammicSurplus
    end

  end
end
