# coding: utf-8

describe Intelipost::Client, :vcr do
  subject { Intelipost::Client.new api_key: ENV['INTELIPOST_API_KEY'] }

  context 'when initialized with no options' do
    subject { Intelipost::Client }

    it 'raises ArgumentError if initialized with no options' do
      expect do
        Intelipost::Client.new
      end.to raise_error ArgumentError
    end

    it 'raises ArgumentError if initialized without credentials' do
      expect do
        Intelipost::Client.new api_key: nil
      end.to raise_error ArgumentError
    end
  end

  context 'when call for an non existing defined class' do
    it '.method_missing' do
      expect { subject.foobar(1) }.to raise_error ArgumentError
    end
  end

  context 'initialized with credentials' do
    describe '#connection' do
      it 'is an instance of Faraday::Connection' do
        expect(subject.connection).to be_an_instance_of Faraday::Connection
      end

      it 'has the api_key header on the request' do
        expect(subject.connection.headers).to include('api_key')
      end
    end
  end

  context 'dealing with options' do
    it 'includes api_key' do
      expect(subject.options).to include(:api_key)
    end
  end

  context 'dealing with zipcode (cep)' do
    it 'returns a Intelipost::Mash on successful query' do
      response = subject.cep.address_complete.get('04661100')
      expect(response.class).to eq Intelipost::Mash
      expect(response.success?).to eq true
      expect(response.failure?).to eq false
      expect(response.all_messages).to eq ''
      expect(response.messages).to be_empty
    end
  end

  context 'dealing with Quotes' do
    let(:volumes) do
      {
        'origin_zip_code' => '04037-003',
        'destination_zip_code' => '06396-200',
        'volumes' => [
          {
            'weight' => 0.1,
            'volume_type' => 'BOX',
            'cost_of_goods' => 100,
            'width' => 10,
            'height' => 10,
            'length' => 10
          }
        ],
        'additional_information' => {
          'free_shipping' => false,
          'extra_cost_absolute' => 0,
          'extra_cost_percentage' => 0,
          'lead_time_business_days' => 0,
          'sales_channel' => 'hotsite',
          'client_type' => 'gold',
          'delivery_method_ids' => [
          4,
          3,
          2
          ]
        }
      }
    end

    it '.quote.create' do
      expect(subject.quote.create(volumes)).to have_key(:content)
    end

    it '.quote.create.failure' do
      response = subject.quote.create({'failure'=>'failure'})
      expect(response.success?).to eq false
      expect(response.failure?).to eq true
      expect(response.all_messages).not_to eq ''
      expect(response.messages).not_to be_empty
    end

    it '.quote.get(#)' do
      quote_id = subject.quote.create(volumes).content.id
      expect(subject.quote.get(quote_id)).to have_key(:content)
    end
  end
end
