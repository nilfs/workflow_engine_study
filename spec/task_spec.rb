require 'spec_helper'

$tasks = []

class TaskA < Task
  def initialize()
    super()
    @target = AlwaysNotExistsTarget.new
  end

	def run
    @target = ConstVariableTarget.new(2)
		$tasks.push(self.class)
	end

	def output
		@target
	end

end

class TaskB < Task
  def initialize()
    super()
    @target = AlwaysNotExistsTarget.new
  end

	def run
    @target = ConstVariableTarget.new(3)
		$tasks.push(self.class)
	end

	def output
		@target
	end
end

class TaskC < Task

  def initialize()
    super()
    @target = AlwaysNotExistsTarget.new
  end

	def run
    @target = ConstVariableTarget.new(5)
		$tasks.push(self.class)
	end

	def output
		@target
	end
end

def createTaskA()
  taskA = TaskA.new
  taskA.addRequiredTask( TaskB.new )
  taskA.addRequiredTask( TaskC.new )

  return taskA
end

RSpec.describe "TaskA" do

  it "はTaskBとTaskCに依存している" do
  	expect(
  		createTaskA().requires.map { |task| task.class }
  	).to eq [TaskB, TaskC]
    #expect(Hello.new.message).to eq "hello"
  end

  it "は、TaskB,TaskCの後に実行される" do
    Workflow.new.run(createTaskA())

    expect($tasks).to eq [TaskB, TaskC, TaskA]
  end
end


