require 'test_helper'

class AdapterTest < Test::Unit::TestCase
  include ScreenshotToImgur

  def setup
    @adapter = Adapter.new
  end

  def test_upload_screenshot
    path_to_file = '/tmp/test.png'
    return_url   = 'http://example.com'

    @adapter.expects(:upload_file).once.with(path_to_file).returns(return_url)
    @adapter.expects(:upload_success).once.with(path_to_file, return_url)
    @adapter.expects(:upload_failure).never

    @adapter.upload_screenshot(path_to_file)
  end

  def test_upload_screenshot_failure
    path_to_file = '/tmp/test.png'
    exception    = Exception.new('Failed to upload.')

    @adapter.expects(:upload_file).once.with(path_to_file).raises(exception)
    @adapter.expects(:upload_success).never
    @adapter.expects(:upload_failure).once.with(path_to_file, exception)

    @adapter.upload_screenshot(path_to_file)
  end

  def test_upload_success
    path_to_file = '/tmp/test.png'
    return_url   = 'http://example.com'

    @adapter.expects(:trigger_callbacks).once.with(:success, path_to_file, return_url)

    @adapter.upload_success(path_to_file, return_url)
  end

  def test_upload_failure
    path_to_file = '/tmp/test.png'
    exception    = Exception.new('Failed to upload.')

    @adapter.expects(:trigger_callbacks).once.with(:failure, path_to_file, exception)

    @adapter.upload_failure(path_to_file, exception)
  end
end
