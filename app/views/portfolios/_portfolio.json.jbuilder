json.extract! portfolio, :id, :image, :is_employed, :about, :cv, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)
