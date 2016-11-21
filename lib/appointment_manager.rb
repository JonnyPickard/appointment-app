require 'json'
require_relative './data_manager.rb'

class AppointmentManager

  def book(time)
    # print(time)
  end

  def check_availability(time, data_manager = DataManager.new)
    availability = data_manager.read_temp_file["availability_slots"]

    if availability.find { |h1| h1['time'] == "#{time}:00" }.nil?
      return false
    else
      available = availability.find { |h1| h1['time'] == "#{time}:00" }["available"]

      if available
        return true
      else
        return false
      end
    end
  end

  def book_slot(time, data_manager = DataManager.new)
    availability = data_manager.read_temp_file["availability_slots"]
    availability.find { |h1| h1['time'] == "#{time}:00" }["available"] = false

    data_manager.overwrite_save(availability)
  end
end
