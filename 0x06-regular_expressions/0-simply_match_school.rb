#!/usr/bin/env ruby

require 'oniguruma'

def match_regex(input_str)
  # Define your regular expression pattern here
  regex_pattern = Oniguruma::ORegexp.new('School')

  # Perform the match
  matches = regex_pattern.match(input_str)

  # Output the matches
  puts matches
end

# Check if a command-line argument is provided
if ARGV.empty?
  puts 'Please provide a string as a command-line argument.'
else
  # Call the match_regex function with the provided argument
  match_regex(ARGV[0])
end

