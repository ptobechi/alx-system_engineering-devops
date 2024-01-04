#!/usr/bin/env ruby

require 'oniguruma'

def match_regex(str)
  regex = Oniguruma::ORegexp.new('h.n')
  matches = regex.match(str)
  puts matches
end

match_regex(ARGV[0])

