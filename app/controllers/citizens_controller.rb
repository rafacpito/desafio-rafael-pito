require 'pry'
class CitizensController < ApplicationController
  before_action :set_citizen, only: %i[show edit update ]

  def index
    params[:q][:cpf_eq] = params[:q][:cpf_eq].gsub(/[.-]/, '') if params[:q].present? && params[:q][:cpf_eq].present?
    @q = Citizen.ransack(params[:q])
    @citizens = @q.result(distinct: true).page(params[:page])
  end

  def show
    @address = @citizen.address
  end

  def new
    @citizen = Citizen.new
    @citizen.build_address
  end

  def edit
  end

  def create
    @citizen = Citizen.new(citizen_params)

    respond_to do |format|
      if @citizen.save
        CitizenMailer.with(citizen: @citizen).new_citizen_email.deliver_later
        TwilioTextMessenger.send_sms("Munícipe criado no sistema OM30 com esse número de telefone")

        format.html { redirect_to citizen_url(@citizen), notice: "Munícipe criado com sucesso." }
        format.json { render :show, status: :created, location: @citizen }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @citizen.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @citizen.update(citizen_params)
        format.html { redirect_to citizen_url(@citizen), notice: "Munícipe atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @citizen }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @citizen.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_citizen
      @citizen = Citizen.find(params[:id])
    end

    def citizen_params
      params.require(:citizen).permit(:full_name, :cpf, :cns, :email, :birth_date, :telephone, :status, :photo, address_attributes: [:id, :street, :complement,
                                      :neighborhood, :city, :state, :postal_code, :ibge_code])
    end
end
