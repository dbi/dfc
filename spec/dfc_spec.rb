require "dfc"

describe DFC do

  subject { DFC.new }

  it "should discout for one year" do
    subject.discount(1.1).period(1.0, 1).calc.should be_within(0.001).of(0.909)
  end

  it "should discount for two years" do
    subject.discount(1.1).period(1.0, 2).calc.should be_within(0.001).of(1.73553719008264)
  end

  it "should add growth for one year" do
    subject.discount(1).period(1.1, 1).calc.should be_within(0.001).of(1.1)
  end

  it "should add growth for two years" do
    subject.discount(1).period(1.1, 2).calc.should be_within(0.001).of(2.31)
  end

  it "should combine growth and discount for two years" do
    subject.discount(1.1).period(1.2, 2).calc.should be_within(0.001).of(2.28099173553719)
  end

  it "should combine growth and discount for multiple periods" do
    subject.discount(1.1).period(1.3, 2).period(1.2, 1).calc.should be_within(0.001).of(4.10217881292261)
  end

  it "should let a period with no number go on for 1000 years" do
    subject.discount(1.07).period(1.0).calc.should be_within(0.001).of(14.286)
  end

  it "should work for a real life sample" do
    subject.discount(1.07).period(1.1, 5).period(1.05).calc.should be_within(0.001).of(65.72)
  end

  it "should work for 5% into infinity" do
    subject.discount(1.07).period(1.05).calc.should be_within(0.001).of(52.50)
  end

end
