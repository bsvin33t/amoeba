# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'amoeba/version'

Gem::Specification.new do |s|
  s.name        = 'amoeba'
  s.version     = Amoeba::VERSION
  s.authors     = ['Vaughn Draughon', 'Oleksandr Simonov']
  s.email       = 'alex@simonov.me'
  s.homepage    = 'http://github.com/amoeba-rb/amoeba'
  s.license     = 'BSD'
  s.summary     = 'Easy copying of rails models and their child associations.'

  s.description = <<-EOF
An extension to ActiveRecord to allow the duplication method to also copy associated children, with recursive support for nested of grandchildren. The behavior is controllable with a simple DSL both on your rails models and on the fly, i.e. per instance. Numerous configuration styles and preprocessing directives are included for power and flexibility. Supports preprocessing of field values to prepend strings such as "Copy of ", to nullify or process field values with regular expressions. Supports most association types including has_one :through and has_many :through.

Tags: copy child associations, copy nested children, copy associated child records, nested copy, copy associations, copy relations, copy relationships, duplicate associations, duplicate associated records, duplicate child records, duplicate children, copy all, duplicate all, clone child associations, clone nested children, clone associated child records, nested clone, clone associations, clone relations, clone relationships, cloning child associations, cloning nested children, cloning associated child records, deep_cloning, nested cloning, cloning associations, cloning relations, cloning relationships, cloning child associations, cloning nested children, cloning associated child records, nested cloning, cloning associations, cloning relations, cloning relationships, cloning child associations, cloning nested children, cloning associated child records, deep_cloning, nested cloning, cloning associations, cloning relations, cloning relationships, duplicate child associations, duplicate nested children, duplicate associated child records, nested duplicate, duplicate associations, duplicate relations, duplicate relationships, duplicate child associations, duplicate nested children, duplicate associated child records, deep_duplicate, nested duplicate, duplicate associations, duplicate relations, duplicate relationships, deep_copy, deep_clone, deep_cloning, deep clone, deep cloning, has_one, has_many, has_and_belongs_to_many
EOF

  s.rubyforge_project = 'amoeba'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  # specify any dependencies here; for example:
  s.add_development_dependency 'bundler', '>= 1.6.0'
  s.add_development_dependency 'rspec', '>= 3.0.0'
  
  s.add_dependency 'activerecord', '>= 4.2.0'

  if RUBY_PLATFORM == 'java'
    s.add_development_dependency 'activerecord-jdbc-adapter', '~> 1.3.2'
    s.add_development_dependency 'activerecord-jdbcsqlite3-adapter', '~> 1.3.2'
  else
    if Gem::Specification.find_by_name('activerecord').version >= Gem::Version.new('5.1.0')
      s.add_development_dependency 'sqlite3', '~> 1.4'
    else
      s.add_development_dependency 'sqlite3', '>= 1.3', '< 1.4'
    end
  end
end
