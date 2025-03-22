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
yarn install --check-files
yarn build:css

bundle install
bundle exec rake assets:precompile
bundle exec rake db:migrate