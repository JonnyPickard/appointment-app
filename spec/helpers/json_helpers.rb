class JSONHelpers

  def clean_persistent_data
    File.delete("storage/temp.json")
  end

  def create_mock_temp_file
    file = File.read("spec/fixtures/availability_slots.json")

    File.open("storage/temp.json","w") do |f|
      f.write(file)
    end
  end
end
