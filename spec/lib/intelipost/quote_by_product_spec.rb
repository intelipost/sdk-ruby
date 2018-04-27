describe Intelipost::QuoteByProduct do
  subject { Intelipost::QuoteByProduct.new(double('Intelipost::Client')) }

  let(:products) do
    {
      'origin_zip_code' => '04037-003',
      'destination_zip_code' => '06396-200',
      "quoting_mode": "DYNAMIC_BOX_ALL_ITEMS",
      "products": [
         {
           "weight": 5,
           "cost_of_goods": 10.7,
           "width": 15,
           "height": 17.5,
           "length": 15,
           "quantity": 1,
           "sku_id": "SKU123",
           "product_category": "Bebidas"
         },
         {
           "weight": 7,
           "cost_of_goods": 20.99,
           "width": 20.5,
           "height": 30.7,
           "length": 20,
           "quantity": 1,
           "sku_id": "SKU456",
           "product_category": "Bebidas"
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
    expect(subject.connection).to receive(:post).with('quote_by_product', products)
    subject.create(products)
  end

  it 'will pull an existing quote by its id' do
    id = 99
    expect(subject.connection).to receive(:get).with("quote/#{id}")
    subject.get(99)
  end
end
