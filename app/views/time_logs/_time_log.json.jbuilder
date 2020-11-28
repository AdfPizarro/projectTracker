json.extract! time_log, :id, :author_id, :name, :minutes, :created_at, :updated_at
json.url time_log_url(time_log, format: :json)
