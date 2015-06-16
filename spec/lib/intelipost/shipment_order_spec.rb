# coding: utf-8

describe Intelipost::ShipmentOrder do
  subject { Intelipost::ShipmentOrder.new(double('Intelipost::Client')) }

  let(:order_to_ship) do
    {
      'quote_id' => 59094,
      'delivery_method_id' => 2,
      'end_customer' => {
        'first_name' => 'Teste',
        'last_name' => 'QATLT',
        'email' => 'talita.sousa@intelipost.com.br',
        'phone' => '00231424551',
        'cellphone' => '01231233123',
        'is_company' => false,
        'federal_tax_payer_id' => '44611341801',
        'state_tax_payer_id' => '2314234',
        'shipping_address' => 'Avenida Paulista',
        'shipping_number' => '2',
        'shipping_additional' => 'Apto 202',
        'shipping_reference' => 'Supermercado Superpão',
        'shipping_quarter' => 'Consolação',
        'shipping_city' => 'São Paulo',
        'shipping_state' => 'São Paulo',
        'shipping_zip_code' => '01311-000',
        'shipping_country' => 'BR'
      },
      'shipment_order_volume_array' => [
      {
        'shipment_order_volume_number' => '1',
        'weight' => 3.2,
        'volume_type_code' => 'box',
        'width' => 10,
        'height' => 20,
        'length' => 30,
        'products_nature' => 'beverages',
        'products_quantity' => 3,
        'is_icms_exempt' => false,
        'tracking_code' => 'SW123456789BR',
        'shipment_order_volume_invoice' => {
          'invoice_series' => '1',
          'invoice_number' => '1000',
          'invoice_key' => '41140502834982004563550010000084111000132317',
          'invoice_date' => '12-03-14',
          'invoice_total_value' => '45.99',
          'invoice_products_value' => '39.99',
          'invoice_cfop' => '2890'
        }
      }
      ],
      'order_number' => '09123241214TLT',
      'estimated_delivery_date' => '2014-12-15'
    }
  end

  it 'correctly submit a shipment order' do
    expect(subject.connection).to receive(:post).with('shipment_order', order_to_ship)
    subject.create(order_to_ship)
  end

  let(:order_invoice) do
    {
      'order_number': '12314324',
      'shipment_order_volume_invoice_array': [
        {
          'shipment_order_volume_number':'1',
          'invoice_series':'123123123',
          'invoice_number':'BR283248123',
          'invoice_key':'CDFx2342396078192310231982',
          'invoice_date':'2014-02-28',
          'invoice_total_value':'32,49',
          'invoice_products_value':'28,99',
          'invoice_cfop': '5120'
        }
      ]
    }
  end

  it 'invoice update' do
    expect(subject.connection).to receive(:post).with('shipment_order/set_invoice', order_invoice)
    subject.set_invoice.update(order_invoice)
  end

  let(:order_tracking_code) do
    {
      'order_number': 'BR12345',
      'tracking_data_array': [
      {
        'shipment_order_volume_number':1,
        'tracking_code': 'SW123456789BR'
      },
      {
        'shipment_order_volume_number':2,
        'tracking_code': 'SW123456789BR'
      }
      ]
    }
  end

  it 'tracking update' do
    expect(subject.connection).to receive(:post).with('shipment_order/set_tracking_data', order_tracking_code)
    subject.set_tracking_data.update(order_tracking_code)
  end
end
