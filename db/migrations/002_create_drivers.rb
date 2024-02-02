Sequel.migration do
    change do
      create_table(:drivers) do
        primary_key :id
        String :name
        String :email
        Decimal :current_latitude, size: [10, 6]
        Decimal :current_longitude, size: [10, 6]
      end
    end
  end
  