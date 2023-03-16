require 'rails_helper'

RSpec.describe Citizen, type: :model do

  context 'validations' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:cns) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:telephone) }
    it { is_expected.to validate_presence_of(:birth_date) }
    it { is_expected.to validate_presence_of(:photo) }
  end

  context 'associations' do
    it { should have_one(:address) }
  end

  describe 'BeforeValidation Callbacks' do
    let(:citizen) { build(:citizen) }

    describe '#unmask_cpf_cns_and_telephone' do
      context 'when before validation trigger is called' do
        before do
          citizen.save
        end

        it 'unmask cpf, cns and telephone' do
          expect(only_numbers_string?(citizen.cpf)).to be_truthy
          expect(only_numbers_string?(citizen.cns)).to be_truthy
          expect(only_numbers_string?(citizen.telephone)).to be_truthy
        end
      end
    end
  end
end