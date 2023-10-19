class CreateAttempts < ActiveRecord::Migration[7.1]
  def change
    create_table :attempts do |t|
      t.references :wordle, null: false, foreign_key: true
      t.string :answer

      t.timestamps
    end
  end
end
