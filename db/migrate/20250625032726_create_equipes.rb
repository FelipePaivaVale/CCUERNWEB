#nota: a palavra time é reserva no ruby e rails, não dar certo o comando
class CreateEquipes < ActiveRecord::Migration[8.0]
  def change
    create_table :equipes do |t|
      t.string :nome,        null: false
      t.references :competicao, null: false, foreign_key: true
      t.references :capitao,     null: false, foreign_key: { to_table: :usuarios }
      t.string :status,      null: false, default: 'ATIVO'
    end
  end
end