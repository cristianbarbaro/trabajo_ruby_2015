# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cristian = Client.create({
									firstname: "Cristian",
									lastname: "Barbaro",
									birthdate: "1988-04-22",
									genre: "M",
									document_number: "336814910",
									identification_code_type: "cuil",
									identification_code_number: "20/0",
									client_type: "t"
	})

juli = Client.create({
									firstname: "Julieta",
									lastname: "Romero",
									birthdate: "1995-08-14",
									genre: "F",
									document_number: "39888445",
									identification_code_type: "cuil",
									identification_code_number: "17/0",
									client_type: "t"
	})

ivan = Client.create({
									firstname: "Ivan",
									lastname: "Gianfelici",
									birthdate: "1995-05-05",
									genre: "M",
									document_number: "39115902",
									identification_code_type: "cuil",
									identification_code_number: "17/4",
									client_type: "t"
	})

braian = Client.create({
									firstname: "Braian Jonatan",
									lastname: "Gianfelici",
									birthdate: "1992-12-10",
									genre: "M",
									document_number: "39000112",
									identification_code_type: "cuil",
									identification_code_number: "11/0",
									client_type: "t"
	})