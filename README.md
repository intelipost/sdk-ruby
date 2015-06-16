[![Gem Version](https://badge.fury.io/rb/intelipost.svg)](http://badge.fury.io/rb/intelipost)
[![Build Status](https://travis-ci.org/natuelabs/intelipost.svg?branch=master)](https://travis-ci.org/natuelabs/intelipost)
[![Code Climate](https://codeclimate.com/github/natuelabs/intelipost/badges/gpa.svg)](https://codeclimate.com/github/natuelabs/intelipost)
[![Test Coverage](https://codeclimate.com/github/natuelabs/intelipost/badges/coverage.svg)](https://codeclimate.com/github/natuelabs/intelipost/coverage)


# intelipost
Gem for the Intelipost API

### Usage:

````ruby
# GET /cep_address/complete
require 'intelipost'

client = Intelipost::Client.new api_key: <your api key>
address = client.cep.address_complete.get '05307000'
# => #<Hashie::Mash content=#<Hashie::Mash bairro="Vila Ribeiro de Barros" city="São Paulo" ibge="3550308" neighborhood="Vila Ribeiro de Barros" state="São Paulo" state_short="SP" street="R Maj Paladino"> messages=[] status="OK" time="0.6 ms">
address.content.street
# => "R Maj Paladino"
````

````ruby
# POST /quote
require 'intelipost'

client = Intelipost::Client.new api_key: <your api key>
quote = client.quote.create({hash_of :intelipost, required: :args})
# => #<Hashie::Mash content=#<Hashie::Mash additional_information=#<Hashie::Mash client_type="gold" delivery_method_ids=[4, 3, 2] extra_cost_absolute=0.0 extra_cost_percentage=0.0 free_shipping=false lead_time_business_days=0 sales_channel="hotsite" tax_id=nil> client_id=1783 created=1433872646799 created_iso="2015-06-09T14:57:26.799-03:00" delivery_options=[#<Hashie::Mash delivery_estimate_business_days=1 delivery_method_id=4 delivery_method_name="Total Express" delivery_method_type="EXPRESS" delivery_note=nil description="Total Express" final_shipping_cost=5.05 logistic_provider_name="Total" provider_shipping_cost=5.05>, #<Hashie::Mash delivery_estimate_business_days=1 delivery_method_id=3 delivery_method_name="Correios eSedex" delivery_method_type="EXPRESS" delivery_note=nil description="Correios eSedex" final_shipping_cost=7.83 logistic_provider_name="Correios" provider_shipping_cost=7.83>, #<Hashie::Mash delivery_estimate_business_days=1 delivery_method_id=2 delivery_method_name="Correios Sedex" delivery_method_type="EXPRESS" delivery_note=nil description="Correios Sedex" final_shipping_cost=13.83 logistic_provider_name="Correios" provider_shipping_cost=13.83>] destination_zip_code="06396-200" id=4347667 origin_zip_code="04037-003" platform=nil volumes=[#<Hashie::Mash cost_of_goods=100.0 description=nil height=10.0 length=10.0 volume_type="BOX" weight=0.1 width=10.0>]> messages=[] status="OK" time="34.0 ms">
quote.content.id
# => 4347667
````

````ruby
# POST /shipment_order
require 'intelipost'

client = Intelipost::Client.new api_key: <your api key>
client.shipment_order.create({hash_of: :intelipost, args: :values})
````

````ruby
# POST /shipment_order/set_invoice
require 'intelipost'

client = Intelipost::Client.new api_key: <your api key>
client.shipment_order.set_invoice.update({hash_of: :intelipost, args: :values})
````

````ruby
# POST /shipment_order/set_tracking_data
require 'intelipost'

client = Intelipost::Client.new api_key: <your api key>
client.shipment_order.set_tracking_data.update({hash_of: :intelipost, args: :values})
````

### Development:

For testing, create a `.env` file with the following content:
````bash
INTELIPOST_API_KEY=<YOUR API KEY>
````
