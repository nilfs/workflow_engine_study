# task.rb

# １処理を表す
# 基本的に１タスク１クラスの設計です
class Task
	# 実行する処理
	def run
		raise NotImplementedError, "You must implement #{self.class}##{__method__}"
	end

	# 実行結果を返す
	#
	# 前回の実行結果をWorkflowで取得したいのでrunの戻り値として結果を返せない
	def output
		raise NotImplementedError, "You must implement #{self.class}##{__method__}"
	end

	def initialize()
		@requireTasks = []
	end

	def addRequiredTask( task )
		@requireTasks.push(task)
	end

	# Taskが実行可能か
	def ready?
		requires.all? { |t| t.completed? }
	end

	def completed?
		output.exists?
		#output.all? { |o| o.exists? }
	end

	# 依存先を返す
	def requires
		@requireTasks
	end

	def input
		@input ||= requires.map { |task| task.output }
	end

	# Taskクラス同士を比較するためのメソッド
	def eql?(other)
		self.hash == other.hash
	end
	def hash
		self.class.name.hash
	end
end