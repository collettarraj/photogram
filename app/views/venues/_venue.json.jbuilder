json.extract! venue, :id, :venuename, :address, :neighborhood, :created_at, :updated_at
json.url venue_url(venue, format: :json)
