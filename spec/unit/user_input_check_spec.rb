require 'spec_helper'

require_relative '../../lib/user_input_check.rb'

describe UserInputCheck do

  user_input_check = described_class.new

  describe "#check_user_input_is_valid" do
    it "Returns false if the user inputs an incorrect time" do
      invalid_time = "31:32"

      expect(user_input_check.check_validity(invalid_time)).to be false
    end

    it "Returns false if the user inputs an incorrectly formatted time" do
      invalid_time = "incorrect_format"

      expect(user_input_check.check_validity(invalid_time)).to be false
    end
  end
end
