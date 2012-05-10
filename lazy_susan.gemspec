# -*- encoding: utf-8 -*-
require File.expand_path('../lib/lazy_susan/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mark Tabler\n"]
  gem.email         = ["mark.tabler@fallingmanstudios.net"]
  gem.description   = %q{An Automatic Index Migration Generator}
  gem.summary       = %q{LazySusan generates index migrations where they are needed; which is to say any column detected as a primary or foreign key that does not already have an index.}

  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "lazy_susan"
  gem.require_paths = ["lib", "lib/generators"]
  gem.version       = LazySusan::VERSION
end
