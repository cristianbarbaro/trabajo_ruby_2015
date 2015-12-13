# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


### CLIENTS:

cristian = Client.create!({
									firstname: "Cristian",
									lastname: "Barbaro",
									birthdate: "1988-04-22",
									genre: "M",
									document_number: 33681491,
									identification_code_type: "CUIL",
									identification_code_number: "20/0",
									client_contacts_attributes: {"0"=>{"contact_id"=>"1", "value"=>"123456789", "client_id"=>"", "id"=>""}}
	})

juli = Client.create!({
									firstname: "Julieta",
									lastname: "Romero",
									birthdate: "1995-08-14",
									genre: "F",
									document_number: 39888445,
									identification_code_type: "CUIL",
									identification_code_number: "17/0",
									client_contacts_attributes: {"0"=>{"contact_id"=>"1", "value"=>"123456789", "client_id"=>"", "id"=>""}}
	})

ivan = Client.create!({
									firstname: "Ivan",
									lastname: "Gianfelici",
									birthdate: "1995-05-05",
									genre: "M",
									document_number: 39115902,
									identification_code_type: "CUIL",
									identification_code_number: "17/4",
									client_contacts_attributes: {"0"=>{"contact_id"=>"1", "value"=>"123456789", "client_id"=>"", "id"=>""}}
	})

braian = Client.create!({
									firstname: "Braian Jonatan",
									lastname: "Gianfelici",
									birthdate: "1992-12-10",
									genre: "M",
									document_number: 39000112,
									identification_code_type: "CUIL",
									identification_code_number: "11/0",
									client_contacts_attributes: {"0"=>{"contact_id"=>"1", "value"=>"123456789", "client_id"=>"", "id"=>""}}
	})

esteban = Client.create!({
									firstname: "Esteban",
									lastname: "Rey",
									birthdate: "1963-11-10",
									genre: "M",
									document_number: 12000112,
									identification_code_type: "CUIL",
									identification_code_number: "14/7",
									client_contacts_attributes: {"0"=>{"contact_id"=>"1", "value"=>"123456789", "client_id"=>"", "id"=>""}}
	})


### PEOPLE

person_juana = Person.create!({
									name: "Juana Virginia",
									identification_code_type: "CUIL",
									identification_code_number: "12/6",
	})

person_unlp = Person.create!({
									name: "Universidad Nacional de La Plata",
									identification_code_type: "CUIT",
									identification_code_number: "22/6",
	})

person_nestor = Person.create!({
									name: "Néstor Pérez",
									identification_code_type: "CUIL",
									identification_code_number: "21/6",
	})

person_ricardo = Person.create!({
									name: "Ricardo Fuerte",
									identification_code_type: "CUIL",
									identification_code_number: "11/6",
	})

person_ledesma = Person.create!({
									name: "Ledesma",
									identification_code_type: "CUIT",
									identification_code_number: "22/6",
	})

person_pepitos = Person.create!({
									name: "Pepitos",
									identification_code_type: "CUIT",
									identification_code_number: "11/6",
	})

### CONTACTS

telefono = Contact.create!({
									contact_type: "Teléfono",
	})

email = Contact.create!({
									contact_type: "Correo electrónico",
	})

direccion = Contact.create!({
									contact_type: "Dirección",
	})

facebook = Contact.create!({
									contact_type: "Usuario de Facebook",
	})


### CLIENTS CONTACTS

cristian_contact_1 = ClientContact.create! ({
									value: "0221-15-5529657",
									client_id: cristian.id,
									contact_id: telefono.id
	})

cristian_contact_2 = ClientContact.create! ({
									value: "12 y 63",
									client_id: cristian.id,
									contact_id: direccion.id
	})

cristian_contact_3 = ClientContact.create! ({
									value: "cristian@castlerock.com",
									client_id: cristian.id,
									contact_id: email.id
	})

cristian_contact_4 = ClientContact.create! ({
									value: "Ruta 2 km 44,5. El Peligro.",
									client_id: cristian.id,
									contact_id: direccion.id
	})

juli_contact_1 = ClientContact.create! ({
									value: "011-15-60054345",
									client_id: juli.id,
									contact_id: telefono.id
	})

ivan_contact_1 = ClientContact.create! ({
									value: "Calle 420 y 208",
									client_id: ivan.id,
									contact_id: direccion.id
	})


### INVOICES

### Invoiced for Cristian:
invoice_1 = Invoice.create!({
									description: "Paga la cuota del cable (acá no hay subsidios).", 
									total_amount: 550.00, 
									discharge_date: "2013-11-24", 
									client_id: cristian.id,
									person_id: person_juana.id,
	})

invoice_2 = Invoice.create!({
									description: "Pago de gas.", 
									total_amount: 550.00, 
									discharge_date: "2013-12-24", 
									client_id: cristian.id,
									person_id: person_nestor.id,
	})

invoice_3 = Invoice.create!({
									description: "Pago de impuestos.", 
									total_amount: 550.00, 
									discharge_date: "2014-03-12", 
									client_id: cristian.id,
									person_id: person_pepitos.id,
	})

invoice_4 = Invoice.create!({
									description: "Pago de impuestos.", 
									total_amount: 550.00, 
									discharge_date: "2014-11-12", 
									client_id: cristian.id,
									person_id: person_ledesma.id,
	})

invoice_5 = Invoice.create!({
									description: "Pago de impuestos.", 
									total_amount: 550.00, 
									discharge_date: "2015-04-12", 
									client_id: cristian.id,
									person_id: person_pepitos.id,
	})

invoice_6 = Invoice.create!({
									description: "Pago de impuestos.", 
									total_amount: 600.00, 
									discharge_date: "2015-05-12", 
									client_id: cristian.id,
									person_id: person_unlp.id,
	})

invoice_7 = Invoice.create!({
									description: "Pago de impuestos.", 
									total_amount: 550.00, 
									discharge_date: "2015-06-01", 
									client_id: cristian.id,
									person_id: person_unlp.id,
	})

invoice_8 = Invoice.create!({
									description: "Pago de impuestos.", 
									total_amount: 600.00, 
									discharge_date: "2015-07-12", 
									client_id: cristian.id,
									person_id: person_unlp.id,
	})

invoice_9 = Invoice.create!({
									description: "Pago de impuestos por lectura.", 
									total_amount: 550.00, 
									discharge_date: "2015-11-01", 
									client_id: cristian.id,
									person_id: person_ricardo.id,
	})

# Invoiced for Braian:
invoice_10 = Invoice.create!({
									description: "Pago de luz abril.", 
									total_amount: 550.00, 
									discharge_date: "2014-04-01", 
									client_id: braian.id,
									person_id: person_nestor.id,
	})

invoice_11 = Invoice.create!({
									description: "Pago de luz mayo.", 
									total_amount: 550.00, 
									discharge_date: "2014-05-01", 
									client_id: braian.id,
									person_id: person_nestor.id,
	})

invoice_12 = Invoice.create!({
									description: "Pago de impuestos enero.", 
									total_amount: 550.00, 
									discharge_date: "2015-01-11", 
									client_id: braian.id,
									person_id: person_unlp.id,
	})

invoice_13 = Invoice.create!({
									description: "Pago de impuestos febrero.", 
									total_amount: 550.00, 
									discharge_date: "2015-02-01", 
									client_id: braian.id,
									person_id: person_unlp.id,
	})

#Invoiced for Juli:
invoice_14 = Invoice.create!({
									description: "Pago de internet.", 
									total_amount: 1550.00, 
									discharge_date: "2015-10-01", 
									client_id: juli.id,
									person_id: person_ricardo.id,
	})
