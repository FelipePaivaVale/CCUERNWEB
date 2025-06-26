class Usuario < ApplicationRecord
  #has_many :inscricao_eventos, dependent: :destroy
  #has_many :membro_times,      dependent: :destroy
  has_many :equipes,           foreign_key: :capitao_id, dependent: :nullify

TIPOS = %w[ALUNO ADMIN GERENTE_EVENTO GERENTE_COMPETICAO]

  validates :nome,  presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :senha, presence: true
  validates :tipo,  presence: true, inclusion: { in: TIPOS }
end
