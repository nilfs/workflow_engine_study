require 'spec_helper'

$tasks = []

class TaskA < Task
	def run
		$tasks.push(self.class)
	end

	def requires
		[TaskB.new, TaskC.new]
	end
end

class TaskB < Task
	def run
		$tasks.push(self.class)
	end
end
class TaskC < Task
	def run
		$tasks.push(self.class)
	end
end

RSpec.describe "TaskA" do
  it "はTaskBとTaskCに依存している" do
  	expect(
  		TaskA.new.requires.map { |task| task.class }
  	).to eq [TaskB, TaskC]
    #expect(Hello.new.message).to eq "hello"
  end

  it "は、TaskB,TaskCの後に実行される" do
    Workflow.new.run(TaskA.new)

    expect($tasks).to eq [TaskB, TaskC, TaskA]
  end
end