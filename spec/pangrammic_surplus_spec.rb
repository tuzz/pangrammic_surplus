require 'spec_helper'

describe %{
  In order to satisfy self-enumerating pangrams
  I'd like to determine the surplus of characters
  So that I can construct sentences from anagrams
} do

  it 'returns a hash of surplus characters' do
    hash = ('a'..'z').inject({}) { |h, c| h.merge(c => 40) }

    minimal_sentence = ('a'..'z').map { |c| "forty #{c}'s" }.join
    surplus_counts = hash.inject({}) do |h, (k, v)|
      h.merge(k => (v - minimal_sentence.count(k)))
    end

    PangrammicSurplus.for(hash).should == surplus_counts
  end

  it 'returns the a count of non-terms for a true self-enumerating pangram' do
    pangram = "this pangram lists four a's, one b, one c, two d's,
               twenty-nine e's, eight f's, three g's, five h's,
               eleven i's, one j, one k, three l's, two m's,
               twenty-two n's, fifteen o's, two p's, one q,
               seven r's, twenty-six s's, nineteen t's, four u's,
               five v's, nine w's, two x's, four y's, and one z."

    surplus = 'this pangram lists ... and'
    surplus_counts = ('a'..'z').inject({}) { |h, c| h.merge(c => surplus.count(c)) }

    hash = ('a'..'z').inject({}) { |h, c| h.merge(c => pangram.count(c)) }

    PangrammicSurplus.for(hash).should == surplus_counts
  end

  context 'when an optional parameter is specified' do
    it 'returns a hash containing negatives for unsatisfiable pangrams' do
      hash = ('a'..'z').inject({}) { |h, c| h.merge(c => 3) }
      surplus = PangrammicSurplus.for(hash, true)

      surplus['e'].should == 3 - (26 * 2 + 1)
      surplus['t'].should == 3 - (26 + 1)
      surplus['z'].should == 3 - 1
    end
  end

  context 'when an optional parameter is unspecified' do
    it 'returns nil for unsatisfiable pangrams' do
      hash = ('a'..'z').inject({}) { |h, c| h.merge(c => 3) }
      PangrammicSurplus.for(hash).should be_nil
    end
  end

end
