require_relative "../config.rb"

class APICall

  def self.get_data
    url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'
    parameters = {
        'start' => '1',
        'limit' =>'10',
        'convert' => 'USD'
    }
    headers = {
        'Accepts' => 'application/json',
        'X-CMC_PRO_API_KEY' => APIKey.api_key,
        "params" => parameters
    }

    response_string = RestClient.get(url, headers)
    parsed_data = JSON.parse(response_string)
  end


end
