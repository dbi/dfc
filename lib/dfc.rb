class DFC
  
  def initialize(discount)
    @discount = discount
    @periods = []
  end
  
  def self.discount(discount)
    DFC.new(discount)
  end
  
  def period(growth, years=nil)
    @periods << [growth, years]
    self
  end
  
  def calc
    year = 0
    sum = 0
    revenue = 1
    
    @periods.each do |period|
      growth = period.first
      years = period.last ? period.last : 1000 - year
      
      years.times do
        year += 1
        revenue *= growth
        sum += revenue / @discount ** year
      end
    end
    
    sum
  end
  
end
