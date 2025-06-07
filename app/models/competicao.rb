class Competicao < ApplicationRecord
  belongs_to :jogo

  FORMATOS = %w[ELIMINATORIA LIGA GRUPOS_ELIMINATORIAS]
  STATUS = %w[ABERTA EM_ANDAMENTO CONCLUIDA]

  validates :formato, presence: true, inclusion: { in: FORMATOS }
  validates :status, presence: true, inclusion: { in: STATUS }
end
