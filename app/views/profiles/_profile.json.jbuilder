json.extract! profile, :id, :avatar, :first_name, :second_name, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
