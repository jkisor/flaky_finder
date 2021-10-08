require "./lib/flaky_finder"

describe FlakyFinder do

  subject { described_class }

  context "when tests pass constantly" do
    it "finds no flaky tests" do
      expect(subject.find("./support_spec/constant_pass_spec.rb")).to eq([])
    end
  end

  context "when tests fail constantly" do

    it "finds no flaky tests" do
      expect(subject.find("./support_spec/constant_pass_spec.rb")).to eq([])
    end
  end

  context "when tests fail sometimes" do
    it "finds a flaky test" do
      expect(subject.find("./support_spec/flaky_spec.rb")).to eq([ "./support_spec/flaky_spec.rb:2" ])
    end
  end

end