require "bundler/gem_tasks"
require "rake/testtask"
require 'fileutils'
require 'ffi'

task :build_src do
  puts 'Building extension...'
  system("cd ext && cargo build --release && cd ..")
end

task :copy_bundle do
  puts 'Copying bundle...'
  suffix = FFI::Platform::LIBSUFFIX
  FileUtils.cp(
    "ext/target/release/libblankityblank.#{suffix}",
    'ext/target/release/libblankityblank.bundle'
  )
end

task :clean_src do
  puts 'Cleaning up build...'
  # Remove all but library file
  FileUtils.
    rm_rf(
      Dir.
      glob('target/release/*').
      keep_if {|f|
        !f[/\.(?:so|dll|dylib|bundle|deps)\z/]
      }
  )
end

task build_lib: [:build_src, :copy_bundle, :clean_src] do
  puts 'Completed build!'
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

Rake::TestTask.new(:bench) do |t|
  t.libs = %w(lib test)
  t.pattern = 'test/**/*_benchmark.rb'
end

task default: [:test, :bench]
