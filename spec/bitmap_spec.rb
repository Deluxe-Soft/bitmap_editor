require 'spec_helper'
require_relative '../app/bitmap'
require_relative '../app/uiactions'

include RSpec

RSpec.describe Bitmap do
  context "Creation of matrix" do

    DEFAULT_SIZE = 10

    before(:each) do
      @bitmap = Bitmap.new(DEFAULT_SIZE, DEFAULT_SIZE )
    end

    it "Should have proper size" do
      expect(@bitmap.size_x).to eq(DEFAULT_SIZE )
      expect(@bitmap.size_y).to eq(DEFAULT_SIZE )
    end

    it "Should be zeroed after creation" do
      rows_of_zero = ("O" * DEFAULT_SIZE ).split('')

      (0...DEFAULT_SIZE ).each do |i|
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

    it "Should be clean after calling zeroing" do
      @bitmap.do_zero_matrix
      all_cells = (@bitmap.size_x * @bitmap.size_y)

      expect(@bitmap.matrix.flatten).to match_array(('O' * all_cells).split(''))
    end

  end

  context "User Interface Actions" do
    include UiActions

    before(:each) do
      @matrix = Bitmap.new(5,6)
    end

    it "Should throw Exception while bullshit initialization" do
      expect{ init_matrix(["I","1","300"]) }.to raise_error(ArgumentError)
    end

    it "Test all stupid calls" do
      expect{ draw_vertical_segment(["L","1","3","7","W"]) }.to raise_error(ArgumentError)

      expect{ draw_vertical_segment(["L","2","3","6","W"]) }.to raise_error(ArgumentError)
      expect{ draw_vertical_segment(["L","2","5","3","W"]) }.to raise_error(ArgumentError)
      expect{ draw_vertical_segment(["L","2","3","6","λ"]) }.to raise_error(ArgumentError)

      expect{ draw_horizontal_segment(["H","2","3","11","W"]) }.to raise_error(ArgumentError)
      expect{ draw_horizontal_segment(["H","2","25","6","W"]) }.to raise_error(ArgumentError)
      expect{ draw_horizontal_segment(["H","2","3","6","γ"]) }.to raise_error(ArgumentError) # Gamma, not 'Y' here ;)

      expect{ draw_single_pixel(["L","11","7","A"]) }.to raise_error(ArgumentError)
      expect{ draw_single_pixel(["L","1","1","Σ"]) }.to raise_error(ArgumentError)

    end
  end

end
