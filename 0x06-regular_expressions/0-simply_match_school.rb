#!/usr/bin/env ruby

require 'oniguruma'

def match_regex(input_str)
  # Define your regular expression pattern here
  regex_pattern = Oniguruma::ORegexp.new('School')

  # Perform the match
  matches = regex_pattern.match(input_str)

  # Output all matched strings
  matches.to_a.each { |match| puts match } if matches
end

