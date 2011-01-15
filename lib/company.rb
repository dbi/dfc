require "dfc"

class Company
  attr_reader :pe, :shares, :earnings

  def initialize(options)
    @pe = options[:pe]
    @shares = options[:shares]
    @earnings = options[:earnings]
  end

  def report
    result = "shares: #{@shares}\nearnings: #{@earnings}\npe: #{@pe}"
    if block_given?
      dfc = DFC.new
      yield(dfc)
      result += "\nmargin: %.0d%%" % (((earnings * dfc.calc / shares) - 1)*100)
    end
    result
  end

end

