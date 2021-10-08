module FlakyFinder
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
end