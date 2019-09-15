# magic_ball.rb
require "./test/test_helper.rb"
require './lib/machine'
require './lib/block'
require './lib/assign'
require './lib/variable'
require './lib/number'
require './lib/do_nothing'
require 'byebug'
class MachineTest < Minitest::Test

  def test_scope_evaluated
    expression = ::Machine.new(Block.new(Assign.new(:y, Number.new(3))), x: Number.new(10))
    byebug
  end
end
