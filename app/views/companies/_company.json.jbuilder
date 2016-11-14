json.extract! company, :id, :name, :profile_image_url, :created_at, :updated_at
json.url company_url(company, format: :json)