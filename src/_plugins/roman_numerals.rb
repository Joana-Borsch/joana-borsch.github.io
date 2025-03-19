module Jekyll
  module RomanNumerals
    def to_roman(number)
      roman = {
        1000 => "M",  
        900 => "CM",  
        500 => "D",  
        400 => "CD",
        100 => "C",  
        90 => "XC",  
        50 => "L",  
        40 => "XL",  
        10 => "X",  
        9 => "IX",  
        5 => "V",  
        4 => "IV",  
        1 => "I"  
      }
      
      result = ""
      roman.each do |value, letter|
        while number >= value
          result << letter
          number -= value
        end
      end
      result
    end
  end
end

Liquid::Template.register_filter(Jekyll::RomanNumerals)