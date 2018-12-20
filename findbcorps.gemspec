
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "findbcorps/version"

Gem::Specification.new do |spec|
  spec.name          = "findbcorps"
  spec.version       = FindBCorps::VERSION
  spec.authors       = ["sharonrieger"]
  spec.email         = ["sharonarieger@gmail.com"]

  spec.summary       = %q{An app for consumers and job seekers to find BCorporations in the United States to do business with or to work for.}
  spec.description   = %q{"What is a BCorp and why would I want to find one? "The B Corp community works toward reduced inequality, lower levels of poverty, a healthier environment, stronger communities, and the creation of more high quality jobs with dignity and purpose. B Corps use profits and growth as a means to a greater end: positive impact for their employees, communities, and the environment." --Bcorps}
  spec.homepage      = "https://github.com/sharonrieger/find_bcorps"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/sharonrieger/find_bcorps"
    spec.metadata["changelog_uri"] = "https://github.com/sharonrieger/find_bcorps/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "colored"

end
