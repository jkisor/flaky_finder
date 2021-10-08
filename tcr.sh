#!/bin/sh

(git diff --name-only | grep Gemfile) && bundle install
git add .
bundle exec rspec && git commit -m "auto-commit" || git reset --hard

