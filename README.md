# workflow_engine_study

http://qiita.com/hakobera/items/d7742cc0801a9c62ef72

の内容を写しながら、最後はC++版を書きたいところ



## Qiitaの投稿から変えているところ

### Task#outputがクラス単位で管理されることを期待しているのでインスタンス単位に変更

Task#requiresでインスタンスを毎回生成しているのでoutputの結果をインスタンスごとに管理するようになっていない。
例の場合だと、outputがファイルシステムなどの外部から取得できることを前提としているので特に問題は起きない。outputをインスタンスのメンバとして管理したい場合に現在の実装では実現できなかったので変更した。

_create_requiresで必要なタスクを作れば良い
```ruby
class Task
	# 依存先のタスクを生成する
	def _create_requires
		[]
	end
	
	# 依存先を返す
	def requires
		@requires = _create_requires if @requires == nil

		@requires
	end
end

```
