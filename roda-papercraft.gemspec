require_relative './lib/roda_papercraft_version'

Gem::Specification.new do |s|
  s.name        = 'roda-papercraft'
  s.version     = RODA_PAPERCRAFT_VERSION
  s.licenses    = ['MIT']
  s.summary     = 'roda-papercraft: Papercraft views for Roda'
  s.author      = 'Sharon Rosner'
  s.email       = 'sharon@noteflakes.com'
  s.files       = `git ls-files README.md CHANGELOG.md lib`.split
  s.homepage    = 'http://github.com/digital-fabric/roda-papercraft'
  s.metadata    = {
    "homepage_uri" => "https://github.com/digital-fabric/roda-papercraft",
    "changelog_uri" => "https://github.com/digital-fabric/roda-papercraft/blob/master/CHANGELOG.md"
  }

  s.rdoc_options = ["--title", "Roda-Papercraft", "--main", "README.md"]
  s.extra_rdoc_files = ["README.md"]
  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 3.4'

  s.add_runtime_dependency      'roda'
  s.add_runtime_dependency      'papercraft', '~>2.17'
  s.add_development_dependency  'minitest',   '~>5.25.5'
end
