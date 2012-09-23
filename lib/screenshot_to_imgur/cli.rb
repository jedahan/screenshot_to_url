module ScreenshotToImgur
  class CLI
    def self.start
      ScreenshotToImgur.configure do |c|
        c.path_to_screenshots = '/tmp'
      end

      callback = Proc.new do |file|
        p file
      end

      ScreenshotToImgur::Watcher.new.watch(path: '/tmp', uploader: callback)
    end
  end
end
