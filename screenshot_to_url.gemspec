# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "screenshot_to_url/version"

Gem::Specification.new do |s|
  s.name        = "screenshot_to_url"
  s.version     = ScreenshotToUrl::VERSION
  s.authors     = ["Christian Joudrey"]
  s.email       = ["cmallette@gmail.com"]
  s.homepage    = "https://github.com/cjoudrey/screenshot_to_url"
  s.summary     = %q{A simple tool that watches your screenshot folder and automatically uploads them to imgur.}

  s.rubyforge_project = "screenshot_to_url"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "imgur", "~> 0.2.0"
  s.add_runtime_dependency "growl", "~> 1.0.0"
  s.add_runtime_dependency "listen", "~> 0.5.0"

  s.add_development_dependency "mocha"
end
