# app/controllers/api/v1/usuario_controller.rb
class Api::V1::UsuarioController < ApplicationController
  before_action :set_usuario, only: [:show, :update, :destroy]

  # GET /api/v1/usuario
  def index
    @usuarios = Usuario.all
    render json: @usuarios
  end

  # GET /api/v1/usuario/:id
  def show
    render json: @usuario
  end

  # POST /api/v1/usuario
  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      render json: @usuario, status: :created
    else
      render json: { errors: @usuario.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/usuario/:id
  def update
    if @usuario.update(usuario_params)
      render json: @usuario
    else
      render json: { errors: @usuario.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/usuario/:id
  def destroy
    @usuario.destroy
    head :no_content
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Usuário não encontrado" }, status: :not_found
  end

  def usuario_params
    params.require(:usuario).permit(
      :nome,
      :email,
      :senha,
      :tipo,
      :departamento,
      :esporte
    )
  end
end
