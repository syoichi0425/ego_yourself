class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.string :type
      t.text :character
      t.text :stregth
      t.text :weaknes
      t.text :people_around_you

      t.timestamps
    end
  end
end
