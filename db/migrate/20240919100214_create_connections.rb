class CreateConnections < ActiveRecord::Migration[7.2]
  def change
    create_table :connections do |t|
      t.references :follower, null: false, foreign_key: { to_table: :users }
      t.references :followed, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    # Add unique index to prevent duplicate connections
    add_index :connections, [ :follower_id, :followed_id ], unique: true
  end
end
