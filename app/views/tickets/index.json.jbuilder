json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :date_submitted, :date_occurred, :affected_user, :problem_description, :date_resolved, :problem_resolution
  json.url ticket_url(ticket, format: :json)
end
