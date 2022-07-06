json.extract! user, :id, :first_name, :last_name, :created_at, :updated_at, :gender, :age, :address
json.url user_url(user, format: :json)
