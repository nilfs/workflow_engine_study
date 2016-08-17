require 'tsort'

require_relative 'dag'

class Workflow
  def run(task)
    dag = DAG.new
    dag.add_task(task)
    dag.tsort.each(&:run)
  end
end
