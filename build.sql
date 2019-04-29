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

