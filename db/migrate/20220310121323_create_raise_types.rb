class CreateRaiseTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :raise_types do |t|
      t.integer :user_id, foreign_key: true
      t.text    :raise_type
      t.timestamps
    end
  end
end
