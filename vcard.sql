-- Vcards storage MySQL Implementation, 0.1

CREATE DATABASE vcard;
CREATE TABLE vcard.card (
	card_id INT(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY card_id (card_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE vcard.card_object (
	co_id INT(11) NOT NULL AUTO_INCREMENT,
	object_name VARCHAR(32)
	PRIMARY KEY co_id (co_id),
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


INSERT INTO vcard.card_object (co_id,object_name) VALUES (1,'general'),(2,'phone'),(3,'email'),(4,'address'),(5,'website'),(6,'comments');

CREATE TABLE vcard.card_object_attributes (
	coa_id INT(11) NOT NULL AUTO_INCREMENT,
	co_id INT(11) NOT NULL,
	attribute_name VARCHAR(32),
	PRIMARY KEY coa_id (coa_id),
	KEY co_id (co_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO card_object_attributes (coa_id,co_id,attribute_name) VALUES (1,1,'N'),(2,1,'FN'),(3,1,'ORG'),(4,1,'TITLE'),(5,1,'PHOTO'),(6,1,'TYPE'),(7,2,'TYPE'),(8,3,'TYPE'),(9,4,'TYPE'),(10,5,'TYPE');

CREATE TABLE vcard.card_object_type (
	cot_id INT(11) NOT NULL AUTO_INCREMENT,
	type_name VARCHAR(16)
	PRIMARY KEY cot_id (cot_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO vcard.card_object_type (cot_id,type_name) VALUES (1,'HOME'),(2,'WORK'),(3,'OTHER'),(4,'CUSTOM');
;
CREATE TABLE vcard.custom_type (
	ct_id INT(11) NOT NULL AUTO_INCREMENT
	type_name VARCHAR(16),
	PRIMARY KEY ct_id (ct_id) 
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE vcard.card_value (
	cv_id INT(11) NOT NULL AUTO_INCREMENT,
	coa_id INT(11) NOT NULL,
	card_id INT(11) NOT NULL,
	value VARCHAR(128),
	PRIMARY KEY cv_id (cv_id),
	KEY coa_id (coa_id),
	KEY card_id (card_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE vcard.card_value_type (
	cvt_id INT(11) NOT NULL AUTO_INCREMENT,
	cv_id INT (11) NOT NULL,
	is_custom TINYINT(1) DEFAULT 0,
	type_id INT(11) NOT NULL,
	PRIMARY KEY cvt_iid (cvt_id),
	KEY cv_id (cv_id),
	KEY is_custom (is_custom),
	KEY type_id (type_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE vcard.card_comments (
	cc_id INT(11) NOT NULL AUTO_INCREMENT,
	comment VARCHAR(256) NOT NULL,
	PRIMARY KEY cc_id
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


SELECT
	card.card_id,
	co.object_name,
	coa.attribute_name,
	IFNUL(cot.type_name,IFNULL(ct.type_name,'') AS object_type
	cv.value,
	cc.comment
FROM
	vcard.card card
	INNER JOIN vcard.card_value cv ON cv.card_id = card.card_id
	INNER JOIN vcard.card_object_attributes coa ON coa.coa_id = cv.coa_id
	INNER JOIN vcard.card_object co ON co.co_id = coa.co_id
	LEFT JOIN vcard.card_value_type cvt ON cvt.cv_id = cv.cv_id
	LEFT JOIN vcard.card_object_type cot ON cot.cot_id = cvt.type_id AND cvt.is_custom = 0
	LEFT JOIN vcard.custom_type ct ON ct.ct_id = cvt.type_id AND cvt.is_custom = 1
;


/*
card_object: general, phone, email, address, website, comments
attibutes
	general: 1st name, last name, full name, company, title
	phone: type,
	address: type
	email: type
	website:type
type: home, work, other, custom,
value:

table card;
table card_object;
table card_object_attributes (coa_id,co_id,attibute_name) -- special attibute: type
table card_object_type (cot_id,type_name);
table card_value (cv_id,co_id,value);
table card_value_type (cvt_id,cv_id,cot_id);
table card_value_type_custom(cvt_id,custom_name);
table card_comments (cc_id,comment);
*/
