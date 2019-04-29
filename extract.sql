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
