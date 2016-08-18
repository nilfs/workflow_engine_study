class Target
	# 完了しているか
	def exists?
		raise NotImplementedError, "You must implement #{self.class}##{__method__}"
	end
end