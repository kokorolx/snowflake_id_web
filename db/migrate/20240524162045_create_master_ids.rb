class CreateMasterIds < ActiveRecord::Migration[7.0]
  def change
    create_table :master_ids do |t|
      t.string :snowflake_id
      t.jsonb :snowflake_data

      t.timestamps
    end
  end
end
