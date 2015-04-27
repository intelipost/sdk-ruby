require 'spec_helper'

describe Intelipost::Client, :vcr do
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

  context 'initialized with credentials' do
    subject { Intelipost::Client.new api_key: ENV['INTELIPOST_API_KEY'] }

    describe '#connection' do
      it 'is an instance of Faraday::Connection' do
        expect(subject.connection).to be_an_instance_of Faraday::Connection
      end

      it 'has the api_key header on the request' do
        expect(subject.connection.headers).to include('api_key')
      end
    end

    describe '#options' do
      it 'includes api_key' do
        expect(subject.options).to include(:api_key)
      end
    end

    describe '#cep' do
      it 'returns an correct response' do
        expect(subject.cep.address_complete('04661100')).to include('content')
      end
    end
  end
end
