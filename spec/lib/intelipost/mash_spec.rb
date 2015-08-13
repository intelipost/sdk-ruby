describe Intelipost::Mash do
  it 'will create a intelipost mash and check if it is a success response' do
    mash = Intelipost::Mash.new({status: 'OK'})
    expect(mash.success?).to eq true
    expect(mash.failure?).to eq false
    expect(mash.all_messages).to eq nil
  end

  it 'will create a intelipost mash and check if it is a failure response' do
    mash = Intelipost::Mash.new({messages:[
                                    {text: 'some error message'},
                                    {text: 'some error message2'}
                                ]})
    expect(mash.success?).to eq false
    expect(mash.failure?).to eq true
    expect(mash.all_messages).to eq 'some error message;some error message2'
  end

end