require 'spec_helper'

require_relative '../helpers/json_helpers.rb'
require_relative '../../lib/data_manager.rb'

describe DataManager do

  data_manager = described_class.new

  json_helpers = JSONHelpers.new

  after(:each) do
    json_helpers.clean_persistent_data
  end

  describe "#load_availability_slots_from_json" do
    it "Loads availability slots from the provided JSON file" do
      data_manager.load_availability_slots_from_json

      existence_of_temp_file = File.file?("storage/temp.json")

      expect(existence_of_temp_file).to be true
    end
  end

  describe "#add_availability_key_to_temp_file" do
    it "Adds an { availability : boolean } key value pair to the temp.json file" do
      json_helpers.create_mock_temp_file

      file = File.read("storage/temp.json")
      availability_slots = data_manager.add_availability_key_to_temp_file file

      availability_slots = JSON.parse(availability_slots)
      availability_slot  = availability_slots["availability_slots"][0]

      expect(availability_slot).to have_key("available")
    end
  end
end
