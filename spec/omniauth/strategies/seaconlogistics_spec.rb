require 'spec_helper'

describe OmniAuth::Strategies::SeaconLogistics do
  subject { described_class.new({}) }
  let(:access_token) { double('AccessToken', options: {}) }
  let(:parsed_response) { double('ParsedResponse') }
  let(:response) { double('Response', parsed: parsed_response) }

  before do
    allow(subject).to receive(:access_token).and_return(access_token)
  end

  context 'options' do
    let(:options) { subject.options }

    it { expect(options.name).to eq(:seaconlogistics) }
  end

  context 'client options' do
    let(:options) { subject.options.client_options }

    it { expect(options.site).to eq('https://cas.seaconlogistics.com') }
    it { expect(options.authorize_url).to eq('https://cas.seaconlogistics.com/oauth2.0/authorize') }
    it { expect(options.token_url).to eq('https://cas.seaconlogistics.com/oauth2.0/accessToken') }
  end

  describe '#raw_info' do
    it 'makes a call to /oauth2.0/profile' do
      expect(access_token).to receive(:get).with('oauth2.0/profile').and_return(response)

      expect(subject.raw_info).to eq(parsed_response)
    end
  end
end
