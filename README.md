[![Gem Version](https://badge.fury.io/rb/intelipost.svg)](http://badge.fury.io/rb/intelipost)
[![Build Status](https://travis-ci.org/natuelabs/intelipost.svg?branch=master)](https://travis-ci.org/natuelabs/intelipost)
[![Code Climate](https://codeclimate.com/github/natuelabs/intelipost/badges/gpa.svg)](https://codeclimate.com/github/natuelabs/intelipost)
[![Test Coverage](https://codeclimate.com/github/natuelabs/intelipost/badges/coverage.svg)](https://codeclimate.com/github/natuelabs/intelipost/coverage)


# intelipost
Gem for the Intelipost API

### Usage:

````ruby
require 'intelipost'

client = Intelipost::Client.new api_key: <your api key>
address = client.cep.address_complete '05307000'
# => #<Hashie::Mash content=#<Hashie::Mash bairro="Vila Ribeiro de Barros" city="São Paulo" ibge="3550308" neighborhood="Vila Ribeiro de Barros" state="São Paulo" state_short="SP" street="R Maj Paladino"> messages=[] status="OK" time="0.6 ms">
address.content.street
# => "R Maj Paladino"
````

### Development:

For testing, create a `.env` file with the following content:
````bash
INTELIPOST_API_KEY=<YOUR API KEY>
````
