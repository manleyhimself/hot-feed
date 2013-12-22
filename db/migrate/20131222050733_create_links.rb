class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :feed, index: true

      t.timestamps
    end
  end
end
