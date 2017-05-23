# Ruby client for Chankura Exchange API

[![Build Status](https://travis-ci.org/ChankuraExchange/chankura-client-ruby.svg?branch=master)](https://travis-ci.org/ChankuraExchange/chankura-client-ruby)
[![Code Climate](https://codeclimate.com/github/ChankuraExchange/chankura-client-ruby/badges/gpa.svg)](https://codeclimate.com/github/ChankuraExchange/chankura-client-ruby)
[![Test Coverage](https://codeclimate.com/github/ChankuraExchange/chankura-client-ruby/badges/coverage.svg)](https://codeclimate.com/github/ChankuraExchange/chankura-client-ruby/coverage)

`chankura-client-ruby` is a client for Chankura Exchange API, support all Chankura Exchange API functions like submit order, get tickers, etc. It's also a reference client implementation, where you can find how to authenticate private Chankura Exchange API.

### Requirements

* ruby 2.0.0 or higher (if you want to run 'rake test' in this gem you'll need ruby 2.1.0 or higher)
* openssl

### Install

```shell
$ gem install chankura_client
```

### Usage

#### Command line tool

TBD

#### REST API client

Use `#get` or `#post` to access API after you created a `ChankuraAPI::Client`:

```ruby
require 'chankura_client'

# Client can be initialized not providing key and sercet, but this client can only access public APIs
client_public = ChankuraAPI::Client.new endpoint: 'https://trading.chanura.com'

# GET public api /api/v2/markets
client_public.get_public '/api/v2/markets'

# To build a full functional client which can access both public/private api, access_key/secret_key
# are required.
#
# If there's no data received in `timeout` seconds, Net::OpenTimeout will be raised. Default to 60.
#
client = ChankuraAPI::Client.new access_key: 'your_access_key', secret_key: 'your_secret_key', endpoint: 'https://trading.chankura.com', timeout: 60

# GET private api /api/v2/orders with 'market=btczar'
client.get '/api/v2/orders', market: 'btczar'

# POST to create an order
client.post '/api/v2/orders', market: 'btczar', side: 'sell', volume: '0.11', price: '2955.0'

# POST to create multiple orders at once
client.post '/api/v2/orders/multi', market: 'btczar', orders: [{side: 'buy', volume: '0.15', price: '2955.0'}, {side: 'sell', volume: '0.16', price: '2956'}]
```

Check [Chankura API v2 Documents](https://trading.chankura.com/documents/api_v2) for details on Chankura API.

### Streaming API client

Streaming API client is built upon eventmachine, it will start an endless loop to accept updates from server side, you only need to provide a callback block:

```ruby
require 'chankura_client'

client = ChankuraAPI::StreamingClient.new access_key: 'your_access_key', secret_key: 'your_secret_key', endpoint: 'wss://trading.chankura.com:8080'
client.run do |message|
  # do whatever you want with message
end
```

### How To Contribute

Just create an issue or open a pull request :)
