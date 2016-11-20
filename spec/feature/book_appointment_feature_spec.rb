require 'spec_helper'

require_relative '../../lib/book_appointment.rb'

describe BookAppointment, "#book" do

  book_appointment = described_class.new

  context "User can successfully book an available appointment" do
    it "successfully prints back the valid inputted time confirming the booking" do
      time = "12:30"

      expect { book_appointment.book(time) }.to output("12:30").to_stdout
    end
  end

  context "User cannot book appointment after 15:00 or before 08:00" do
    it "successfully prints the next available appointment slot when given an invalid early time" do
      time = "07:50"

      expect { book_appointment.book(time) }.to output("08:00").to_stdout
    end

    it "successfully prints the next available appointment slot when given an invalid late time" do
      time = "15:50"

      expect { book_appointment.book(time) }.to output("08:00").to_stdout
    end
  end

  context "User cannot book unavailable appointment slot" do
    it "successfully prints the next available appointment slot when given an already booked time" do
      time = "08:00"

      2.times do
        book_appointment.book(time)
      end

      expect { book_appointment.book(time) }.to output("08:10").to_stdout
    end
  end

  context "User cannot enter an invalidly formatted time" do
    it "Returns an error prompt when given invalid time 1" do
      invalid_time_1 = "123:13"
      error_message  = "Error: Input time must be formatted as 'HH:MM' e.g. '13:50'"

      expect { book_appointment.book(invalid_time_1) }.to output(error_message).to_stdout
    end

    it "Returns an error prompt when given invalid time 2" do
      invalid_time_2 = "invalid_time"
      error_message  = "Error: Input time must be formatted as 'HH:MM' e.g. '13:50'"

      expect { book_appointment.book(invalid_time_2) }.to output(error_message).to_stdout
    end
  end
end
