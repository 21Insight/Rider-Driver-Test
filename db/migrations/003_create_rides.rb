Sequel.migration do
    change do
      create_table(:rides) do
        primary_key :id
        foreign_key :rider_id, :riders
        foreign_key :driver_id, :drivers
        String :status
        Decimal :start_latitude, size: [10, 6]
        Decimal :start_longitude, size: [10, 6]
        Decimal :end_latitude, size: [10, 6]
        Decimal :end_longitude, size: [10, 6]
      end
    end
  end
  