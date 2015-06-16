describe Intelipost::Cep do
  subject { Intelipost::Cep.new double('Intelipost::Client') }

  describe '#address_complete' do
    it 'correctly queries the cep' do
      expect(subject.connection).to receive(:get).with('cep_location/address_complete/00000000')
      subject.address_complete.get '00000000'
    end
  end
end
