require "dfc"

describe DFC do

  it "should discout for one year" do
    DFC.discount(1.1).period(1.0, 1).calc.should be_close(0.909, 0.001)
  end
  
  it "should discount for two years" do
    DFC.discount(1.1).period(1.0, 2).calc.should be_close(1.73553719008264, 0.001)
  end
  
  it "should add growth for one year" do
    DFC.discount(1).period(1.1, 1).calc.should be_close(1.1, 0.001)
  end
  
  it "should add growth for two years" do
    DFC.discount(1).period(1.1, 2).calc.should be_close(2.31, 0.001)
  end
  
  it "should combine growth and discount for two years" do
    DFC.discount(1.1).period(1.2, 2).calc.should be_close(2.28099173553719, 0.001)
  end
  
  it "should combine growth and discount for multiple periods" do
    DFC.discount(1.1).period(1.3, 2).period(1.2, 1).calc.should be_close(4.10217881292261, 0.001)
  end
  
  it "should let a period with no number go on for 1000 years" do
    DFC.discount(1.07).period(1.0).calc.should be_close(14.286, 0.001)
  end
  
  it "should work for a real life sample" do
    DFC.discount(1.07).period(1.1, 5).period(1.05).calc.should be_close(65.72, 0.01)
  end
  
  it "should work for 5% into infinity" do
    DFC.discount(1.07).period(1.05).calc.should be_close(52.50, 0.001)
  end

end
