require "./lib/flakey_finder"

describe FlakeyFinder do

  subject { described_class }

  context "when tests pass constantly" do
    it "finds no flakey tests" do
      expect(subject.find("./support_spec/constant_pass_spec.rb")).to eq([])
    end
  end

  context "when tests fail constantly" do

    it "finds no flakey tests" do
      expect(subject.find("./support_spec/constant_pass_spec.rb")).to eq([])
    end
  end

  context "when tests fail sometimes" do
    it "finds a flakey test" do
      expect(subject.find("./support_spec/flakey_spec.rb")).to eq([ "./support_spec/flakey_spec.rb:2" ])
    end
  end

end