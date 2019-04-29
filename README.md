# vcards
a simple Vcards storage MySQL Implementation

build.sql - create the tables
extract.sql - get the specific card


# Tables
table card;
table card_object;
table card_object_attributes (coa_id,co_id,attibute_name) -- special attibute: type
table card_object_type (cot_id,type_name);
table card_value (cv_id,co_id,value);
table card_value_type (cvt_id,cv_id,cot_id);
table card_value_type_custom(cvt_id,custom_name);
table card_comments (cc_id,comment);

# vcards attributes as set

card_object: general, phone, email, address, website, comments
attibutes
	general: 1st name, last name, full name, company, title
	phone: type,
	address: type
	email: type
	website:type
type: home, work, other, custom,
