require 'tsort'

# 有向非巡回グラフ
class DAG
	include TSort

	def initialize
		@tasks = {}
	end

	def tsort_each_node(&block)
		@tasks.each_key(&block)
	end

	def tsort_each_child(node, &block)
		@tasks.fetch(node).each(&block)
	end

	def add_task(task)
		_add_task(nil, task)
	end

	private

	def _add_task(parent, task)
		unless @tasks[task]
			@tasks[task] = task.requires
			task.requires.each do |r|
				_add_task(task,	r)
			end
		end
	end
end