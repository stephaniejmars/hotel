require_relative 'test_helper'
require 'simplecov'

SimpleCov.start do
  add_filter 'test/manager_test'
  add_filter 'test/reservation_test'
  add_filter 'test/room_test'
end

describe "room" do 
  it "contains infromation" do 
    YAYME.must_equal 1
  end 

  describe "initialze" do 
    it "creates an instance of Room" do 
      room = Hotel::Room.new(rm_num: 3)
      room.must_be_kind_of Hotel::Room
    end 

    it "verifies rm_num is valid" do
    rm_num = 3
    room = Hotel::Room.new(rm_num: rm_num, cost: 300)
    room.must_respond_to :rm_num
    room.rm_num.must_be_instance_of Integer
    room.rm_num.must_equal rm_num
    end

    it "verifies cost is valid" do 
    cost = 300
    room = Hotel::Room.new(rm_num: 3, cost: cost)
    room.must_respond_to :cost
    room.cost.must_be_instance_of Integer
    room.cost.must_equal cost
    end

    it "raises argument error if invalid rm_num" do 
      expect{Hotel::Room.new(rm_num: -3)}.must_raise ArgumentError
      expect{Hotel::Room.new(rm_num: nil)}.must_raise ArgumentError
    end 

    it "raises argument error if invalid cost" do 
      expect{Hotel::Room.new(rm_num: 3, cost: -200)}.must_raise ArgumentError
    end 
    
  end 

end