require 'rubygems'
require 'listen'

module ScreenshotToUrl
  autoload :Version,            'screenshot_to_url/version'
  autoload :Configuration,      'screenshot_to_url/configuration'
  autoload :CLI,                'screenshot_to_url/cli'
  autoload :Watcher,            'screenshot_to_url/watcher'
  autoload :Adapter,            'screenshot_to_url/adapter'

  module Adapters
    autoload :Imgur,            'screenshot_to_url/adapters/imgur'
  end

  class << self
    attr_writer :configuration

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
