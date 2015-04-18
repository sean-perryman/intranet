json.array!(@vm_problems) do |vm_problem|
  json.extract! vm_problem, :id, :who_are_you, :what_is_the_problem, :resolved
  json.url vm_problem_url(vm_problem, format: :json)
end
