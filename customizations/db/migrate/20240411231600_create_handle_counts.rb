class CreateHandleCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :handle_counts do |t|
      t.integer :count

      t.timestamps
    end
  end
end
