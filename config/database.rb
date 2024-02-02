require 'sequel'

DB = Sequel.connect(
  adapter: 'postgres',
  host: 'localhost',
  database: 'tu_base_de_datos',
  user: 'tu_usuario',
  password: 'tu_contraseña'
)

Sequel.extension :migration
