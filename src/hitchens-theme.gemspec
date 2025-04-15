# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "hitchens-theme"
  spec.version       = "0.8.0"
  spec.authors       = ["Pat Dryburgh"]
  spec.email         = ["hello@patdryburgh.com"]

  spec.summary       = "An inarguably well-designed theme for Jekyll."
  spec.homepage      = "https://github.com/patdryburgh/hitchens"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }

  spec.add_development_dependency "jekyll", "~> 4.4.1"
  spec.add_development_dependency "jekyll-paginate-v2", "~> 3.0.0"
  spec.add_development_dependency "jekyll-date-localization", "~> 0.0.8"
  spec.add_development_dependency "jekyll-minifier", "~> 0.1.10"
  spec.add_development_dependency "jekyll-sitemap", "~> 1.4.0"
  spec.add_development_dependency "jekyll-feed", "~> 0.17.0"
  spec.add_development_dependency "bundler", "~> 2.6.5"
  spec.add_development_dependency "rake", "~> 13.2.1"
end
