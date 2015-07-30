# -*- encoding: utf-8 -*-
# stub: open-weather 0.11.0 ruby lib

Gem::Specification.new do |s|
  s.name = "open-weather"
  s.version = "0.11.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["HsPS mailme@hsps.in", "Deepak deepakkumarnd@gmail.com"]
  s.date = "2015-04-17"
  s.description = " A ruby wrapper for Open Weather Map API. "
  s.email = ["mailme@hsps.in"]
  s.homepage = "https://github.com/coderhs/ruby_open_weather_map"
  s.rubygems_version = "2.4.3"
  s.summary = "A ruby wrapper for Open Weather Map API."

  s.installed_by_version = "2.4.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<webmock>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<webmock>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
  end
end
