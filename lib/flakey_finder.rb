require "json"

require "./lib/flakey_finder/runs"
require "./lib/flakey_finder/run"


class FlakeyFinder

  class Example
    def initialize(example)
      @example = example
    end

    def key
      [file_path, line_number].join(":")
    end

    def status
      @example["status"]
    end

    private

    def file_path
      @example["file_path"]
    end

    def line_number
      @example["line_number"]
    end

  end

  def find(path, sample_size = 10)
    runs = collect_runs(path, sample_size)
    runs.unstable_examples
  end

  private

  def collect_runs(path, sample_size)
    Runs.new(
      (1..sample_size)
        .map { |_| `bundle exec rspec #{path} --format j` }
        .map { |results| JSON.parse(results).fetch("examples") }
        .map { |examples| Run.new(examples) }
    )
  end
end