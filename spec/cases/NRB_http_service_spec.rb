require 'spec_helper'

describe NRB::HTTPService do

  describe 'class methods' do

    it 'has a default middleware' do
      expect(described_class.default_middleware).to be_a(Proc)
    end

    it 'has a default response class' do
      expect(described_class.default_response_class).to eq NRB::HTTPService::Response
    end

  end

  context 'making requests' do

    let(:args)       { {} }
    let(:body)       { {} }
    let(:connection) { double :connection, verb: connection_response,
                                           get: connection_response }
    let(:connection_response)   { double "skal", body: body, headers: headers, status: status }
    let(:headers)    { {} }
    let(:path)       { '/' }
    let(:response)   { described_class.new(path: path, verb: verb).make_request }
    let(:status)     { 200 }
    let(:verb)       { :get }

    context 'successful requests' do

      before do
        allow(Faraday).to receive(:new).and_return(connection)
      end
      it 'returns a Response object' do
        expect(response).to be_a described_class.default_response_class
      end

      it 'resuces with an successful Response object' do
        expect(response).to be_success
      end

    end


    context 'parse errors' do

      let(:error) { Faraday::Error::ParsingError.new(message) }
      let(:message) { "!Blark!" }

      before do
        allow(Faraday).to receive(:new).and_raise(error)
      end

      it 'resuces with a Response object' do
        expect(response).to be_a(described_class.default_response_class)
      end

      it 'resuces with an errored Response object' do
        expect(response).to be_errored
      end

      it 'gives you the error' do
        expect(response.body[:error]).to eq message
      end

    end

  end

end
