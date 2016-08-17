require_relative 'target'

class AlwaysNotExistsTarget < Target
	def exists?
		false
	end
end