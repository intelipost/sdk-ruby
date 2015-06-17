describe Intelipost::Quote do
  subject { Intelipost::Quote.new(double('Intelipost::Client')) }

  let(:volumes) do
    {
      'origin_zip_code' => '04037-003',
      'destination_zip_code' => '06396-200',
      'volumes' => [
        {
          'weight' => 0.1,
          'volume_type' => 'BOX',
          'cost_of_goods'=> 100,
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

  it 'correctly fetch for a quote' do
    expect(subject.connection).to receive(:post).with('quote', volumes)
    subject.create(volumes)
  end

  it 'will pull an existing quote by its id' do
    id = 99
    expect(subject.connection).to receive(:get).with("quote/#{id}")
    subject.get(99)
  end
end
