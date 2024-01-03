#!/usr/bin/env ruby

require 'oniguruma'

def match_regex(str)
  regex = Oniguruma::ORegexp.new('[a-z]+[0-9]*')
  matches = regex.match(str)
  puts matches
end

match_regex(ARGV[0])

