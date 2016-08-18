require 'spec_helper'

class Task2A < ConstVariableTask
	def initialize
		super(1)
	end

	def requires
		[]
	end	
end

class Task2B < ConstVariableTask
	def initialize
		super(4)
	end

	def requires
		[]
	end	
end

class Task2C < ConstVariableTask
	def initialize
		super(5)
	end

	def requires
		[]
	end	
end

$sumResult = 0
class SumTask < Task
	def initialize
		@target = ConstVariableTarget.new(nil)
	end

	def run
		sum = 0

		input.each do |variable|
			sum += variable.variable
		end
		@target = ConstVariableTarget.new(sum)
	end

	def requires
		[Task2A.new, Task2B.new, Task2C.new]
	end

	def output
		@target
	end
end

RSpec.describe "TaskA" do
  it "は実行後、10を返す" do
    Workflow.new.run(SumTask.new)

    expect($sumResult).to eq 10
  end
end