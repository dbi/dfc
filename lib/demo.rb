#!/usr/bin/env ruby

$: << File.expand_path(File.dirname(__FILE__)) 

require "company"

hm = Company.new :pe => 20, :earnings => 20000, :shares => 394569

r = hm.report(:pe => 15) do |dfc|
  dfc.discount(1.1).
    period(1.1, 9).
    period(1.06, 5).
    period(1.05)
end

puts r

