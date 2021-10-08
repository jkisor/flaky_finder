require "./lib/flaky_finder/example"

describe FlakyFinder::Example do

  subject { FlakyFinder::Example.new(data) }

  let(:data) do
    {
      "file_path" => "./path/to/file",
      "line_number" => 123,
      "status" => "passed"
    }
  end

  it do
    expect(subject.key).to eq("./path/to/file:123")
    expect(subject.status).to eq("passed")
  end

end