# 定数を返すタスク
require_relative 'task'
require_relative 'const_variable_target'

class ConstVariableTask < Task

	def initialize(variable)
		@variable = variable
		@target = ConstVariableTarget.new(nil)
	end

	def run
		@target = ConstVariableTarget.new(@variable)
	end

	def output
		@target
	end
end