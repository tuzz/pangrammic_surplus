require 'spec_helper'

describe PangrammicSurplus::Vector do

  let(:klass) { subject.class }

  describe '.add' do
    it 'adds vectors together' do
      klass.add(
        { 'a' => 1, 'b' => 2 },
        { 'a' => 3, 'b' => 4 }
      ).should == { 'a' => 4, 'b' => 6 }

      klass.add(
        { :a => 11, :b => 22, :c => 3 },
        { :a => 3,  :b => 4,  :c => 2  },
        { :a => -1, :b => -2, :c => 1 }
      ).should == { :a => 13, :b => 24, :c => 6 }

      klass.add(:a => 1).should == { :a => 1 }
    end
  end

  describe '.subtract' do
    it 'subtracts one vector from another' do
      klass.subtract(
        { 'a' => 4, 'b' => 6},
        { 'a' => 3, 'b' => 4}
      ).should == { 'a' => 1, 'b' => 2 }

      klass.subtract(
        { :a => 9, :b => 11, :c => 0 },
        { :a => 9, :b => 9, :c => 9}
      ).should == { :a => 0, :b => 2, :c => -9 }
    end
  end

end
