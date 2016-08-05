CREATE TABLE `accession` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accession` varchar(20) DEFAULT NULL,
  `source_link` varchar(225) DEFAULT NULL,
  `study_title` text,
  `organism` varchar(100) DEFAULT NULL,
  `date_last_update` varchar(20) DEFAULT NULL,
  `number_of_samples` varchar(20) DEFAULT NULL,
  `study_category` varchar(20) DEFAULT NULL,
  `summary` text NOT NULL,
  `curated` varchar(10) DEFAULT NULL,
  `pL_apt` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `gsm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accession` varchar(20) DEFAULT NULL,
  `sample` varchar(20) DEFAULT NULL,
  `description` text,
  `sample_type` varchar(20) DEFAULT NULL,
  `assay` varchar(45) DEFAULT NULL,
  `tissue` varchar(60) NOT NULL,
  `cell_lines` varchar(20) DEFAULT NULL,
  `gene` varchar(20) NOT NULL,
  `perturbation` varchar(35) NOT NULL,
  `disease` varchar(60) NOT NULL,
  `drug` varchar(20) NOT NULL,
  `concentration` varchar(20) NOT NULL,
  `time_point` varchar(20) NOT NULL,
  `cond` varchar(40) NOT NULL,
  `Label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `gsm_accession` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gsm_id` int(10) unsigned NOT NULL,
  `accession_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gsm_accession_gsm_id_foreign` (`gsm_id`),
  KEY `gsm_accession_accession_id_foreign` (`accession_id`),
  CONSTRAINT `gsm_accession_gsm_id_foreign` FOREIGN KEY (`gsm_id`) REFERENCES `gsm` (`id`),
  CONSTRAINT `gsm_accsession_accession_id_foreign` FOREIGN KEY (`accession_id`) REFERENCES `accession1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;