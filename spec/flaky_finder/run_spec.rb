require "./lib/flaky_finder/run"

describe FlakyFinder::Run do

  subject { FlakyFinder::Run.new(examples) }

  let(:examples) do
    [
      {
        "file_path" => "./path/to/file",
        "line_number" => 123,
        "status" => "passed"
      }
    ]
  end

  it do
    expect(subject.keys).to eq(["./path/to/file:123"])
    expect(subject.example_result("./path/to/file:123")).to eq("passed")
  end

end