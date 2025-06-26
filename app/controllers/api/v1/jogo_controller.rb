class Api::V1::JogoController < ApplicationController
  before_action :set_jogo, only: [:show, :update, :destroy]

  # GET /api/v1/jogo
  def index
    #render json: { message: "Funcionando!" }
    @jogos = Jogo.all
    render json: @jogos
  end

  # GET /api/v1/jogo/:id
  def show
    render json: @jogo
  end

  # POST /api/v1/jogo
  def create
    @jogo = Jogo.new(jogo_params)

    if @jogo.save
      render json: @jogo, status: :created
    else
      render json: { errors: @jogo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/jogo/:id
  def update
    if @jogo.update(jogo_params)
      render json: @jogo
    else
      render json: { errors: @jogo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/jogo/:id
  def destroy
    @jogo.destroy
    head :no_content
  end

  private

  def set_jogo
    @jogo = Jogo.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Jogo não encontrado" }, status: :not_found
  end

  def jogo_params
    params.require(:jogo).permit(:nome, :descricao, :regras, :min_jogadores, :max_jogadores)
  end
end
