require 'spec_helper'

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
end

def clean_persistent_data
  File.delete("storage/temp.json")
end
