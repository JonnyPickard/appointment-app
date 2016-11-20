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
end
