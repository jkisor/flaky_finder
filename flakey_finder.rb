class FlakeyFinder

  class Examples
    def initialize(examples)
      @examples = examples.map { |e| Example.new(e) }
    end

    def to_h
      @examples
        .map { |e| [ e.key, e.status ]}
        .to_h
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

    baseline = runs.first
    baseline.keys.select do |test|
      runs.any? { |run| run[test] != baseline[test] }
    end
  end

  private

  def collect_runs(path, sample_size)
    (1..sample_size)
      .map { |_| run_tests(path) }
      .map { |results| parse(results) }
      # .map { |examples| status_by_test(examples) }
      .map { |examples| Examples.new(examples).to_h }
  end

  def run_tests(path)
    `bundle exec rspec #{path} --format j`
  end

  def parse(results)
    JSON.parse(results).fetch("examples")
  end

  # def status_by_test(examples)
  #   examples
  #     .map { |e| Example.new(e) }
  #     .map { |e| [ e.key, e.status ]}
  #     .to_h
  #     # .map { |e| [ test(e), e["status"] ] }.to_h
  # end

  # def test(example)
  #   "#{example["file_path"]}:#{example["line_number"]}"
  # end

end