source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby '3.0.0'
ruby "2.7.5"
gem 'bigdecimal'
gem 'devise'
gem 'pry-rails'
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'bootstrap-sass'
gem 'rails', '~> 7.0.1'

# GitHub上にアドレスとパスワードをアップしない,お問合せフォームの作成
gem 'dotenv-rails'

# gem "chartkick"はグラフ作成のGem
gem 'chartkick'

gem 'simple_calendar', '~> 2.4'

# gem 'rails-i18n' :他言語を日本語にしたくsimple_calendar利用と同時に導入．
gem 'rails-i18n'

# deviseを日本語化
gem 'devise-i18n'

# 以前、何かの拍子にこっち側でbundle instalしていたのでなんかエラー出たらここら辺見てね
# gem 'rspec-rails'

gem 'font-awesome-rails'
gem 'font-awesome-sass'

gem 'kaminari'

gem 'bootstrap-will_paginate'
gem 'will_paginate'

# gem "carrierwave" :ユーザーのアバター画像を設定
gem 'carrierwave'
gem 'mini_magick'

# RSpec の起動を速くする設定  preloader である Spring を使用して、 Rails アプリケーションをバックグラウンドで走らる
gem 'spring-commands-rspec'

# RSpec の並列実行の設定 テストケースが多くなってくると、実行時間も増えるのでテストを並列実行して高速化を図る
gem 'rspec-queue'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  gem 'rspec-rails'
  #rspecで各テストケースを手軽に準備するgem
  gem 'factory_bot_rails'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  gem 'rubocop', require: false



end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end


group :production do
  # gem 'unicorn'
  gem 'unicorn', '~> 5.4.1'

end