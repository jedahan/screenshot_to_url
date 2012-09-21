require 'test_helper'

class WatcherTest < Test::Unit::TestCase
  include ScreenshotToImgur

  def setup
    @watcher = Watcher.new
  end

  def test_watch
    uploader = Proc.new do |path|

    end

    @watcher.watch(path: '/tmp',
                   uploader: uploader)

    # @todo
  end
end
