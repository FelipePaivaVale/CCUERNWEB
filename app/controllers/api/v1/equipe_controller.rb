# app/controllers/api/v1/equipe_controller.rb
class Api::V1::EquipeController < ApplicationController
  before_action :set_equipe, only: [:show, :update, :destroy]

  # GET /api/v1/equipe
  def index
    @equipes = Equipe.all
    render json: @equipes
  end

  # GET /api/v1/equipe/:id
  def show
    render json: @equipe
  end

  # POST /api/v1/equipe
  def create
    @equipe = Equipe.new(equipe_params)
    if @equipe.save
      render json: @equipe, status: :created
    else
      render json: { errors: @equipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/equipe/:id
  def update
    if @equipe.update(equipe_params)
      render json: @equipe
    else
      render json: { errors: @equipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/equipe/:id
  def destroy
    @equipe.destroy
    head :no_content
  end

  private

  def set_equipe
    @equipe = Equipe.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Equipe não encontrada" }, status: :not_found
  end

  def equipe_params
    params.require(:equipe).permit(
      :nome,
      :competicao_id,
      :capitao_id,
      :status
    )
  end
end
