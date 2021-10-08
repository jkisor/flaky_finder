require "json"

class FlakeyFinder

  class Runs
    def initialize(runs)
      @runs = runs
    end

    def unstable_examples
      baseline.keys.select do |key|
        @runs.any? { |run| run.example_result(key) != baseline.example_result(key) }
      end
    end

    private

    def baseline
      @runs.first
    end

  end

  class Run
    def initialize(examples)
      @examples = examples.map { |e| Example.new(e) }
    end

    def to_h
      @examples.map { |e| [ e.key, e.status ] }.to_h
    end

    def keys
      @examples.map(&:key)
    end

    def example_result(key)
      to_h[key]
    end

  end

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