require_relative 'lib/granja/version'

Gem::Specification.new do |spec|
  spec.name          = "granja"
  spec.version       = Granja::VERSION
  spec.authors       = ["Jose Daniel"]
  spec.email         = ["alu0101166247@ull.edu.es"]

  spec.summary       = "Gema para Granja"
  spec.description   = "Gema para representar granjas con sus datos y funciones"
  spec.homepage      = "https://github.com/ULL-ESIT-LPP-2122/granja-alu0101166247"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/ULL-ESIT-LPP-2122/granja-alu0101166247"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ULL-ESIT-LPP-2122/granja-alu0101166247"
  spec.metadata["changelog_uri"] = "https://github.com/ULL-ESIT-LPP-2122/granja-alu0101166247"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
  spec.add_development_dependency "yard"
end
