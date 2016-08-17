class Target
	# 完了しているか
	def exist?
		raise NotImplementedError, "You must implement #{self.class}##{__method__}"
	end
end