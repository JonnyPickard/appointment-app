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

    if availability.find { |h1| h1['time'] == "#{time}:00" }.nil?
      return [false, nil]
    else
      available = availability.select { |h1| h1['time'] == "#{time}:00" }

      if available[0]["available"]
        return [true, 0]
      else
        if available[1]["available"]
          return [true, 1]
        else
          return [false, nil]
        end
      end
    end
  end

  def book_slot(time, slot, data_manager = DataManager.new)
    availability = data_manager.read_temp_file
    availability["availability_slots"].select { |h1| h1['time'] == "#{time}:00" }[slot]["available"] = false

    data_manager.overwrite_save(availability)
  end
end
