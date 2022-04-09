# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

#これを追記:carrierwave
#https://github.com/carrierwaveuploader/carrierwave#activerecord
require 'carrierwave/orm/activerecord'