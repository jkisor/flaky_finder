describe "a flakey test" do
  it "fails sometimes" do
    pass = rand() < 0.5 # about 50% of the time
    expect(pass).to eq(true)
  end

  it "ADDITIONAL TEST" do
    expect(true).to eq(true)
  end
end