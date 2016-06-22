require "ruru_experiment/version"
require 'ffi'
module RuruExperiment
  extend FFI::Library
  ffi_lib begin
    pre = Gem.win_platform? ? '' : 'lib'
    suffix = FFI::Platform::LIBSUFFIX
    dirname = File.dirname(__FILE__)
    target = '../ext/target/release/'
    "#{File.expand_path(target, dirname)}/#{pre}blankityblank.#{suffix}"
  end

  attach_function :init_blank, [], :void
  attach_function :is_blank, [ :string ], :bool

  def self.activate_lib
    init_blank!
  end

  private

  def self.init_blank!
    init_blank
  end
end
