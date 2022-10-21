json.array!(@events) do |event|
  json.id event.id
  json.title event.plan
  json.start event.plan_datetime
  json.end event.plan_datetime
  json.url event_url(event, format: :html)

  json.borderColor "#ffffff"
  json.textColor "#383c3c"
  case event.color_id
    when 'pink' then
      json.backgroundColor "#f4b3c2"
    when 'red' then
      json.backgroundColor "#ec6d71"
    when 'orange' then
      json.backgroundColor "#f8b862"
    when 'yellow' then
      json.backgroundColor "#fef263"
    when 'yellow_green' then
      json.backgroundColor "#98d98e"
    when 'green' then
      json.backgroundColor "#3eb370"
    when 'light_blue' then
      json.backgroundColor "#66ccff"
    when 'blue' then
      json.backgroundColor "#3381ff"
    when 'purple' then
      json.backgroundColor "#a96ded"
    else
      json.backgroundColor "#ffffff"
  end
end