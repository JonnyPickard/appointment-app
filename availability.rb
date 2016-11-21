#!/usr/bin/env ruby

require_relative './lib/data_manager.rb'
require_relative './lib/user_input_check.rb'
require_relative './lib/appointment_manager.rb'

first_arg, *the_rest = ARGV

def run(user_input = first_arg, data_manager = DataManager.new)
  user_input_check = UserInputCheck.new
  appointment_manager = AppointmentManager.new

  time = user_input

  data_manager.import
  user_input_check.overall_check time

  p appointment_manager.book time
end

run(first_arg)
