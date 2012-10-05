require 'test_helper'

class ImgurTest < Test::Unit::TestCase
  include ScreenshotToUrl::Adapters

  def setup
    @imgur = Imgur.new
  end

  def test_configure
    options = { api_key: '1234' }

    @imgur.configure(options)

    assert_equal '1234', @imgur.api_key
  end

  def test_initialize_with_options
    options = { api_key: '1234' }

    @imgur = Imgur.new(options)

    assert_equal '1234', @imgur.api_key
  end

  def test_connector
    assert_equal ::Imgur::API, @imgur.connector.class
  end

  def test_connector_options
    options = { api_key: '1234' }

    @imgur = Imgur.new(options)

    assert_equal '1234', @imgur.connector.instance_variable_get('@api_key')
  end

  def test_upload_file
    image_data = { 'original_image' => 'http://example.com' }

    @imgur.connector.expects(:upload_file).once.with('/tmp/test.png').returns(image_data)

    assert_equal 'http://example.com', @imgur.upload_file('/tmp/test.png')
  end
end
