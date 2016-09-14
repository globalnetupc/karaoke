# Set up gems listed in the Gemfile.                                                                                
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)                                               
                                                                                                                    
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])   

require 'rails/commands/server'

module Rails
  # Override default development
  # Server port
  class Server
    def default_options
      super.merge(Port: ENV["BASKET_APP_PORT"] || 3000, Host: '0.0.0.0')
    end
  end
end