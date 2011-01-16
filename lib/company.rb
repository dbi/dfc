require "dfc"

class Company
  attr_reader :pe, :shares, :earnings, :price

  def initialize(options)
    @pe = options[:pe]
    @shares = options[:shares] # millions of shares
    @earnings = options[:earnings]
    @price = options[:price]
  end

  def report(options={})
    result = "shares: #{@shares} (millions)\nearnings: #{@earnings}\npe: #{@pe}"
    result += "\nprice: #{@price}" if @price
    result += "\n----------"

    if block_given?
      yield(dfc = DFC.new)
      growth = dfc.calc

      if options[:pe]
        growth = growth / @pe * options[:pe] if options[:pe]
        result += "\nvalue: %.0d kr/aktie (pe #{options[:pe]})" % (earnings * growth / shares)
      else
        result += "\nvalue: %.0d kr/aktie" % (earnings * growth / shares)
      end

      result += "\nmargin: %.0d%%" % ((((earnings * growth / shares) / @price)-1)*100) if @price
    end

    result
  end

end

