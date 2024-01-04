#!/usr/bin/env ruby

require 'oniguruma'

def match_regex(str)
  regex = Oniguruma::ORegexp.new('[A-Z]+')
  matches = regex.match(str)
  puts matches
end

match_regex(ARGV[0])

