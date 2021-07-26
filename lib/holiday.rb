require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season,holidays|
    if season == :winter
      holidays.each do |holiday,supplies|
        supplies << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holidays|
    if season == :spring
      holidays.each do |holiday,supplies|
        if holiday == :memorial_day
          supplies << supply
        end
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  retArray = []
  holiday_hash.each do |season,holidays|
    if season == :winter
      retArray = holidays.values.flatten
    end
  end
  retArray
end

def symbolToString(strData)
  arrData = strData.split(":")
  arrData[0]
end

def capitalizeAllWords(strPhase)
  arrayTmp = strPhase.split("_")
  arrayTmp.each_with_index do |item, index|
    arrayTmp[index] = item.capitalize
  end
  arrayTmp.join(" ")
end

def arrayString(array)
  array.join(", ")
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  # This is a challenging deliverable!
  # Start by determining how to iterate through the holiday_hash to access all the 
  # data you need for this deliverable. Then work on getting the formatting right.
  # To capitalize the names of the holidays, you'll need to do the following:
  # - Start with a name of the holiday as a symbol (:fourth_of_july)
  # - Convert the symbol to a string ("fourth_of_july")
  # - Replace each underscore with a space ("fourth of july")
  # - Capitalize the first letter of each word ("Fourth Of July")
  holiday_hash.each do |season, holidays|
    puts "#{capitalizeAllWords(symbolToString(season.to_s))}:"
    holidays.each do |holiday, supplies|
      puts "  #{capitalizeAllWords(symbolToString(holiday.to_s))}: #{arrayString(supplies)}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  retArray = []
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supplies|
      if supplies.include?("BBQ")
        retArray << holiday
      end
    end
  end
  retArray
end