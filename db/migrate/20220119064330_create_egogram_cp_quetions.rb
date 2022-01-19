class CreateEgogramCpQuetions < ActiveRecord::Migration[7.0]
  def change
    create_table :egogram_cp_quetions do |t|
      t.string :title
      t.timestamps
    end
  end
end
