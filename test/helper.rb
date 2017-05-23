require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require_relative '../lib/chankura_client'
ENV['HOME'] = File.expand_path '../fixtures', __FILE__
