require 'spec_helper'

class TaskA < Task
	def requires
		[TaskB.new, TaskC.new]
	end
end

class TaskB < Task; end
class TaskC < Task; end

RSpec.describe "TaskA" do
  it "はTaskBとTaskCに依存している" do
  	expect(
  		TaskA.new.requires.map { |task| task.class }
  	).to eq [TaskB, TaskC]
    #expect(Hello.new.message).to eq "hello"
  end
end