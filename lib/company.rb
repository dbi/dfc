require "dfc"

class Company
  attr_reader :pe, :shares, :earnings

  def initialize(options)
    @pe = options[:pe]
    @shares = options[:shares]
    @earnings = options[:earnings]
  end

  def report(options={})
    result = "shares: #{@shares}\nearnings: #{@earnings}\npe: #{@pe}"
    if block_given?
      yield(dfc = DFC.new)
      growth = dfc.calc

      result = result + "\nmargin: %.0d%%" % (((earnings * growth / shares) - 1)*100)
      growth = growth / @pe * options[:pe] if options[:pe]

      if options[:pe]
        result = result + "\nmargin: %.0d%% (pe #{options[:pe]})" % (((earnings * growth / shares) - 1)*100)
      end
    end

    result
  end

end

