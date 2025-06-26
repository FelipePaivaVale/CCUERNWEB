#trocado de time para equipe por conta que Time e uma palavra reservada do Ruby e Rails
class Equipe < ApplicationRecord
  belongs_to :competicao
  belongs_to :capitao, class_name: 'Usuario'
  has_many :membro_times, dependent: :destroy

  STATUS = %w[ATIVO DESISTIU DESCLASSIFICADO]

  validates :nome,   presence: true
  validates :status, presence: true, inclusion: { in: STATUS }
end
