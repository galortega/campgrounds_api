json.extract! campground,
:id,
:name,
:location,
:description,
:price,
:image,
:is_favorited,
:created_at,
:updated_at
json.url v1_campground_url(campground, format: :json)
