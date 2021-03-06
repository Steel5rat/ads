require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)  
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module Ads
  class Application < Rails::Application
    config.encoding = "utf-8"

    config.filter_parameters += [:password, :password_confirmation]    

    config.active_support.escape_html_entities_in_json = true

    config.active_record.whitelist_attributes = true

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
  end
end
