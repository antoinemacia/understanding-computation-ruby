Dir[File.join('./lib', '*.rb')].each { |file| require file }
require 'byebug'
require "minitest/autorun"
