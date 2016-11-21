require 'spec_helper'
require_relative '../../lib/appointment_manager.rb'
require_relative '../helpers/json_helpers.rb'

describe AppointmentManager do
  appointment_manager = described_class.new

  json_helpers = JSONHelpers.new

  describe "#book" do
    xit "" do

    end
  end

  describe "#check_availability" do

    before(:each) do
      json_helpers.create_mock_temp_file_with_availability
    end

    after(:each) do
      json_helpers.clean_persistent_data
    end

    it "Returns true if the slot is avaible" do
      appointment_manager.check_availability("08:00")
    end

    it "Returns false if the slot is non-existant" do
      appointment_manager.check_availability("07:00")
    end

    xit "Returns false if the slot is booked" do
      appointment_manager.check_availability("08:00")
    end
  end

  describe "#book_slot" do
    before(:each) do
      json_helpers.create_mock_temp_file_with_availability
    end

    it "Successfully books a slot" do
      appointment_manager.book_slot("08:00")
    end
  end
end
