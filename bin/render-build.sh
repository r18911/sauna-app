#!/usr/bin/env bash
# exit on error
set -o errexit

# yarn install --check-files
# yarn build:css
bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate