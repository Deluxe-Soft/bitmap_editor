require 'spec_helper'
require_relative '../app/bitmap'

include RSpec

RSpec.describe Bitmap do
  context "Creation of matrix" do
    before(:each) do
      @bitmap = Bitmap.new(10, 10)
    end

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
    before(:each) do
      @bitmap = Bitmap.new(5, 6)
    end

    let(:hardcoded_2_3) do
      "OOOOO\n"\
      "OOOOO\n"\
      "OAOOO\n"\
      "OOOOO\n"\
      "OOOOO\n"\
      "OOOOO\n"\
    end

    let(:hardcoded_v_h) do
      "OOOOO\n"\
      "OOZZZ\n"\
      "OWOOO\n"\
      "OWOOO\n"\
      "OWOOO\n"\
      "OWOOO\n"
    end

    it "Should be updated after drawing single pixel" do
      @bitmap.draw_pixel(2,3,"A")
      expect{ @bitmap.print_table}.to output(hardcoded_2_3).to_stdout
    end


    it "Should be updated after drawing horizontal and vertical segment" do
      @bitmap.draw_vert(2,3,6,"W")
      @bitmap.draw_hor(3,5,2, "Z")
      expect{ @bitmap.print_table}.to output(hardcoded_v_h).to_stdout
    end


  end
end
