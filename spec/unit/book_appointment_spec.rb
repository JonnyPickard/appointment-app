require 'spec_helper'
require 'json'

require_relative '../../lib/appointment_manager.rb'

describe AppointmentManager do

  appointment_manager = described_class.new

  after(:each) do
    clean_persistent_data
  end

  describe "#load_availability_slots_from_json" do
    it "Loads availability slots from the provided JSON file" do
      appointment_manager.load_availability_slots_from_json

      existence_of_temp_file = File.file?("storage/temp.json")

      expect(existence_of_temp_file).to be true
    end
  end

  describe "#add_availability_key_to_temp_file" do
    it "Adds an { availability : boolean } key value pair to the temp.json file" do
      create_mock_temp_file

      file = File.read("storage/temp.json")
      availability_slots = appointment_manager.add_availability_key_to_temp_file file

      availability_slots = JSON.parse(availability_slots)
      availability_slot  = availability_slots["availability_slots"][0]

      expect(availability_slot).to have_key("available")
    end
  end
end

def clean_persistent_data
  File.delete("storage/temp.json")
end

def create_mock_temp_file
  file = File.read("spec/fixtures/availability_slots.json")

  File.open("storage/temp.json","w") do |f|
    f.write(file)
  end
end
