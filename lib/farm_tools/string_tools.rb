module StringTools
  require 'active_support/core_ext/string/starts_ends_with'
  include ActionView::Helpers::TextHelper

  SUPER_SPLITTER = / ?[,;|-] ?/

  def articleator(word, capitalize = false)
    an_consonants = %w|honest honor slp|
    a_vowels = %w|uni|
    capitalize ? article = 'A' : article = 'a'
    an_consonants.each do |an_word|
      article += 'n' if word.downcase.starts_with?(an_word)
    end

    article += 'n' if %w|a e i o u|.include?(word[0].downcase)

    a_vowels.each do |a_word|
      article = article[0] if word.downcase.starts_with?(a_word)
    end
    "#{article} #{word}"
  end

  def float_to_years_and_months(float)
    years = Integer(float)
    decimal_months = float - years
    months =  Integer((decimal_months * 12).round)
    str = "#{years} "
    str += 'year'.pluralize(years)
    str += " and #{pluralize(months, 'month')}" unless months == 0
    str
  end

end
