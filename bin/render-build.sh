#!/usr/bin/env bash
# exit on error
set -o errexit

# -------------------------
# Node.js & Yarnのインストール追加
# -------------------------
# curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
# apt-get install -y nodejs
# npm install -g yarn

# -------------------------
# 既存のビルド処理
# -------------------------
bundle install
yarn install --check-files
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate

# bundle install
# bundle exec rake assets:precompile
# bundle exec rake assets:clean
# bundle exec rake db:migrate