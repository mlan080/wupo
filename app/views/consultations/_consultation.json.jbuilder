json.extract! consultation, :id, :title, :description, :location, :text, :start_time, :end_time, :created_at, :updated_at
json.url consultation_url(consultation, format: :json)
