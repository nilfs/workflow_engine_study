require_relative 'target'

class FileTarget < Target
	attr_reader :path

	def initialize(path)
		@path = path
	end

	def exist?
		File.exist?(path)
	end
end