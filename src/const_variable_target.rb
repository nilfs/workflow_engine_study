require_relative 'target'

class ConstVariableTarget < Target
	attr_reader :variable

	def initialize( variable )
		@variable = variable
	end

	def exists?
		@variable != nil
	end
end