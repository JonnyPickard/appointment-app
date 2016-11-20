require 'json'

class AppointmentManager

  def book(time)
    # print(time)
  end

  def load_availability_slots_from_json #load json
    file = File.read("availability_slots.json")
    dates = JSON.parse(file)

    File.open("storage/temp.json","w") do |f|
      f.write(JSON.pretty_generate(dates))
    end
  end
end
