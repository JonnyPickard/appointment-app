require 'spec_helper'

require_relative '../../lib/appointment_manager.rb'

describe AppointmentManager, "#book\n" do

  appointment_manager = described_class.new

  after(:each) do
    clean_persistent_data
  end

  context "User can successfully book an available appointment" do
    it "Successfully prints back the valid inputb time confirming the booking" do
      time = "12:30"

      expect { appointment_manager.book(time) }.to output("12:30").to_stdout
    end
  end

  context "User cannot book appointment after 15:00 or before 08:00" do
    error_message = "Error invalid time: Input time must be between '00:00' and '24:00' formatted as 'HH:MM' e.g. '13:50'"

    it "Returns an error message when given an invalid early time" do
      time = "07:50"

      expect { appointment_manager.book(time) }.to output(error_message).to_stdout
    end

    it "Returns an error message when given an invalid late time" do
      time = "15:50"

      expect { appointment_manager.book(time) }.to output(error_message).to_stdout
    end
  end

  context "User cannot book unavailable appointment slot" do
    it "Successfully prints the next available appointment slot when given an already booked time" do
      time = "08:00"

      2.times do
        appointment_manager.book(time)
      end

      expect { appointment_manager.book(time) }.to output("08:10").to_stdout
    end
  end

  context "User cannot enter an invalid time" do
    it "Returns an error prompt when given an invalid time" do
      invalid_time = "48:77"
      error_message  = "Error invalid time: Input time must be between '00:00' and '24:00' formatted as 'HH:MM' e.g. '13:50'"

      expect { appointment_manager.book(invalid_time) }.to output(error_message).to_stdout
    end
  end

  context "User cannot enter an invalidly formatted time" do
    it "Returns an error prompt when given invalidly formatted time 1" do
      invalid_time_format_1 = "123:13"
      error_message  = "Error invalid time format: Input time must be formatted as 'HH:MM' e.g. '13:50'"

      expect { appointment_manager.book(invalid_time_format_1) }.to output(error_message).to_stdout
    end

    it "Returns an error prompt when given invalidly formatted time 2" do
      invalid_time_format_2 = "invalid_time"
      error_message  = "Error invalid time format: Input time must be formatted as 'HH:MM' e.g. '13:50'"

      expect { appointment_manager.book(invalid_time_format_2) }.to output(error_message).to_stdout
    end
  end

  context "User cannot book an appointment if there are no available slots left" do
    it "Returns an error prompt when there are no more available appointment slots" do
      time = "08:00"
      error_message = "Error no appointments available: Please try again tomorrow"

      56.times do
        appointment_manager.book(time)
      end

      expect { appointment_manager.book(time) }.to output(error_message).to_stdout
    end
  end
end

def clean_persistent_data
  puts("'#clean_persistent_data': Update this to work after persistence architecture is in place")
end
