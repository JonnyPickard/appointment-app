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
      expect(appointment_manager.check_availability("08:00")[0]).to be true
    end

    it "Returns false if the slot is non-existant" do
      expect(appointment_manager.check_availability("07:00")[0]).to be false
    end

    it "Returns false if the slot is booked" do

      appointment_manager.book_slot("08:00", 0)
      appointment_manager.book_slot("08:00", 1)
      expect(appointment_manager.check_availability("08:00")[0]).to be false
    end
  end

  describe "#book_slot" do
    before(:each) do
      json_helpers.create_mock_temp_file_with_availability
    end

    it "Successfully books a slot" do
      appointment_manager.book_slot("08:00", 0)
    end
  end
end
