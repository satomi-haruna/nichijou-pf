json.array!(@events) do |event|
  json.id event.id
  json.title event.plan
  json.start event.plan_datetime
  json.end  event.plan_datetime
  json.url event_url(event, format: :html)
end