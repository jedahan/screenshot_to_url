require 'rubygems'
require 'screenshot_to_imgur/version'
require 'screenshot_to_imgur/configuration'
require 'screenshot_to_imgur/watcher'

module ScreenshotToImgur
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
