require 'json'

class AppointmentManager

  def book(time)
    # print(time)
  end

  def load_availability_slots_from_json #load json
    file = File.read("availability_slots.json")

    file = add_availability_key_to_temp_file(file)

    File.open("storage/temp.json","w") do |f|
      f.write(file)
    end
  end
  
  def add_availability_key_to_temp_file file
    file = File.read("availability_slots.json")

    availability_slots = JSON.parse(file)

    availability_slots["availability_slots"].each do | slot |
      slot["available"] = true
    end

    availability_slots = JSON.pretty_generate(availability_slots)
  end
end
