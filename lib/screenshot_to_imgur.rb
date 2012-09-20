require 'rubygems'
require 'screenshot-to-imgur/version'
require 'screenshot-to-imgur/configuration'

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
