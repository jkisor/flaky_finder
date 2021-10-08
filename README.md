# Flaky Finder

Find unstable, intermittently failing RSpec tests

## Usage

```
irb(main):001:0> require "./lib/flaky_finder"
=> true
irb(main):002:0> FlakyFinder.find("./support_spec/flaky_spec.rb")
=> ["./support_spec/flaky_spec.rb:2"]
```
