require 'json'
require_relative './data_manager.rb'

class AppointmentManager

  def book(time)

    availability = check_availability(time)

    p availability
    puts "here"

    if availability[0]
      book_slot(time, availability[1])
    end
  end

  def check_availability(time, data_manager = DataManager.new)
    availability = data_manager.read_temp_file["availability_slots"]
    availability_slots = availability.select { |key| key['time'] == "#{time}:00" && key['available'] == true }

    if availability_slots.count == 0
      return [false, nil]
    elsif availability_slots.count == 1
      return [true, 0] if availability_slots[0]["available"]
    elsif availability_slots.count == 2
      return [true, 1] if availability_slots[1]["available"]
    else
      return [false, nil]
    end
  end

  def book_slot(time, slot, data_manager = DataManager.new)
    availability = data_manager.read_temp_file
    availability["availability_slots"].select { |h1| h1['time'] == "#{time}:00" }[slot]["available"] = false

    data_manager.overwrite_save(availability)
  end
end
