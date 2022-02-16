json.extract! dish, :id, :dishname, :cuisine_id, :created_at, :updated_at
json.url dish_url(dish, format: :json)
