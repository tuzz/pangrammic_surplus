require 'spec_helper'

describe PangrammicSurplus::WordHash do

  let(:klass) { subject.class }

  before do
    klass.instance_variable_set(:@memo, nil)
  end

  describe '.for' do
    it 'returns a hash of character counts' do
      hash = klass.for(3)
      hash['t'].should == 1
      hash['e'].should == 2

      plural = 's'
      hash[plural].should == 1
    end

    it 'memoizes' do
      klass.should_receive(:hash_for).and_return(mock)

      klass.for(3)
      klass.for(3)
    end

    it 'is immutable' do
      hash = klass.for(3).clone
      klass.for(3)['a'] += 1
      klass.for(3).should == hash
    end
  end
end
