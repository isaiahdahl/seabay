10.times do
  User.create(
    email: Faker::Internet.free_email, 
    encrypted_password: Faker::Internet.password(8)
    )
end

CLIENT_ID = "8dOyMoqiFn7IX0pq7os-Kg"
CLIENT_SECRET = "BQvNDdZDJNtw5MTyhtDy4UJo8nEIucICk82IXl8y2ZCLU9FvVARYyfFbjUWT6Mxq"

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
TOKEN_PATH = "/oauth2/token"
GRANT_TYPE = "client_credentials"


DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "San Francisco, CA"
SEARCH_LIMIT = 30

def bearer_token
  # Put the url together
  url = "#{API_HOST}#{TOKEN_PATH}"

  raise "Please set your CLIENT_ID" if CLIENT_ID.nil?
  raise "Please set your CLIENT_SECRET" if CLIENT_SECRET.nil?

  # Build our params hash
  params = {
    client_id: CLIENT_ID,
    client_secret: CLIENT_SECRET,
    grant_type: GRANT_TYPE
  }

  response = HTTP.post(url, params: params)
  parsed = response.parse

  "#{parsed['token_type']} #{parsed['access_token']}"
end

def search(term, location)
  url = "#{API_HOST}#{SEARCH_PATH}"
  params = {
    term: term,
    location: location,
    limit: SEARCH_LIMIT
  }

  response = HTTP.auth(bearer_token).get(url, params: params)
  response.parse
end

response = search("seafood", "Lisbon")

response["businesses"].each do |biz|
  Restaurant.create(
    name: biz["name"],
    address: biz["display_address"],
    phone_number: biz["phone"],
    email: Faker::Internet.email,
    img_url: biz["image_url"],
    url: biz["url"],
    coordinates: biz["coordinates"],
    user_id: (1..10).to_a.sample
    )
end


fishes = ["Sardines", 
"Sea Bream", 
"Swordfish", 
"Grouper", 
"Sea Bass", 
"Octopus", 
"Shrimp", 
"Scarlet Shrimp", 
"Turbot", 
"Oysters", 
"Clams", 
"Razor Clams", 
"Crab", 
"Lobster", 
"European Lobster", 
"Squid", 
"Cuttlefish", 
"Prawns", 
"Hake", 
"Lamprey", 
"Mackerel", 
"Scabbard", 
"Mussels", 
"Scallops", 
"Ray Fish", 
"Tuna", 
"Atlantic Wreckfish", 
"Flounder", 
"John Dory", 
"Monkfish", 
"Goose Barnacles"]

fishes.each do |fish|
  Fish.create(name: fish)
end









