require "company"

describe Company do

  it "has a PE value" do
    c = Company.new :pe => 20
    c.pe.should == 20
  end

  it "can have a price" do
    c = Company.new(:price => 100).price.should == 100
  end

  describe "#report" do

    subject { Company.new(:shares => 1655.072, :earnings => 20000, :pe => 15) }

    it "reports the perticulars about the company" do
      subject.report.should include("shares: 1655.072 (millions)\nearnings: 20000\npe: 15")
      Company.new(:shares => 1655.072, :earnings => 20000, :pe => 15, :price => 100).report.should include("shares: 1655.072 (millions)\nearnings: 20000\npe: 15\nprice: 100")
    end

    it "yields a dfc object" do
      subject.report {|r| r.class.should == DFC }
    end

    it "formats the output from a dfc calculation" do
      subject.report do |dfc|
        dfc.discount(1.1).period(1.1, 10).period(1.05)
      end.should include("value: 374 kr/aktie")
    end

    it "calculates value diff for changed PE" do
      subject.report(:pe => 20) do |dfc|
        dfc.discount(1.1).period(1.15, 10).period(1.05)
      end.should include("value: 735 kr/aktie (pe 20)")
    end
  end

end

