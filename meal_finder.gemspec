lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "meal_finder/version"

Gem::Specification.new do |spec|
  spec.name          = "meal_finder"
  spec.version       = MealFinder::VERSION
  spec.authors       = ["Jen"]
  spec.email         = ["jenniferanndcb@gmail.com"]

  spec.summary       = %q{Meal Finder}
  spec.description   = %q{Meal Finder allows users to find recipes from BBC Good Food by course}
  spec.homepage      = "https://github.com/jenniferanndcb/mealfinder"
  spec.license       = "MIT"

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["mealfinder"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
