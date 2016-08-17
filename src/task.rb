# task.rb

# 基本的に１タスク１クラスの設計です
class Task
	def run
		raise NotImplementedError, "You must implement #{self.class}##{__method__}"
	end

	def requires
		[]
	end

	def eql?(other)
		self.hash == other.hash
	end

	def hash
		self.class.name.hash
	end
end