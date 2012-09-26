module ScreenshotToImgur
  class Watcher
    DEFAULT_OPTIONS = {
      filter: /\.png$/,
      force_polling: true,
      polling_fallback_message: false
    }

    # Returns a `Listen` object with default options, a `path` and
    # the callback `uploader`.
    def listener(params)
      listener_instance = Listen.to(params[:path], DEFAULT_OPTIONS)
      listener_instance.change(&listener_callback(params[:callback]))
      listener_instance
    end

    # Returns a Proc that is compatible with `Listen.change`.
    # Only modified and added files will be reported back one at
    # a time to the `callback` method.
    def listener_callback(callback)
      Proc.new do |modified, added, _|
        ((modified || []) + (added || [])).each { |file| callback.call(file) }
      end
    end

    # Starts watching for changes in the provided `path` and
    # will report changes back to the `uploader` callback.
    def watch(params)
      listener_instance = listener(params)
      listener_instance.start
    end
  end
end
