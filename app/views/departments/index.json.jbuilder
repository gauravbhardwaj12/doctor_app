json.array!(@departments) do |department|
  json.extract! department, :id, :dpt_name, :dpt_manager
  json.url department_url(department, format: :json)
end
