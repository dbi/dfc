#!/usr/bin/env ruby

$: << File.expand_path(File.dirname(__FILE__)) 

require "company"

growth = DFC.new.discount(1.1).
              period(1.11, 5).
              period(1.07, 10).
              period(1.02).calc

earnings = 20000
shares = 394569

puts "%.0d%% margin" % (((earnings * growth / shares) - 1)*100)

hm = Company.new :pe => 20, :earnings => 20000, :shares => 394569

puts hm.report() do |dfc|
  dfc.discount(1.1).
    period(1.1, 10).
    period(1.05)
end

