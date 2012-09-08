# Screenshot-To-Imgur

I often find myself using OS 'X built-in `CMD+Shift+4` keyboard shortcut to take
screenshots. I then manually upload the screenshot to [imgur](http://imgur.com).

The goal of this project is to automatically upload the screenshot and save the
screenshot's URL to the clipboard. A Growl notification will also be triggered to
notify the user when the upload has completed.

# Installation

At this time the installation is quite manual. I intend on using MacRuby to automate
this process later on.

- Change the folder to which the screenshots are saved: `defaults write com.apple.screencapture location /tmp`.
- Restart `SystemUIServer` for the changes to take effect: `killall SystemUIServer`.
- Obtain an [Anonymous imgur API key](https://imgur.com/register/api_anon).
- @todo...

# Starting the daemon

At this time the daemon must be started manually:

- `bundle exec screenshot-to-imgur` from within the project folder.

# Wishlist

- MacRuby version.
- Support imgur's authenticated API.

# License

screenshot-to-imgur is released under the MIT license:

- <www.opensource.org/licenses/MIT>
