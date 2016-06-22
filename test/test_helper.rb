$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ruru_experiment'
require 'minitest/autorun'
require 'minitest/reporters'
require 'color_pound_spec_reporter'
RuruExperiment.activate_lib
Minitest::Reporters.use! [ColorPoundSpecReporter.new]
