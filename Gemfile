source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec
gem 'workarea', github: 'workarea-commerce/workarea', branch: 'v3.5-stable'

group :test do
  gem "workarea-testing"
  gem "simplecov-bamboo", require: false
end
