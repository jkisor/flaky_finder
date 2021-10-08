require "./lib/flaky_finder/runs"
require "./lib/flaky_finder/run"

describe FlakyFinder::Runs do

  subject { FlakyFinder::Runs.new(runs) }

  context "all stable" do
    let(:runs) do
      [
        FlakyFinder::Run.new(
          [
            {
              "file_path" => "./path/to/file",
              "line_number" => 123,
              "status" => "passed"
            }
          ]
        ),
        FlakyFinder::Run.new(
          [
            {
              "file_path" => "./path/to/file",
              "line_number" => 123,
              "status" => "passed"
            }
          ]
        )
      ]

    end

    it do
      expect(subject.unstable_examples).to be_empty
    end
  end

  context "unstable" do
    let(:runs) do
      [
        FlakyFinder::Run.new(
          [
            {
              "file_path" => "./path/to/file",
              "line_number" => 123,
              "status" => "passed"
            }
          ]
        ),
        FlakyFinder::Run.new(
          [
            {
              "file_path" => "./path/to/file",
              "line_number" => 123,
              "status" => "failed"
            }
          ]
        )
      ]

    end

    it do
      expect(subject.unstable_examples).to include("./path/to/file:123")
    end
  end

end