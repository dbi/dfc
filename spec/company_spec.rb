require "company"

describe Company do

  it "stores pe, shares and earnings" do
    c = Company.new :pe => 20, :earnings => 20000, :shares => 294569 

    c.pe.should == 20
    c.earnings.should == 20000
    c.shares.should == 294569
  end

  describe "#report" do

    subject { Company.new(:shares => 1000, :earnings => 10, :pe => 15) }

    it "reports the perticulars about the company" do
      subject.report.should == "shares: 1000\nearnings: 10\npe: 15"
    end

    it "yields a dfc object" do
      subject.report {|r| r.class.should == DFC }
    end

    it "formats the output from a dfc calculation" do
      subject.report do |dfc|
        dfc.discount(1.1).period(1.1, 10).period(1.05)
      end.should include("margin: -69%")
    end

    it "calculates value diff for changed PE" do
      subject.report(:pe => 20) do |dfc|
        dfc.discount(1.07).period(1.15, 10).period(1.05)
      end.should include("margin: 64%")
    end
  end

end

