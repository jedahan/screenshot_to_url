require 'imgur'

module ScreenshotToImgur
  module Adapters
    class Imgur < Adapter
      attr_reader :api_key

      def initialize(options = {})
        configure(options)
      end

      def configure(options)
        options.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end

      def connector
        @connector ||= ::Imgur::API.new(api_key)
      end

      def upload_file(file)
        image_data = connector.upload_file(file)
        image_data['original_image']
      end
    end
  end
end
