require "test_helper"
require "minitest/benchmark"
require "benchmark/ips"

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

  def bench_ips
    TEST_STRINGS.each do |str|
      puts "\n================== Test String Length: #{str.length} =================="
      Benchmark.ips do |x|
        x.report('RuRu blank?') do |times|
          i = 0
          while i < times
            str.blank?
            i += 1
          end
        end

        x.report('FFI blank?') do |times|
          i = 0
          while i < times
            RuruExperiment.is_blank str
            i += 1
          end
        end

        x.report('ActiveSupport blank?') do |times|
          i = 0
          while i < times
            str.old_blank?
            i += 1
          end
        end

        x.compare!
      end
    end
  end
end
