require 'tsort'
require_relative 'dag'
require 'thread'

class Workflow
  def initialize(conf={})
    @dag = DAG.new
    @concurrency = conf[:concurrency] || 1
  end

  def run(task)
    @dag.add_task(task)
    _parallel(@dag.tsort, @concurrency) do |t|
    	until t.ready?
    		puts "#{Time.now} is not ready #{t.class.name}"
    		sleep 1
    	end
    	t.run unless t.completed?
    end
  end

  def _parallel(enumerable, concurrency)
  	q = Queue.new
  	enumerable.each{ |e| q << e }

  	proc = lambda do
  		until q.empty?
  			t = q.pop
  			puts "#{Time.now} pop task #{t.class.name}"
  			yield t
	  	end
  	end

  	threads = []
  	concurrency.times do
 		threads << Thread.start(&proc)
  	end
  	threads.each { |t| t.join }
  end
end
