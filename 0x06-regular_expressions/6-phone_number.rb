#!/usr/bin/env ruby

require 'oniguruma'

def match_regex(str)
  regex = Oniguruma::ORegexp.new('^[2-9]\d{2}[2-9]\d{6}$')
  matches = regex.match(str)
  puts matches
end

match_regex(ARGV[0])

