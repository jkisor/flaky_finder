require "./lib/flaky_finder/example"

module FlakyFinder
  class Run
    def initialize(examples)
      @examples = examples.map { |e| Example.new(e) }
    end

    def keys
      @examples.map(&:key)
    end

    def example_result(key)
      to_h[key]
    end

    private

    def to_h
      @examples.map { |e| [ e.key, e.status ] }.to_h
    end

  end
end