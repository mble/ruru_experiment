require "test_helper"
require "minitest/benchmark"

class RuruExperimentBenchmark < Minitest::Benchmark
  TEST_STRINGS = [
    "",
    '　',
    "\u00a0",
    "\r\n\r\n  ",
    "  \n\t  \r ",
    "this is a test",
    "   this is a longer test",
    "   this is a longer test
        this is a longer test
        this is a longer test
        this is a longer test
        this is a longer test"
  ].freeze

  def bench_ffi_blank?
    assert_performance_constant do |n|
      100_000.times do
        TEST_STRINGS.each do |str|
          RuruExperiment.is_blank str
        end
      end
    end
  end

  def bench_ruru_blank?
    assert_performance_constant do |n|
      100_000.times do
        TEST_STRINGS.each do |str|
          str.blank?
        end
      end
    end
  end

  def bench_active_support_blank?
    assert_performance_constant do |n|
      100_000.times do
        TEST_STRINGS.each do |str|
          str.old_blank?
        end
      end
    end
  end
end
