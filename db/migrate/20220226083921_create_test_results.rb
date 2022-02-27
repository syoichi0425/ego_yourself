class CreateTestResults < ActiveRecord::Migration[7.0]
  def change
    create_table :test_results do |t|
      t.string :type
      t.text :character
      t.text :stregth
      t.text :weaknes
      t.text :people_around_you

      t.timestamps
    end
  end
end
