require 'test_helper'

class ConfigurationTest < Test::Unit::TestCase
  def setup
    @configuration = ScreenshotToImgur::Configuration.new
  end

  def test_accessor_imgur_api_key
    imgur_api_key = 'test'
    @configuration.imgur_api_key = imgur_api_key
    assert_equal imgur_api_key, @configuration.imgur_api_key
  end

  def test_accessor_path_to_screenshots
    path_to_screenshots = '/tmp'
    @configuration.path_to_screenshots = path_to_screenshots
    assert_equal path_to_screenshots, @configuration.path_to_screenshots
  end
end
