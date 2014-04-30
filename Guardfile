# -*- mode: ruby -*-
# vi: set ft=ruby :

guard :bundler do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end

guard :reek do
  watch(%r{.+\.rb$})
end

guard :rubocop, cli: %w{--display-cop-names} do
  watch(%r{.+\.rb$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end

guard :rspec, all_on_start: true do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch(%r{spec/support/(.+)\.rb$}) { "spec" }
end


