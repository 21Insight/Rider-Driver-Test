Sequel.migration do
    change do
      create_table(:transactions) do
        primary_key :id
        foreign_key :ride_id, :rides
        Decimal :total_amount, size: [10, 2]
        String :transaction_id_wompi
      end
    end
  end
  