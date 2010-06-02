ActiveRecord::Schema.define(:version => 0) do
  create_table :some_models do |t|
    t.column :deleted_at, :datetime
    t.column :name, :string
  end
end
