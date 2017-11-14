Fish.destroy_all
User.destroy_all
Restaurant.destroy_all

puts "DESTROY DATABASE!!!"

30.times do
  password = Faker::Internet.password(8)
  User.create(
    email: Faker::Internet.free_email,
    password: password,
    password_confirmation: password
    )
end

p "USERS: #{User.all}"

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


  # Build our params hash
  params = {
    client_id: ENV["CLIENT_ID"],
    client_secret: ENV["CLIENT_SECRET"],
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

puts response

user_id = 1

response["businesses"].each do |biz|
  resto = Restaurant.new(
    name: biz["name"],
    address: biz["location"]["display_address"].join(" "),
    phone_number: biz["phone"],
    email: Faker::Internet.email,
    img_url: biz["image_url"],
    url: biz["url"],
    coordinates: biz["coordinates"].to_s,
    user_id: user_id += 1
    )
  resto.save
end


p "RESTAURANTS: #{Restaurant.all}"

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
"Monkfish"
]

fishes.each do |fish|
  Fish.create(name: fish)
end

p "FISH: #{Fish.all}"


30.times do
  password = Faker::Internet.password(8)
  User.create(
    email: Faker::Internet.free_email,
    password: password,
    password_confirmation: password
    )
end






