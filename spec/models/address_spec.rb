require 'rails_helper'

RSpec.describe Address, type: :model do

  context 'validations' do
    it { is_expected.to validate_presence_of(:postal_code) }
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it {
      should validate_inclusion_of(:state).in_array(Address::BR_STATES)
    }
  end

  context 'associations' do
    it { should belong_to(:citizen) }
  end

  describe 'BeforeValidation Callbacks' do
    let(:address) { build(:address) }

    describe '#unmask_postal_code' do
      context 'when before validation trigger is called' do
        before do
          address.save
        end

        it 'unmask postal code' do
          expect(only_numbers_string?(address.postal_code)).to be_truthy
        end
      end
    end
  end
end