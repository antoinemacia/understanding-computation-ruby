# magic_ball.rb
require "./test/test_helper.rb"
require './lib/machine'
require './lib/block'
require './lib/assign'
require './lib/variable'
require './lib/number'
require './lib/do_nothing'
require './lib/scope_gate'
require 'byebug'
class MachineTest < Minitest::Test

  def test_assignment_of_variable_in_parent_scope_works
    init_env = {x: Number.new(10)}
    expression = Block.new(Assign.new(:x, Number.new(3)))

    _, new_env = Machine.new(expression, init_env).run
    assert_equal(new_env[:x], Number.new(3))
  end

    def test_assignment_within_scoped_gate_is_not_persisted_upon_exit
    init_env = {x: Number.new(10)}
    expression = Block.new(Assign.new(:y, Number.new(10)))

    _, new_env = Machine.new(expression, init_env).run
    assert_nil(new_env[:y])
  end
end
