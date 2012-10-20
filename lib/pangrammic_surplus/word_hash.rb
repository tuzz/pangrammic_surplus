class PangrammicSurplus::WordHash
  class << self

    def for(integer)
      @memo ||= {}
      @memo[integer] ||= hash_for(integer)
      @memo[integer].clone
    end

    private
    def hash_for(integer)
      term = integer.to_words
      term += 's' if integer > 1

      ('a'..'z').inject({}) do |h, c|
        h.merge(c => term.count(c))
      end
    end

  end
end
