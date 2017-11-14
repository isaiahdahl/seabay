class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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

  def yelp_search(term, location)
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
      term: term,
      location: location,
      limit: SEARCH_LIMIT
    }

    response = HTTP.auth(bearer_token).get(url, params: params)
    response.parse
  end
end
