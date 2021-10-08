require "json"

require "./lib/flakey_finder/runs"
require "./lib/flakey_finder/run"
require "./lib/flakey_finder/example"


class FlakeyFinder

  def find(path, sample_size = 10)
    Runs.new(
      (1..sample_size)
        .map { |_| `bundle exec rspec #{path} --format j` }
        .map { |results| JSON.parse(results).fetch("examples") }
        .map { |examples| Run.new(examples) }
    ).unstable_examples
  end


end