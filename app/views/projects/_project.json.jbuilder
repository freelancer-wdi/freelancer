json.extract! project, :id, :name, :status, :description, :requirements, :budget, :created_at, :updated_at
json.url project_url(project, format: :json)
