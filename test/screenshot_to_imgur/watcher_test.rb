require 'test_helper'

class WatcherTest < Test::Unit::TestCase
  include ScreenshotToImgur

  def setup
    @watcher = Watcher.new
  end

  def test_listener
    params = { path: '/tmp',
               callback: Proc.new { |path| true } }

    options = { filter: /\.png$/,
                force_polling: true,
                polling_fallback_message: false }

    callback = Proc.new { |modified, added, removed| true }

    @watcher.expects(:listener_callback).once.with(params[:callback]).returns(callback)

    listener = stub()
    Listen.expects(:to).once.with(params[:path], options).returns(listener)
    listener.expects(:change).once.with(&callback)

    assert_equal listener, @watcher.listener(params)
  end

  def test_listener_callback
    callback = stub()
    callback.expects(:call).once.with('/tmp/test1.png')
    callback.expects(:call).once.with('/tmp/test2.png')
    callback.expects(:call).once.with('/tmp/test3.png')

    listener_callback = @watcher.listener_callback(callback)
    listener_callback.call(['/tmp/test1.png', '/tmp/test2.png'], ['/tmp/test3.png'], [])
  end

  def test_watch
    params = { path: '/tmp',
               callback: Proc.new { |path| true } }

    listener = stub(:start => true)

    @watcher.expects(:listener).with(params).once.returns(listener)
    listener.expects(:start).once

    @watcher.watch(params)
  end
end
