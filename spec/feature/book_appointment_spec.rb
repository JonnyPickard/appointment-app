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
    it "successfully prints next available appointment when given an invalid early time" do
      time = "07:50"

      expect { book_appointment.book(time) }.to output("08:00").to_stdout

    it "successfully prints next available appointment when given an invalid late time" do
      time = "15:50"

      expect { book_appointment.book(time) }.to output("08:00").to_stdout
    end
  end
end
