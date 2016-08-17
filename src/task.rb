# task.rb

# １処理を表す
# 基本的に１タスク１クラスの設計です
class Task
	# 実行する処理
	def run
		raise NotImplementedError, "You must implement #{self.class}##{__method__}"
	end

	# 依存先を返す
	def requires
		[]
	end

	# 実行結果を返す
	#
	# 前回の実行結果をWorkflowで取得したいのでrunの戻り値として結果を返せない
	def output
		raise NotImplementedError, "You must implement #{self.class}##{__method__}"
	end

	# Taskクラス同士を比較するためのメソッド
	def eql?(other)
		self.hash == other.hash
	end
	def hash
		self.class.name.hash
	end
end