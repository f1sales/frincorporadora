require File.expand_path '../spec_helper.rb', __FILE__
require 'ostruct'
require "f1sales_custom/hooks"

RSpec.describe F1SalesCustom::Hooks::Lead do

  context 'when is  ' do
    let(:source) do
      source = OpenStruct.new
      source.name = 'Facebook - FRIncorporadora'
      source
    end

    let(:product_urbs) do
      product = OpenStruct.new
      product.name = 'URBS - Arvoredo Cerrado - Janeiro 2020'
      product
    end

    let(:product_marcelo) do
      product = OpenStruct.new
      product.name = 'Marcelo - Arvoredo Cerrado - Janeiro 2020'
      product
    end

    context 'when is to URBS' do

      let(:lead) do
        lead = OpenStruct.new
        lead.source = source
        lead.product = product_urbs

        lead
      end

      it 'sets URBS source' do
        expect(described_class.switch_source(lead)).to eq(described_class.sources[0][:name])
      end
    end

    context 'when is to Marcelo' do
      let(:lead) do
        lead = OpenStruct.new
        lead.source = source
        lead.product = product_marcelo

        lead
      end

      it 'sets Marcelo source' do
        expect(described_class.switch_source(lead)).to eq(described_class.sources[1][:name])
      end
    end

    context 'when is other' do
      let(:lead) do
        lead = OpenStruct.new
        lead.source = source
        lead.product = 'Apt - 232 - Top'

        lead
      end

      it 'sets deafault' do
        expect(described_class.switch_source(lead)).to eq(lead.source.name)
      end
    end
  end
end

