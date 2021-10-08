require "./lib/flaky_finder/runs"
require "./lib/flaky_finder/run"

describe FlakyFinder::Runs do

  subject { FlakyFinder::Runs.new(runs) }

  let(:runs) do
    [
      Run.new(
        "file_path" => "./path/to/file",
        "line_number" => 123,
        "status" => "passed"
      )
    ]

  end

  it do
  end

end