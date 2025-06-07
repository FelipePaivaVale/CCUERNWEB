class CreateJogos < ActiveRecord::Migration[7.1]
  def change
    create_table :jogos do |t|
      t.string :nome, null: false
      t.text :descricao
      t.text :regras
      t.integer :min_jogadores, null: false
      t.integer :max_jogadores, null: false
      t.timestamps
    end
  end
end
