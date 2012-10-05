module ScreenshotToUrl
  class Adapter
    def upload_screenshot(path_to_file)
      begin
        url = upload_file(path_to_file)
      rescue Exception => e
        return upload_failure(path_to_file, e)
      end

      upload_success(path_to_file, url)
    end

    def upload_success(path_to_file, url)
      trigger_callbacks(:success, path_to_file, url)
    end

    def upload_failure(path_to_file, exception)
      trigger_callbacks(:failure, path_to_file, exception)
    end

    def trigger_callbacks(method, *args)
    end

    def trigger_callback(callback, method, *args)
    end
  end
end
