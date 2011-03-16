# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{refinerycms-forem}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Uckun", "Ryan Bigg"]
  s.date = %q{2011-03-17}
  s.description = %q{A port of forem to  refinerycms}
  s.email = %q{tim@uckun.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "app/controllers/forem/application_controller.rb",
    "app/controllers/forem/forums_controller.rb",
    "app/controllers/forem/posts_controller.rb",
    "app/controllers/forem/topics_controller.rb",
    "app/helpers/helpers/forem/application_helper.rb",
    "app/models/forem/forum.rb",
    "app/models/forem/post.rb",
    "app/models/forem/topic.rb",
    "app/views/forem/forums/_form.html.erb",
    "app/views/forem/forums/_forum.html.erb",
    "app/views/forem/forums/index.html.erb",
    "app/views/forem/forums/new.html.erb",
    "app/views/forem/forums/show.html.erb",
    "app/views/forem/posts/_form.html.erb",
    "app/views/forem/posts/_post.html.erb",
    "app/views/forem/posts/new.html.erb",
    "app/views/forem/topics/_form.html.erb",
    "app/views/forem/topics/new.html.erb",
    "app/views/forem/topics/show.html.erb",
    "config/locales/en.yml",
    "config/routes.rb",
    "lib/generators/refinerycms_forem_generator.rb",
    "lib/refinerycms-forem.rb"
  ]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Ruby on Rails forum engine for RefineryCMS}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<refinerycms>, [">= 0.9.9"])
      s.add_runtime_dependency(%q<simple_form>, [">= 0"])
    else
      s.add_dependency(%q<refinerycms>, [">= 0.9.9"])
      s.add_dependency(%q<simple_form>, [">= 0"])
    end
  else
    s.add_dependency(%q<refinerycms>, [">= 0.9.9"])
    s.add_dependency(%q<simple_form>, [">= 0"])
  end
end

