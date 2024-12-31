json.extract! campground,
:id,
:name,
:location,
:description,
:price,
:created_at,
:updated_at
json.url campground_url(campground, format: :json)
