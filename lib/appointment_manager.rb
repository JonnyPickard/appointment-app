require 'json'
require 'date'
require_relative './data_manager.rb'

class AppointmentManager

  def book(time)
    if check_availability(time)[0] == true
      book_slot(time, check_availability(time)[1])
      return time
    else
      time = find_next_available_time(time)
      book_slot(time, check_availability(time)[1])
      return time
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

  def find_next_available_time(time)
    if check_availability(time)[0] == true
      return time
    else
      find_next_available_time(add_10_minutes(time))
    end
  end

  def add_10_minutes(time)
    minutes = time.split(//).last(2).join.to_i
    hours   = time.split(//).first(2).join.to_i

    if minutes == 5
      minutes = 0
      if hours = 13
        raise "Error: Out of time frame"
      else
        hours += 1
      end
    elsif hours == 15
      raise "Error: Out of time frame"
    else
      minutes += 10
    end

    time = DateTime.new(2016, 3, 4, hours, minutes, 0)
    time.strftime('%I:%M')
  end
end
