class CreateWordles < ActiveRecord::Migration[7.1]
  def change
    create_table :wordles do |t|
      t.string :solution

      t.timestamps
    end
  end
end
