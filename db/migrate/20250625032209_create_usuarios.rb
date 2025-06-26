class CreateUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :usuarios do |t|
      t.string  :nome,       null: false
      t.string  :email,      null: false
      t.string  :senha,      null: false
      t.string  :tipo,       null: false, default: 'ALUNO'
      t.string  :departamento
      t.string  :esporte

      t.timestamps
    end

    add_index :usuarios, :email, unique: true
  end
end
