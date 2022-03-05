CREATE TABLE `taxrules_unnormalized` (
	`ruleid`	INT UNSIGNED	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`year_start`	SMALLINT UNSIGNED	NULL,
	`year_end`	SMALLINT UNSIGNED	NULL,
	`money_bottom`	BIGINT UNSIGNED	NULL,
	`money_top`	BIGINT UNSIGNED	NULL,
	`tax_rate`	DECIMAL(4,2)	NOT NULL,
	`max_exempt`	BIGINT UNSIGNED	NOT NULL
);

CREATE TABLE `tax_year` (
	`year_id`	INT UNSIGNED	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`year_start`	SMALLINT UNSIGNED	NULL,
	`year_end`	SMALLINT UNSIGNED	NULL
);

CREATE TABLE `tax_money` (
	`money_id`	INT UNSIGNED	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`money_bottom`	BIGINT UNSIGNED	NULL,
	`money_top`	BIGINT UNSIGNED	NULL
);

CREATE TABLE `tax_rate` (
	`rateid`	INT UNSIGNED	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`rate`	DECIMAL(4,2)	NULL
);

CREATE TABLE `tax_exempt` (
	`exemptid`	INT UNSIGNED	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`price`	BIGINT UNSIGNED	NULL
);

CREATE TABLE `tax_rules` (
	`ruleid`	INT UNSIGNED	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`year_id`	INT UNSIGNED	NOT NULL,
	`money_id`	INT UNSIGNED	NOT NULL,
	`rateid`	INT UNSIGNED	NOT NULL,
	`exemptid`	INT UNSIGNED	NOT NULL,
  FOREIGN KEY (`year_id`)	REFERENCES `tax_year`(`year_id`) ON DELETE CASCADE,
  FOREIGN KEY (`money_id`)	REFERENCES `tax_money`(`money_id`) ON DELETE CASCADE,
  FOREIGN KEY (`rateid`)	REFERENCES `tax_rate`(`rateid`) ON DELETE CASCADE,
  FOREIGN KEY (`exemptid`)	REFERENCES `tax_exempt`(`exemptid`) ON DELETE CASCADE
);

INSERT INTO `tax_year` (`year_start`, `year_end`) VALUES (2012, 2013), (2014, 2016), (2017, 2017), (2018, 2021), (2021, 9999);

INSERT INTO `tax_money` (`money_bottom`, `money_top`) VALUES (0, 12000000), (12000000, 46000000), (46000000, 88000000), (88000000, 300000000), (300000000, 99999999999);
INSERT INTO `tax_money` (`money_bottom`, `money_top`) VALUES (88000000, 150000000), (150000000, 99999999999);
INSERT INTO `tax_money` (`money_bottom`, `money_top`) VALUES (150000000, 500000000), (500000000, 99999999999);
INSERT INTO `tax_money` (`money_bottom`, `money_top`) VALUES (150000000, 300000000), (300000000, 500000000);
INSERT INTO `tax_money` (`money_bottom`, `money_top`) VALUES (50000000, 1000000000), (1000000000, 99999999999);

INSERT INTO `tax_rate` (`rate`) VALUES (6.00), (15.00), (24.00), (35.00), (38.00), (40.00), (42.00), (45.00);
INSERT INTO `tax_exempt` (`price`) VALUES (0), (1080000), (5220000), (14900000), (19400000), (23900000), (25400000), (29400000), (35400000), (65400000);

INSERT INTO `tax_rules` (`year_id`, `money_id`, `rateid`, `exemptid`) VALUES (1, 1, 1, 1), (1, 2, 2, 2), (1, 3, 3, 3), (1, 4, 4, 4), (1, 5, 5, 5);
INSERT INTO `tax_rules` (`year_id`, `money_id`, `rateid`, `exemptid`) VALUES (2, 1, 1, 1), (2, 2, 2, 2), (2, 3, 3, 3), (2, 6, 4, 4), (2, 7, 5, 9);
INSERT INTO `tax_rules` (`year_id`, `money_id`, `rateid`, `exemptid`) VALUES (3, 1, 1, 1), (3, 2, 2, 2), (3, 3, 3, 3), (3, 6, 4, 4), (3, 8, 5, 9), (3, 9, 6, 6);
INSERT INTO `tax_rules` (`year_id`, `money_id`, `rateid`, `exemptid`) VALUES (4, 1, 1, 1), (4, 2, 2, 2), (4, 3, 3, 3), (4, 6, 4, 4), (4, 10, 5, 9), (4, 11, 6, 10), (4, 9, 7, 7);
INSERT INTO `tax_rules` (`year_id`, `money_id`, `rateid`, `exemptid`) VALUES (5, 1, 1, 1), (5, 2, 2, 2), (5, 3, 3, 3), (5, 6, 4, 4), (5, 10, 5, 9), (5, 11, 6, 10), (5, 12, 7, 7), (5, 13, 8, 8);

SELECT `tax_rate`.`rate`, `tax_exempt`.`price` FROM `tax_rules`
  LEFT JOIN `tax_year` ON tax_rules.year_id=tax_year.year_id
  LEFT JOIN `tax_money` ON tax_rules.money_id=tax_money.money_id
  LEFT JOIN `tax_rate` ON tax_rules.rateid=tax_rate.rateid
  LEFT JOIN `tax_exempt` ON tax_rules.exemptid=tax_exempt.exemptid
  WHERE ? >= tax_year.year_start AND ? <= tax_year.year_end
  AND ? > tax_money.money_bottom AND ? <= tax_money.money_top;


SELECT `tax_rate`.`rate`, `tax_exempt`.`price` FROM `tax_rules`
  LEFT JOIN `tax_year` ON tax_rules.year_id=tax_year.year_id
  LEFT JOIN `tax_money` ON tax_rules.money_id=tax_money.money_id
  LEFT JOIN `tax_rate` ON tax_rules.rateid=tax_rate.rateid
  LEFT JOIN `tax_exempt` ON tax_rules.exemptid=tax_exempt.exemptid
  WHERE 2012 >= tax_year.year_start AND 2012 <= tax_year.year_end
  AND 12000000 > tax_money.money_bottom AND 12000000 <= tax_money.money_top;