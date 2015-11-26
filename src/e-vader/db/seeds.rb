# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


### CLIENTS:

cristian = Client.create({
									firstname: "Cristian",
									lastname: "Barbaro",
									birthdate: "1988-04-22",
									genre: "M",
									document_number: 336814910,
									identification_code_type: "CUIL",
									identification_code_number: "20/0",
	})

juli = Client.create({
									firstname: "Julieta",
									lastname: "Romero",
									birthdate: "1995-08-14",
									genre: "F",
									document_number: 39888445,
									identification_code_type: "CUIL",
									identification_code_number: "17/0",
	})

ivan = Client.create({
									firstname: "Ivan",
									lastname: "Gianfelici",
									birthdate: "1995-05-05",
									genre: "M",
									document_number: 39115902,
									identification_code_type: "CUIL",
									identification_code_number: "17/4",
	})

braian = Client.create({
									firstname: "Braian Jonatan",
									lastname: "Gianfelici",
									birthdate: "1992-12-10",
									genre: "M",
									document_number: 39000112,
									identification_code_type: "CUIL",
									identification_code_number: "11/0",
	})


### PEOPLE

person_juana = Person.create({
									name: "Juana Virginia",
									identification_code_type: "CUIL",
									identification_code_number: "12/6",
	})

person_unlp = Person.create({
									name: "Universidad Nacional de La Plata",
									identification_code_type: "CUIT",
									identification_code_number: "22/6",
	})

person_nestor = Person.create({
									name: "Néstor Pérez",
									identification_code_type: "CUIL",
									identification_code_number: "21/6",
	})

person_ricardo = Person.create({
									name: "Ricardo Fuerte",
									identification_code_type: "CUIL",
									identification_code_number: "11/6",
	})

person_ledesma = Person.create({
									name: "Ledesma",
									identification_code_type: "CUIT",
									identification_code_number: "22/6",
	})

person_pepitos = Person.create({
									name: "Pepitos",
									identification_code_type: "CUIT",
									identification_code_number: "11/6",
	})

### CONTACTS

telefono = Contact.create({
									contact_type: "Teléfono",
	})

email = Contact.create({
									contact_type: "Correo electrónico",
	})

direccion = Contact.create({
									contact_type: "Dirección",
	})


### INVOICES

invoice_1 = Invoice.create({
									description: "Paga la cuota del cable (acá no hay subsidios).", 
									total_amount: 550.00, 
									discharge_date: "2015-11-24", 
									client_id: cristian.id,
									person_id: person_juana.id,
	})

invoice_2 = Invoice.create({
									description: "Pago de gas.", 
									total_amount: 550.00, 
									discharge_date: "2013-01-24", 
									client_id: cristian.id,
									person_id: person_nestor.id,
	})

invoice_3 = Invoice.create({
									description: "Pago de luz.", 
									total_amount: 550.00, 
									discharge_date: "2015-04-01", 
									client_id: braian.id,
									person_id: person_nestor.id,
	})

invoice_4 = Invoice.create({
									description: "Pago de impuestos.", 
									total_amount: 550.00, 
									discharge_date: "2014-04-01", 
									client_id: cristian.id,
									person_id: person_unlp.id,
	})

invoice_5 = Invoice.create({
									description: "Pago de luz.", 
									total_amount: 550.00, 
									discharge_date: "2015-04-01", 
									client_id: braian.id,
									person_id: person_nestor.id,
	})

invoice_6 = Invoice.create({
									description: "Pago de impuestos.", 
									total_amount: 550.00, 
									discharge_date: "2015-03-12", 
									client_id: cristian.id,
									person_id: person_unlp.id,
	})

invoice_7 = Invoice.create({
									description: "Pago de impuestos.", 
									total_amount: 550.00, 
									discharge_date: "2015-11-12", 
									client_id: cristian.id,
									person_id: person_ledesma.id,
	})

invoice_8 = Invoice.create({
									description: "Pago de impuestos.", 
									total_amount: 550.00, 
									discharge_date: "2015-04-12", 
									client_id: cristian.id,
									person_id: person_unlp.id,
	})

invoice_9 = Invoice.create({
									description: "Pago de impuestos.", 
									total_amount: 600.00, 
									discharge_date: "2015-05-12", 
									client_id: cristian.id,
									person_id: person_unlp.id,
	})

