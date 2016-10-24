# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Address.create(street: '53 Bothfeld Rd', city: 'Newton', state: 'MA', zip_code: '02459', district_id: 1)
Address.create(street: '33 Harrison Ave', city: 'Boston', state: 'MA', zip_code: '02111', district_id: 1)
Address.create(street: '1 Boston Pl', city: 'Boston', state: 'MA', zip_code: '02108', district_id: 1)

District.create(name: 'MA-04', representative: 'Joe Kennedy III')
