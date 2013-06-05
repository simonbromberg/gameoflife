#! /usr/bin/ruby

#require 'minitest/autorun'
require "test/unit"

class GameOfLife
	attr_reader :board

	def initialize (board)
		@board = board
	end

end

class GameOfLifeTest < Test::Unit::TestCase

	def test_class_exists
		assert_not_nil GameOfLife
	end

	def test_board_exists
		board = [
	[false, true, false, false, true],
	[true, true, false, false, true],
	[false, false, true, false, false],
	[true, false, false, false, false],
	[false, true, false, true, true]
	]

		assert GameOfLife.new board
	end

	def test_one_unit_board
		board = [false]
		gol = GameOfLife.new board
		assert gol.tick
	end
end