json.extract! issue, :id, :description, :state, :created_at, :updated_at
json.url issue_url(issue, format: :json)
