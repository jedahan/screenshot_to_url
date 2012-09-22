module ScreenshotToImgur
  class Watcher
    DEFAULT_OPTIONS = {
      filter: /\.png$/,
      force_polling: true,
      polling_fallback_message: false
    }.freeze

    # Returns a `Listen` object with default options, a `path` and
    # the callback `uploader`.
    def listener(params)
      listener = Listen.to(params[:path], DEFAULT_OPTIONS)
      listener.change(listener_callback(params[:uploader]))
      listener
    end

    # Returns a callback that is compatible with `Listen.change`.
    # Only modified and added files will be reported back one at
    # a time to the `callback`.
    def listener_callback(callback)
      Proc.new do |modified, added, removed|
        ((modified || []) + (added || [])).each { |file| callback.call(file) }
      end
    end

    # Starts watching for changes in the provided `path` and
    # will report changes back to the `uploader` callback.
    def watch(params)
      listener = listener(params)
      listener.start
    end
  end
end
