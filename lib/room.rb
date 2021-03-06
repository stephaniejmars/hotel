require 'time'
require 'date'
require_relative 'manager'
require_relative 'reservation'

module Hotel
  class Room
    attr_reader :rm_num, :rm_reservations 
    attr_writer
    attr_accessor 
    
    def initialize(rm_num:)
      @rm_num = rm_num
      @rm_reservations = []
      
      if rm_num.nil? || rm_num <= 0 
        raise ArgumentError, 'Room number cannot be blank or less than one.'
      end
    end
    
    
    def is_available(date) 
      if @rm_reservations == nil #if no res then room is avail 
        return true
      else
        @rm_reservations.each do |res| 
          if date < res.start_date || date >= res.end_date
            #loops again 
          else
            return false
          end
        end
      end
      return true 
    end
  
    def is_available_range(start_date, end_date)
        (start_date..(end_date-1)).each do |date|
          if is_available(date) == false
            return false
          end
        end
      return true 
    end
    

    def book_room(start_date, end_date, recloc = nil)
      @reservation = Reservation.new(start_date: start_date, 
        end_date: end_date, 
        rm_num: @rm_num, 
        recloc: recloc)
      @rm_reservations << @reservation
      return @reservation
    end

    def has_res_by_date(date) 
      if @rm_reservations == [] 
        return false
      else
        @rm_reservations.each do |res| 
          if date >= res.start_date && date <= res.end_date
            return res
          end
        end 
      end
      return false
    end
  end 
end