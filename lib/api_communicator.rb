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
        'X-CMC_PRO_API_KEY' => '20b99dfd-44ae-4966-b9de-0a8784f8959b',
        "params" => parameters
    }

    response_string = RestClient.get(url, headers)
    parsed_data = JSON.parse(response_string)
  end


end
