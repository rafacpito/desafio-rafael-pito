require 'rails_helper'

RSpec.describe CitizensController, type: :controller do
  describe '#GET index' do
    let!(:citizens) { create_list(:citizen, 3) }

    context 'without filtering' do
      before do
        get :index, params: {}
      end

      it 'return all citizens' do
        expect(@controller.view_assigns['citizens']).to contain_exactly(*citizens)
      end
    end

    context 'filtering by cpf' do
      let(:filter_citizen) { create(:citizen) }

      before do
        get :index, params: { q: { cpf_eq: filter_citizen.cpf }}
      end

      it 'return only filter citizen' do
        expect(@controller.view_assigns['citizens']).to contain_exactly(filter_citizen)
      end
    end

    context 'filtering by full_name' do
      let(:filter_citizen) { create(:citizen) }

      before do
        get :index, params: { q: { full_name_cont: filter_citizen.full_name }}
      end

      it 'return only filter citizen' do
        expect(@controller.view_assigns['citizens']).to contain_exactly(filter_citizen)
      end
    end

    context 'filtering all citizen with status equal true' do
      let(:inactive_citizen) { create(:citizen, status: false) }
      
      before do
        get :index, params: { q: { status_true: true }}
      end

      it 'returns only active citizens' do
        expect(@controller.view_assigns['citizens']).to contain_exactly(*citizens)
      end
    end

    context 'filtering all citizen with status equal false' do
      let!(:inactive_citizen) { create(:citizen, status: false) }
      
      before do
        get :index, params: { q: { status_true: false }}
      end

      it 'returns only inactive citizens' do
        expect(@controller.view_assigns['citizens']).to contain_exactly(inactive_citizen)
      end
    end
  end

  describe '#GET show' do
    let(:citizen) { create(:citizen) }

    context 'sending a valid citizen' do
      before do
        get :show, params: { id: citizen.id }
      end

      it 'controller citizen must be equal citizen and address equal citizen address' do
        expect(@controller.view_assigns['citizen']).to eq(citizen)
        expect(@controller.view_assigns['address']).to eq(citizen.address)
      end
    end

    context 'sending a invalid citizen' do
      before do
        get :show, params: { id: 900 }
      end

      it 'controller citizen must be equal citizen and address equal citizen address' do
        expect(@controller.view_assigns['citizen']).to be_nil
        expect(@controller.view_assigns['address']).to be_nil
      end
    end
  end

  describe '#POST create' do
    let(:citizen) { build(:citizen) }
    let(:address) { build(:address) }
    let(:create_params) do
      {
        full_name: citizen.full_name,
        cpf: citizen.cpf,
        cns: citizen.cns,
        email: citizen.email,
        birth_date: citizen.birth_date,
        telephone: citizen.telephone,
        status: citizen.status,
        photo: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'brands', 'photos', 'photo.jpg')),
        address_attributes: {
          street: address.street,
          complement: address.complement,
          neighborhood: address.neighborhood,
          city: address.city,
          state: address.state,
          postal_code: address.postal_code,
          ibge_code: address.ibge_code,
        }
      }
    end

    context 'sending a valid citizen params' do
      before do
        post :create, params: { citizen: create_params }
      end

      it 'see if the citizen is persisted' do
        expect(@controller.view_assigns['citizen'].persisted?).to be_truthy
      end
    end

    context 'sending a invalid citizen params' do
      before do
        post :create, params: { citizen: create_params.except(:cpf) }
      end

      it 'see if the citizen is persisted' do
        expect(@controller.view_assigns['citizen'].persisted?).to be_falsey
      end
    end
  end

  describe '#PUT update' do
    let!(:citizen) { create(:citizen) }
    let(:build_citizen) { build(:citizen) }
    let(:update_params) { { full_name: build_citizen.full_name } }

    context 'sending a valid citizen' do
      before do
        put :update, params: { id: citizen.id, citizen: update_params }
      end

      it 'controller citizen must be equal citizen and address equal citizen address' do
        expect(@controller.view_assigns['citizen'].full_name).to eq(build_citizen.full_name)
      end
    end

    context 'sending a invalid citizen' do
      before do
        put :update, params: { id: Citizen.last.id + 1, citizen: update_params }
      end

      it 'controller citizen must be equal citizen and address equal citizen address' do
        expect(@controller.view_assigns['citizen']).to be_nil
      end
    end

    context 'sending a invalid params to update' do
      before do
        put :update, params: { id: citizen.id, citizen: { cpf: 'error' } }
      end

      it 'controller citizen must be equal citizen and address equal citizen address' do
        expect(@controller.view_assigns['citizen'].errors.present?).to be_truthy
      end
    end
  end
end