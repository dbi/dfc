require "dfc"

growth = DFC.discount(1.1).
              period(1.11, 5).
              period(1.07, 10).
              period(1.02).calc

value = growth * 20000

puts "%.0d%% margin" % (((value / 394569) - 1)*100)
