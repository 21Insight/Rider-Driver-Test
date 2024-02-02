Sequel.migration do
  change do
    create_table(:riders) do
      primary_key :id
      String :name
      String :email
      String :payment_source_id
    end
  end
end
