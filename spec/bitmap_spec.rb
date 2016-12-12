require 'spec_helper'
require_relative '../app/bitmap'

include RSpec

RSpec.describe Bitmap do
  before(:each) do
    @bitmap = Bitmap.new(10, 10)
  end

  context "Creation of matrix" do
    it "Should have proper size" do
      expect(@bitmap.size_x).to eq(10)
      expect(@bitmap.size_y).to eq(10)
    end

    it "Should be zeroed after creation" do
      rows_of_zero = ("O" * 10).split('')

      (0...10).each do |i|
        expect(@bitmap[i]).to match_array(rows_of_zero)
      end
    end
  end

  context "Basic matrix operations" do

  end
end
