json.extract! favorite,
:id,
:user_id,
:campground_id,
:campground,
:created_at,
:updated_at
json.url v1_favorite_url(favorite, format: :json)
