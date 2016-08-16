# task.rb
class Task
	def run
		raise NotImplementedError, "You must implement #{self.class}##{__method__}"
	end

	def requires
		[]
	end
end