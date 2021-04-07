Gem::Specification.new do |s|
  s.name = 'canvas-blueprint-tool'
  s.version = '0.0.1'
  s.date = '2021-04-06'
  s.authors = ['maxwellbenton']
  s.email = 'curriculum@flatironschool.com'
  s.license = 'MIT'
  s.summary = 'canvas-blueprint-tool is a tool for associating and publishing courses on the Canvas LMS'
  s.files = Dir.glob('{bin,lib}/**/*') + %w[LICENSE.md README.md CONTRIBUTING.md Rakefile Gemfile]
  s.require_paths = ['lib']
  s.homepage = 'https://github.com/learn-co-curriculum/canvas-blueprint-tool'
  s.executables << 'canvas-blueprint-tool'
  s.add_runtime_dependency 'faraday', '~> 0.15'
  s.add_runtime_dependency 'rest-client', '~> 2.1'
  s.add_runtime_dependency 'json', '~> 2.3'
end