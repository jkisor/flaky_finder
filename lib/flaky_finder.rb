require "json"

require "./lib/flaky_finder/runs"
require "./lib/flaky_finder/run"

module FlakyFinder

  def self.find(path, sample_size = 10)
    Runs.new(
      (1..sample_size)
        .map { |_| `bundle exec rspec #{path} --format j` }
        .map { |results| JSON.parse(results).fetch("examples") }
        .map { |examples| Run.new(examples) }
    ).unstable_examples
  end

end