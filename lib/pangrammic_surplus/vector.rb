class PangrammicSurplus::Vector
  class << self

    def add(*v)
      first = v.first
      first.inject({}) do |hash, (k, _)|
        sum = v.map { |h| h[k] }.inject(:+)
        hash.merge(k => sum)
      end
    end

    def subtract(a, b)
      _b = b.inject({}) { |h, (k, v)| h.merge(k => -v) }
      add(a, _b)
    end

  end
end
