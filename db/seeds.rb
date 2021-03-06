# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(product_name: 'Jhonny Walker Black Label', product_description: 'Whisky', product_type_id: 1, unit: 10, price_per_unit: 100 )
Product.create(product_name: 'Jhonny Walker Red Label', product_description: 'Whisky', product_type_id: 1, unit: 10, price_per_unit: 120 )
Product.create(product_name: 'Jhonny Walker Gold Label', product_description: 'Whisky', product_type_id: 1, unit: 10, price_per_unit: 150 )
Product.create(product_name: 'Cuzquena Negra', product_description: 'Beer', product_type_id: 1, unit: 10, price_per_unit: 10 )
Product.create(product_name: 'Cuzquena Red Lagger', product_description: 'Beer', product_type_id: 1, unit: 10, price_per_unit: 10 )
Product.create(product_name: 'Cuzquena', product_description: 'Beer', product_type_id: 1, unit: 10, price_per_unit: 10 )
Product.create(product_name: 'Cristal', product_description: 'Beer', product_type_id: 1, unit: 10, price_per_unit: 10 )
Product.create(product_name: 'Pilsen', product_description: 'Beer', product_type_id: 1, unit: 10, price_per_unit: 10 )
Product.create(product_name: 'Pisco Sour - Limon', product_description: 'Drink', product_type_id: 1, unit: 10, price_per_unit: 10 )
Product.create(product_name: 'Pisco Sour - Maracuya', product_description: 'Drink', product_type_id: 1, unit: 10, price_per_unit: 10 )
Product.create(product_name: 'Pisco Sour - Acholado', product_description: 'Drink', product_type_id: 1, unit: 10, price_per_unit: 10 )


Location.create(name: 'OpenMic-Monterrico', description: 'Local monterrico', address: "frente upc", phone: "935395381", coordenate: "1.2222222; 1.3333333", management: 1, city_id: 1 )

Song.create(name: "morena_mia-miguel_bose", singer_band: "Miguel Bose", description: "Morena Mia - Miguel Bose", duration: 5, genere_id: 1, code: "MMIA-MBOSE-1", rate: 5)
Song.create(name: "forma_de_ser-autenticos_decadentes", singer_band: "Autenticos Decadentes", description: "Forma de Ser - Autenticos Decadentes", duration: 5, genere_id: 1, code: "FDS-ATDEC-1", rate: 5)