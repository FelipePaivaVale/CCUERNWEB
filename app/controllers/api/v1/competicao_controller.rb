class Api::V1::CompeticaoController < ApplicationController
  before_action :set_competicao, only: [:show, :update, :destroy]

  # GET /api/v1/competicao
  def index
     #render json: { message: "Funcionando!" }
     @competicoes = Competicao.all
    render json: @competicoes
  end

  # GET /api/v1/competicao/:id
  def show
    render json: @competicao
  end

  # POST /api/v1/competicao
  def create
    @competicao = Competicao.new(competicao_params)

    if @competicao.save
      render json: @competicao, status: :created
    else
      render json: { errors: @competicao.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/competicao/:id
  def update
    if @competicao.update(competicao_params)
      render json: @competicao
    else
      render json: { errors: @competicao.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/competicao/:id
  def destroy
    @competicao.destroy
    head :no_content
  end

  private

  def set_competicao
    @competicao = Competicao.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Competição não encontrada" }, status: :not_found
  end

  def competicao_params
    params.require(:competicao).permit(:nome, :jogo_id, :data_inicio, :data_fim, :formato, :status)
  end
end
