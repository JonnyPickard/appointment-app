class UserInputCheck

  def check_validity input
    if (input =~ /^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/)
      true
    else
      false
    end
  end

  def time_is_between_8_and_3? input

    hours = input.split(//).first(2).join.to_i

    p hours
    if hours <= 8 || hours >= 15
      return false
    else
      return true
    end
  end
end
