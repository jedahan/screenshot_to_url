require 'rubygems'
require 'listen'

module ScreenshotToImgur
  autoload :Version,            'screenshot_to_imgur/version'
  autoload :Configuration,      'screenshot_to_imgur/configuration'
  autoload :CLI,                'screenshot_to_imgur/cli'
  autoload :Watcher,            'screenshot_to_imgur/watcher'
  autoload :Adapter,            'screenshot_to_imgur/adapter'

  module Adapters
    autoload :Imgur,            'screenshot_to_imgur/adapters/imgur'
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
