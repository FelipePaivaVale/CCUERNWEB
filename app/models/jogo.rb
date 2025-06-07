class Jogo < ApplicationRecord
  has_many :competicaos, dependent: :destroy

  validates :nome, presence: true
  validates :min_jogadores, :max_jogadores, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
