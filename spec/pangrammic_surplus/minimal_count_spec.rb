require 'spec_helper'

describe PangrammicSurplus::MinimalCount do

  let(:klass) { subject.class }

  describe '.for' do
    it 'returns a character count hash of the minimal sentence' do
      hash = ('a'..'z').inject({}) { |h, c| h.merge(c => 10) }
      minimal_count = klass.for(hash)

      minimal_count['t'].should == 26 + 1
      minimal_count['z'].should == 1
    end
  end

end
