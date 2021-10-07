require "./flakey_finder"
require "json"

describe FlakeyFinder do

  subject { described_class.new }

  context "when tests pass constantly" do
    it "finds no flakey tests" do
      expect(subject.find("./flakey_spec/constant_pass_spec.rb")).to eq([])
    end
  end

  context "when tests fail constantly" do

    it "finds no flakey tests" do
      expect(subject.find("./flakey_spec/constant_pass_spec.rb")).to eq([])
    end
  end

  context "when tests fail sometimes" do
    it "finds a flakey test" do
      expect(subject.find("./flakey_spec/flakey_spec.rb")).to eq([ "./flakey_spec/flakey_spec.rb:2" ])
    end
  end

end