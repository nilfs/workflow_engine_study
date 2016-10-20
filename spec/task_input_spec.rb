require 'spec_helper'

class Task2A < ConstVariableTask
	def initialize
		super(1)
	end
end

class Task2B < ConstVariableTask
	def initialize
		super(4)
	end
end

class Task2C < ConstVariableTask
	def initialize
		super(5)
	end
end

$sumResult = 0
class SumTask < Task
	def initialize
		super()
		@target = ConstVariableTarget.new(nil)
	end

	def run
		sum = 0

		input.each do |variable|
			sum += variable.variable
		end

		$sumResult = sum

		@target = ConstVariableTarget.new(sum)
	end

	def output
		@target
	end
end

RSpec.describe "TaskA" do
	sumTask = SumTask.new
	sumTask.addRequiredTask( Task2A.new )
	sumTask.addRequiredTask( Task2B.new )
	sumTask.addRequiredTask( Task2C.new )

  it "は実行後、10を返す" do
   	Workflow.new.run(sumTask)

    expect($sumResult).to eq 10
  end
end