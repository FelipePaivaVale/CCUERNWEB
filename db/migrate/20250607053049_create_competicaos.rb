class CreateCompeticaos < ActiveRecord::Migration[7.1]
  def change
    create_table :competicaos do |t|
      t.string :nome, null: false
      t.references :jogo, null: false, foreign_key: true
      t.date :data_inicio, null: false
      t.date :data_fim
      t.string :formato, null: false
      t.string :status, default: 'ABERTA'
      t.timestamps
    end
  end
end
