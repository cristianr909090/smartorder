DROP TABLE IF EXISTS adminusers;

CREATE TABLE `adminusers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `pre_phone_number` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `confirmation_code` varchar(45) DEFAULT NULL,
  `activated` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO adminusers VALUES(1,1001,admin,ec71aa934c3fb6d8144f45e26d9d7108,39,NULL,NULL,NULL,1);
INSERT INTO adminusers VALUES(2,1002,admin2,ec71aa934c3fb6d8144f45e26d9d7108,39,NULL,NULL,NULL,1);
INSERT INTO adminusers VALUES(3,1003,admin3,ec71aa934c3fb6d8144f45e26d9d7108,39,NULL,NULL,NULL,1);
INSERT INTO adminusers VALUES(4,1004,admin4,ec71aa934c3fb6d8144f45e26d9d7108,39,NULL,NULL,NULL,1);
INSERT INTO adminusers VALUES(5,1100,mauro,764aae830597be55f2fe97f20e4e2e48,39,NULL,NULL,NULL,1);



DROP TABLE IF EXISTS callstype;

CREATE TABLE `callstype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `printdescription` varchar(45) DEFAULT NULL,
  `monitordescription` varchar(45) DEFAULT NULL,
  `enable` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO callstype VALUES(1,1001,Chiama un cameriere,0,Chiamata semplice,Chiamata semplice,1);
INSERT INTO callstype VALUES(2,1001,Chiedi il conto,1,Richiesta conto,Richiesta conto,1);
INSERT INTO callstype VALUES(3,1001,Chiedi acqua,2,Richiesta acqua,Richiesta acqua,0);
INSERT INTO callstype VALUES(4,1001,Chiedi caffe,3,Chiedi caffe,Chiedi caffe,0);
INSERT INTO callstype VALUES(5,1001,Sono pronto per ordinare,4,Pronto per ordinare,Pronto per ordinare,1);



DROP TABLE IF EXISTS categories;

CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `tabId` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `visibility` int DEFAULT NULL,
  `cOrder` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `saleable` int DEFAULT NULL,
  `parent` int DEFAULT NULL,
  `expanded` int DEFAULT NULL,
  `rank` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=latin1;

INSERT INTO categories VALUES(1,1001,1,Primi di mare,1,0,1,1,17,0,40.0);
INSERT INTO categories VALUES(2,1001,1,Primi tipici,1,1,1,1,17,0,40.1);
INSERT INTO categories VALUES(3,1001,1,Antipasti,1,30,0,1,0,0,30);
INSERT INTO categories VALUES(4,1001,1,Antipasti di mare,1,0,1,1,3,0,30.0);
INSERT INTO categories VALUES(5,1001,1,Antipasti tipici,1,1,1,1,3,0,30.1);
INSERT INTO categories VALUES(6,1001,1,Secondi,1,50,0,1,0,0,50);
INSERT INTO categories VALUES(7,1001,1,Secondi di mare,1,0,1,1,6,0,50.0);
INSERT INTO categories VALUES(8,1001,1,Secondi di carne,1,1,1,1,6,0,50.1);
INSERT INTO categories VALUES(9,1001,1,Pizze,1,70,0,1,0,0,70);
INSERT INTO categories VALUES(10,1001,1,Bevande,1,10,0,1,0,0,10);
INSERT INTO categories VALUES(11,1001,1,Amari e Liquori,1,98,0,0,0,0,98);
INSERT INTO categories VALUES(12,1001,1,Caffe',1,95,0,1,0,0,95);
INSERT INTO categories VALUES(13,1001,1,Dessert e Frutta,1,90,0,1,0,0,90);
INSERT INTO categories VALUES(14,1001,1,Gelati,1,0,1,1,13,0,90.0);
INSERT INTO categories VALUES(15,1001,1,Dolci della casa,1,1,1,1,13,1,90.1);
INSERT INTO categories VALUES(16,1001,1,Carta dei vini,1,20,0,1,0,0,20);
INSERT INTO categories VALUES(17,1001,1,Primi,1,40,0,1,0,0,40);
INSERT INTO categories VALUES(21,1001,1,Risotti,0,2,1,1,17,0,40.2);
INSERT INTO categories VALUES(22,1001,1,Contorni,1,60,0,1,0,0,60);
INSERT INTO categories VALUES(23,1001,1,Insalatone,1,80,0,1,0,0,80);
INSERT INTO categories VALUES(24,1001,1,Frutta,1,2,1,1,13,0,90.2);
INSERT INTO categories VALUES(25,1001,1,Vini bianchi,1,0,1,1,16,0,20.0);
INSERT INTO categories VALUES(26,1001,1,Bianchi frizzanti,0,1,1,1,16,0,20.1);
INSERT INTO categories VALUES(27,1001,1,Vini rossi,1,2,1,1,16,0,20.2);
INSERT INTO categories VALUES(28,1001,1,Rossi frizzanti,0,3,1,1,16,0,20.3);
INSERT INTO categories VALUES(29,1001,1,Rosee,0,4,1,1,16,0,20.4);
INSERT INTO categories VALUES(30,1001,1,Bottiglie piccole,0,5,1,1,16,0,20.5);
INSERT INTO categories VALUES(31,1001,1,Spumanti e Champagne,1,6,1,1,16,0,20.6);
INSERT INTO categories VALUES(32,1001,1,Birre,1,1,1,1,10,1,10.1);
INSERT INTO categories VALUES(33,1001,1,Birre artigianali,1,1,2,1,32,0,10.1.1);
INSERT INTO categories VALUES(34,1001,1,Altre birre,1,1,2,1,32,0,10.1.2);
INSERT INTO categories VALUES(35,1001,1,Acqua e Bibite,1,5,1,1,10,0,10.5);
INSERT INTO categories VALUES(100,1001,6,Bevande,1,30,0,1,0,0,30);
INSERT INTO categories VALUES(101,1001,6,Acqua e Bibite,0,5,1,1,10,0,10.5);
INSERT INTO categories VALUES(102,1001,6,Birre,0,1,1,1,10,1,10.1);
INSERT INTO categories VALUES(103,1001,6,Birre artigianali,0,1,2,1,102,0,10.1.1);
INSERT INTO categories VALUES(104,1001,6,Altre birre,0,1,2,1,102,0,10.1.2);
INSERT INTO categories VALUES(105,1001,6,Amari,0,95,0,1,0,0,95);
INSERT INTO categories VALUES(106,1001,6,Caffe,1,90,0,1,0,0,90);
INSERT INTO categories VALUES(107,1001,6,Carta dei vini,0,20,0,1,0,0,20);
INSERT INTO categories VALUES(108,1001,6,Bianchi fermi,0,0,1,1,16,0,20.0);
INSERT INTO categories VALUES(109,1001,6,Bianchi frizzanti,0,1,1,1,16,0,20.1);
INSERT INTO categories VALUES(110,1001,6,Rossi fermi,0,2,1,1,16,0,20.2);
INSERT INTO categories VALUES(111,1001,6,Rossi frizzanti,0,3,1,1,16,0,20.3);
INSERT INTO categories VALUES(112,1001,6,Rosee,0,4,1,1,16,0,20.4);
INSERT INTO categories VALUES(113,1001,6,Bottiglie piccole,0,5,1,1,16,0,20.5);
INSERT INTO categories VALUES(114,1001,6,Spumanti e Champagne,0,6,1,1,16,0,20.6);
INSERT INTO categories VALUES(115,1001,6,Dessert & Frutta,0,30,0,1,0,0,30);
INSERT INTO categories VALUES(116,1001,6,Gelati,0,0,1,1,13,0,30.0);
INSERT INTO categories VALUES(117,1001,6,Dolci della casa,0,1,1,1,13,1,30.1);
INSERT INTO categories VALUES(118,1001,6,Frutta,1,40,0,1,0,0,40);
INSERT INTO categories VALUES(122,1001,7,Bianchi fermi,1,0,0,1,0,0,0);
INSERT INTO categories VALUES(123,1001,7,Bianchi frizzanti,1,1,0,1,0,0,1);
INSERT INTO categories VALUES(124,1001,7,Rossi fermi,1,2,0,1,0,0,2);
INSERT INTO categories VALUES(125,1001,7,Rossi frizzanti,1,3,0,1,0,0,3);
INSERT INTO categories VALUES(126,1001,7,Rosee,0,4,0,1,0,0,4);
INSERT INTO categories VALUES(127,1001,7,Bottiglie piccole,0,5,0,1,0,0,5);
INSERT INTO categories VALUES(128,1001,7,Spumanti e Champagne,1,6,0,1,0,0,6);
INSERT INTO categories VALUES(129,1001,8,Gelati,1,-1,-1,1,-1,-1,-1);
INSERT INTO categories VALUES(130,1001,16,Bevande,1,10,0,1,0,1,11);
INSERT INTO categories VALUES(131,1001,16,Acqua e Bibite,1,5,1,1,130,0,11.5);
INSERT INTO categories VALUES(132,1001,16,Birre,1,1,1,1,130,1,11.1);
INSERT INTO categories VALUES(133,1001,16,Birre artigianali,1,1,2,1,132,0,11.1.0);
INSERT INTO categories VALUES(134,1001,16,Altre birre,1,1,2,1,132,0,11.1.1);
INSERT INTO categories VALUES(135,1001,15,Pizze,1,0,0,1,0,1,1);
INSERT INTO categories VALUES(136,1001,1,Aperitivi,1,0,1,1,10,0,10.0);
INSERT INTO categories VALUES(137,1001,6,Aperitivi,0,0,1,1,10,0,10.0);
INSERT INTO categories VALUES(138,1001,16,Aperitivi,1,0,1,1,130,0,11.0);
INSERT INTO categories VALUES(139,1001,1,Birre alla spina,1,1,2,1,32,1,10.1.0);
INSERT INTO categories VALUES(140,1001,6,Birre alla spina,0,1,2,1,102,1,10.1.0);
INSERT INTO categories VALUES(141,1001,18,Offerte del giorno,1,0,0,1,0,1,1);
INSERT INTO categories VALUES(142,1001,6,Primi del giorno,1,10,0,1,0,1,10);
INSERT INTO categories VALUES(143,1001,6,Secondi del giorno,1,20,0,1,0,0,20);
INSERT INTO categories VALUES(145,1002,23,Pizze,1,0,0,1,0,1,0);
INSERT INTO categories VALUES(146,1002,22,Bevande,1,0,0,1,0,1,0);
INSERT INTO categories VALUES(147,1004,30,Aperitivi,1,0,0,1,0,0,10);
INSERT INTO categories VALUES(148,1004,30,Birre,1,0,0,1,0,0,20);
INSERT INTO categories VALUES(149,1004,30,Appetizer,1,0,0,1,0,0,30);
INSERT INTO categories VALUES(150,1004,30,Cocktail,1,0,0,1,0,0,40);
INSERT INTO categories VALUES(151,1004,30,Panini,1,0,0,1,0,0,50);
INSERT INTO categories VALUES(152,1004,30,Pizzeria,1,0,0,1,0,0,60);
INSERT INTO categories VALUES(153,1004,30,Gelateria,1,0,0,1,0,0,70);
INSERT INTO categories VALUES(154,1004,30,Bibite,1,0,0,1,0,0,25);
INSERT INTO categories VALUES(158,1001,1,prova altro livello,1,0,3,1,33,1,10.1.1.0);
INSERT INTO categories VALUES(159,1002,23,Pizze Speciali,1,1,0,1,0,1,1);
INSERT INTO categories VALUES(160,1100,35,Birre,1,1,0,0,0,1,1);
INSERT INTO categories VALUES(161,1100,35,Bevande,1,2,0,0,0,1,2);
INSERT INTO categories VALUES(162,1100,36,Panini,1,3,0,0,0,1,3);
INSERT INTO categories VALUES(163,1100,36,Salumi,1,4,0,0,0,1,4);
INSERT INTO categories VALUES(200,1011,51,Bollicine,1,0,0,0,0,1,0);
INSERT INTO categories VALUES(201,1011,51,Vini da dessert,1,1,0,1,0,1,1);
INSERT INTO categories VALUES(202,1011,51,Vini bianchi,1,2,0,1,0,1,2);
INSERT INTO categories VALUES(203,1011,51,Vini rossi,1,3,0,1,0,1,3);
INSERT INTO categories VALUES(204,1011,50,Antipasti,1,50,0,1,0,1,50);
INSERT INTO categories VALUES(205,1011,50,Primi piatti,1,60,0,1,0,1,60);
INSERT INTO categories VALUES(206,1011,50,Secondi piatti,1,70,0,1,0,1,70);
INSERT INTO categories VALUES(207,1011,50,La nostra griglia,1,80,1,1,206,1,70.80);
INSERT INTO categories VALUES(208,1011,50,Dolci,1,90,0,1,0,1,90);



DROP TABLE IF EXISTS clients;

CREATE TABLE `clients` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` longtext,
  `email` varchar(45) DEFAULT NULL,
  `skype` varchar(45) DEFAULT NULL,
  `facebook` mediumtext,
  `googleplus` mediumtext,
  `twitter` mediumtext,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `distance_range` int DEFAULT '5',
  `user_login_required` int DEFAULT NULL,
  `show_wait_time` int DEFAULT NULL,
  `choose_delivery_method` int DEFAULT NULL,
  `enable_order` int DEFAULT NULL,
  `lazy_required` int DEFAULT NULL,
  `show_rating` int DEFAULT NULL,
  `enable_print` int DEFAULT NULL,
  `descripion` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO clients VALUES(0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,44.751892,10.216155,5,0,0,0,0,0,1,0,Aperto dalle 7:00 alle 24:00, Giovedì chiuso);
INSERT INTO clients VALUES(1001,L'incontro,0524574479,Viale Agostino Berenini 43039 Salsomaggiore Terme Parma,NULL,NULL,NULL,NULL,NULL,44.814815,9.982874,5,0,1,0,1,0,1,0,NULL);
INSERT INTO clients VALUES(1002,L'incontro,0524574479,Viale Agostino Berenini 43039 Salsomaggiore Terme Parma,NULL,NULL,NULL,NULL,NULL,44.814815,9.982874,5,1,1,0,1,1,1,0,Orario di apertura 09:00-15:00 17:00-24:00);
INSERT INTO clients VALUES(1003,El guajiro,,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,1,0,1,1,0,NULL);
INSERT INTO clients VALUES(1004,Calyx,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1,1,1,0,NULL);
INSERT INTO clients VALUES(1011,Trattoria Beccofino,0521.658713,Via Umberto Terracini, 13, 43023 Monticelli Terme PR,info@trattoriabeccofino.it,NULL,https://www.facebook.com/beccofinofood/,NULL,NULL,44.730507,10.403463,10,0,1,1,0,0,1,0,Per il nostro servizio a Domicilio/Asporto, è gradita la prenotazione. 
 Info: 0521.658713);
INSERT INTO clients VALUES(1100,Centrale,0521805346,Viale Libertà, 2, 43044 Collecchio PR,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL);



DROP TABLE IF EXISTS events;

CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `name` mediumtext,
  `description` mediumtext,
  `long_description` mediumtext,
  `long_description_en` mediumtext,
  `visibility` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `image_path_low` varchar(100) DEFAULT NULL,
  `image_path_high` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO events VALUES(1,1001,Manuel Comelli show,tutto cio' che non ho mai vissuto,NULL,NULL,1,2013-08-01,20:00:00,NULL,NULL);
INSERT INTO events VALUES(2,1001,Finale Torneo di Beach Volley,Si affrontano le 4 migliori formazioni in un finale mozzafiato,,Ai vincitori un abbonamento per la stagione 2014,1,2013-08-01,22:30:00,NULL,NULL);
INSERT INTO events VALUES(3,1001,prova disattivato,NULL,NULL,NULL,0,2013-08-01,20:20:00,NULL,NULL);
INSERT INTO events VALUES(4,1001,Serata miss piscina 2012,con Giovanni Bonofiglio ,NULL,NULL,1,2013-08-02,19:30:00,NULL,NULL);
INSERT INTO events VALUES(5,1001,La Corrida,Dilettanti allo sbaraglio,,Conducono Gino & Umberto,1,2013-08-02,15:00:00,NULL,NULL);
INSERT INTO events VALUES(6,1001,Serata KARAOKE,con Michele Radianti,NULL,Iscriviti ora!,1,2013-08-03,20:00:00,NULL,NULL);
INSERT INTO events VALUES(7,1011,Trattoria Beccofino,Trattoria Beccofino \n Via Umberto Terracini, 13, 43023 Monticelli Terme PR \n 0521.658713 info@trattoriabeccofino.it \n Per il nostro servizio a Domicilio/Asporto, è gradita la prenotazione. \n Info: 0521.658713 \n seguici su facebook https://www.facebook.com/beccofinofood/,NULL,NULL,1,NULL,00:00:00,NULL,NULL);



DROP TABLE IF EXISTS menurowcategories;

CREATE TABLE `menurowcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `idM` int DEFAULT NULL,
  `idC` int DEFAULT NULL,
  `saleable` int DEFAULT NULL,
  `mcOrder` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1104 DEFAULT CHARSET=latin1;

INSERT INTO menurowcategories VALUES(1,1001,100,5,1,1);
INSERT INTO menurowcategories VALUES(2,1001,101,5,1,2);
INSERT INTO menurowcategories VALUES(3,1001,102,5,1,3);
INSERT INTO menurowcategories VALUES(4,1001,103,5,1,4);
INSERT INTO menurowcategories VALUES(5,1001,104,5,1,5);
INSERT INTO menurowcategories VALUES(6,1001,105,5,1,6);
INSERT INTO menurowcategories VALUES(7,1001,106,5,1,7);
INSERT INTO menurowcategories VALUES(8,1001,107,5,1,8);
INSERT INTO menurowcategories VALUES(9,1001,108,5,1,9);
INSERT INTO menurowcategories VALUES(10,1001,109,4,1,1);
INSERT INTO menurowcategories VALUES(11,1001,110,4,1,2);
INSERT INTO menurowcategories VALUES(12,1001,111,4,1,3);
INSERT INTO menurowcategories VALUES(13,1001,112,4,1,4);
INSERT INTO menurowcategories VALUES(14,1001,113,4,1,5);
INSERT INTO menurowcategories VALUES(15,1001,114,4,1,6);
INSERT INTO menurowcategories VALUES(16,1001,115,4,1,7);
INSERT INTO menurowcategories VALUES(17,1001,116,4,1,8);
INSERT INTO menurowcategories VALUES(18,1001,117,4,1,9);
INSERT INTO menurowcategories VALUES(19,1001,118,4,1,10);
INSERT INTO menurowcategories VALUES(20,1001,119,4,1,11);
INSERT INTO menurowcategories VALUES(21,1001,120,4,1,12);
INSERT INTO menurowcategories VALUES(22,1001,121,2,1,1);
INSERT INTO menurowcategories VALUES(23,1001,122,2,1,2);
INSERT INTO menurowcategories VALUES(24,1001,123,2,1,3);
INSERT INTO menurowcategories VALUES(25,1001,124,2,1,4);
INSERT INTO menurowcategories VALUES(26,1001,125,2,1,5);
INSERT INTO menurowcategories VALUES(27,1001,126,2,1,6);
INSERT INTO menurowcategories VALUES(28,1001,127,2,1,7);
INSERT INTO menurowcategories VALUES(29,1001,128,2,1,8);
INSERT INTO menurowcategories VALUES(30,1001,129,2,1,9);
INSERT INTO menurowcategories VALUES(31,1001,130,2,1,10);
INSERT INTO menurowcategories VALUES(32,1001,131,2,1,11);
INSERT INTO menurowcategories VALUES(33,1001,132,2,1,12);
INSERT INTO menurowcategories VALUES(34,1001,133,2,1,13);
INSERT INTO menurowcategories VALUES(35,1001,134,2,1,14);
INSERT INTO menurowcategories VALUES(36,1001,135,2,1,15);
INSERT INTO menurowcategories VALUES(37,1001,136,2,1,16);
INSERT INTO menurowcategories VALUES(38,1001,137,2,1,17);
INSERT INTO menurowcategories VALUES(39,1001,138,2,1,18);
INSERT INTO menurowcategories VALUES(40,1001,139,2,1,19);
INSERT INTO menurowcategories VALUES(41,1001,140,2,1,20);
INSERT INTO menurowcategories VALUES(42,1001,141,2,1,21);
INSERT INTO menurowcategories VALUES(43,1001,142,2,1,22);
INSERT INTO menurowcategories VALUES(44,1001,143,2,1,23);
INSERT INTO menurowcategories VALUES(45,1001,144,2,1,24);
INSERT INTO menurowcategories VALUES(46,1001,145,1,1,1);
INSERT INTO menurowcategories VALUES(47,1001,146,1,1,2);
INSERT INTO menurowcategories VALUES(48,1001,147,1,1,3);
INSERT INTO menurowcategories VALUES(49,1001,148,1,1,4);
INSERT INTO menurowcategories VALUES(50,1001,149,1,1,5);
INSERT INTO menurowcategories VALUES(51,1001,150,1,1,6);
INSERT INTO menurowcategories VALUES(52,1001,151,1,1,7);
INSERT INTO menurowcategories VALUES(53,1001,152,1,1,8);
INSERT INTO menurowcategories VALUES(54,1001,153,1,1,9);
INSERT INTO menurowcategories VALUES(55,1001,154,1,1,10);
INSERT INTO menurowcategories VALUES(56,1001,155,1,1,11);
INSERT INTO menurowcategories VALUES(57,1001,156,2,1,25);
INSERT INTO menurowcategories VALUES(58,1001,157,2,1,26);
INSERT INTO menurowcategories VALUES(59,1001,158,2,1,27);
INSERT INTO menurowcategories VALUES(60,1001,159,2,1,28);
INSERT INTO menurowcategories VALUES(61,1001,160,2,1,29);
INSERT INTO menurowcategories VALUES(62,1001,161,7,1,6);
INSERT INTO menurowcategories VALUES(63,1001,162,7,1,7);
INSERT INTO menurowcategories VALUES(64,1001,163,7,1,8);
INSERT INTO menurowcategories VALUES(65,1001,164,7,1,9);
INSERT INTO menurowcategories VALUES(66,1001,165,7,1,10);
INSERT INTO menurowcategories VALUES(67,1001,166,7,1,11);
INSERT INTO menurowcategories VALUES(68,1001,167,7,1,12);
INSERT INTO menurowcategories VALUES(69,1001,168,7,1,13);
INSERT INTO menurowcategories VALUES(70,1001,169,7,1,14);
INSERT INTO menurowcategories VALUES(71,1001,170,7,1,15);
INSERT INTO menurowcategories VALUES(72,1001,171,7,1,16);
INSERT INTO menurowcategories VALUES(73,1001,172,7,1,17);
INSERT INTO menurowcategories VALUES(74,1001,173,22,1,1);
INSERT INTO menurowcategories VALUES(75,1001,174,22,1,2);
INSERT INTO menurowcategories VALUES(76,1001,175,22,1,3);
INSERT INTO menurowcategories VALUES(77,1001,176,22,1,4);
INSERT INTO menurowcategories VALUES(78,1001,177,22,1,5);
INSERT INTO menurowcategories VALUES(79,1001,178,22,1,6);
INSERT INTO menurowcategories VALUES(80,1001,179,22,1,7);
INSERT INTO menurowcategories VALUES(81,1001,180,22,1,8);
INSERT INTO menurowcategories VALUES(82,1001,181,8,1,1);
INSERT INTO menurowcategories VALUES(83,1001,182,8,1,2);
INSERT INTO menurowcategories VALUES(84,1001,183,8,1,3);
INSERT INTO menurowcategories VALUES(85,1001,184,8,1,4);
INSERT INTO menurowcategories VALUES(86,1001,185,8,1,5);
INSERT INTO menurowcategories VALUES(87,1001,186,8,1,6);
INSERT INTO menurowcategories VALUES(88,1001,187,8,1,7);
INSERT INTO menurowcategories VALUES(89,1001,188,8,1,8);
INSERT INTO menurowcategories VALUES(90,1001,189,8,1,9);
INSERT INTO menurowcategories VALUES(91,1001,190,8,1,10);
INSERT INTO menurowcategories VALUES(92,1001,191,8,1,11);
INSERT INTO menurowcategories VALUES(93,1001,192,8,1,12);
INSERT INTO menurowcategories VALUES(94,1001,193,8,1,13);
INSERT INTO menurowcategories VALUES(95,1001,194,8,1,14);
INSERT INTO menurowcategories VALUES(96,1001,195,8,1,15);
INSERT INTO menurowcategories VALUES(97,1001,196,8,1,16);
INSERT INTO menurowcategories VALUES(98,1001,197,8,1,17);
INSERT INTO menurowcategories VALUES(99,1001,198,8,1,18);
INSERT INTO menurowcategories VALUES(100,1001,199,8,1,19);
INSERT INTO menurowcategories VALUES(101,1001,200,8,1,20);
INSERT INTO menurowcategories VALUES(102,1001,201,23,1,1);
INSERT INTO menurowcategories VALUES(103,1001,202,23,1,2);
INSERT INTO menurowcategories VALUES(104,1001,203,23,1,3);
INSERT INTO menurowcategories VALUES(105,1001,204,23,1,4);
INSERT INTO menurowcategories VALUES(106,1001,205,23,1,5);
INSERT INTO menurowcategories VALUES(107,1001,206,23,1,6);
INSERT INTO menurowcategories VALUES(108,1001,207,9,1,1);
INSERT INTO menurowcategories VALUES(109,1001,208,9,1,2);
INSERT INTO menurowcategories VALUES(110,1001,209,9,1,3);
INSERT INTO menurowcategories VALUES(111,1001,210,9,1,4);
INSERT INTO menurowcategories VALUES(112,1001,211,9,1,5);
INSERT INTO menurowcategories VALUES(113,1001,212,9,1,6);
INSERT INTO menurowcategories VALUES(114,1001,213,9,1,7);
INSERT INTO menurowcategories VALUES(115,1001,214,9,1,8);
INSERT INTO menurowcategories VALUES(116,1001,215,9,1,9);
INSERT INTO menurowcategories VALUES(117,1001,216,9,1,10);
INSERT INTO menurowcategories VALUES(118,1001,217,9,1,11);
INSERT INTO menurowcategories VALUES(119,1001,218,9,1,12);
INSERT INTO menurowcategories VALUES(120,1001,219,9,1,13);
INSERT INTO menurowcategories VALUES(121,1001,220,9,1,14);
INSERT INTO menurowcategories VALUES(122,1001,221,9,1,15);
INSERT INTO menurowcategories VALUES(123,1001,222,9,1,16);
INSERT INTO menurowcategories VALUES(124,1001,223,9,1,17);
INSERT INTO menurowcategories VALUES(125,1001,224,9,1,18);
INSERT INTO menurowcategories VALUES(126,1001,225,9,1,19);
INSERT INTO menurowcategories VALUES(127,1001,226,9,1,20);
INSERT INTO menurowcategories VALUES(128,1001,227,9,1,21);
INSERT INTO menurowcategories VALUES(129,1001,228,9,1,22);
INSERT INTO menurowcategories VALUES(130,1001,229,9,1,23);
INSERT INTO menurowcategories VALUES(131,1001,230,9,1,24);
INSERT INTO menurowcategories VALUES(132,1001,231,9,1,25);
INSERT INTO menurowcategories VALUES(133,1001,232,9,1,26);
INSERT INTO menurowcategories VALUES(134,1001,233,9,1,27);
INSERT INTO menurowcategories VALUES(135,1001,234,9,1,28);
INSERT INTO menurowcategories VALUES(136,1001,235,9,1,29);
INSERT INTO menurowcategories VALUES(137,1001,236,9,1,30);
INSERT INTO menurowcategories VALUES(138,1001,237,9,1,31);
INSERT INTO menurowcategories VALUES(139,1001,238,9,1,32);
INSERT INTO menurowcategories VALUES(140,1001,239,9,1,33);
INSERT INTO menurowcategories VALUES(141,1001,240,9,1,34);
INSERT INTO menurowcategories VALUES(142,1001,241,9,1,35);
INSERT INTO menurowcategories VALUES(143,1001,242,9,1,36);
INSERT INTO menurowcategories VALUES(144,1001,243,9,1,37);
INSERT INTO menurowcategories VALUES(145,1001,244,9,1,38);
INSERT INTO menurowcategories VALUES(146,1001,245,9,1,39);
INSERT INTO menurowcategories VALUES(147,1001,246,9,1,40);
INSERT INTO menurowcategories VALUES(148,1001,247,9,1,41);
INSERT INTO menurowcategories VALUES(149,1001,248,9,1,42);
INSERT INTO menurowcategories VALUES(150,1001,249,9,1,43);
INSERT INTO menurowcategories VALUES(151,1001,250,9,1,44);
INSERT INTO menurowcategories VALUES(152,1001,251,9,1,45);
INSERT INTO menurowcategories VALUES(153,1001,252,9,1,46);
INSERT INTO menurowcategories VALUES(154,1001,253,9,1,47);
INSERT INTO menurowcategories VALUES(155,1001,254,9,1,48);
INSERT INTO menurowcategories VALUES(156,1001,255,9,1,49);
INSERT INTO menurowcategories VALUES(157,1001,256,9,1,50);
INSERT INTO menurowcategories VALUES(158,1001,257,9,1,51);
INSERT INTO menurowcategories VALUES(159,1001,258,9,1,52);
INSERT INTO menurowcategories VALUES(160,1001,259,9,1,53);
INSERT INTO menurowcategories VALUES(161,1001,260,9,1,54);
INSERT INTO menurowcategories VALUES(162,1001,261,9,1,55);
INSERT INTO menurowcategories VALUES(163,1001,262,9,1,56);
INSERT INTO menurowcategories VALUES(164,1001,263,9,1,57);
INSERT INTO menurowcategories VALUES(165,1001,264,9,1,58);
INSERT INTO menurowcategories VALUES(166,1001,265,9,1,59);
INSERT INTO menurowcategories VALUES(167,1001,266,9,1,60);
INSERT INTO menurowcategories VALUES(168,1001,267,9,1,61);
INSERT INTO menurowcategories VALUES(169,1001,268,9,1,62);
INSERT INTO menurowcategories VALUES(170,1001,269,9,1,63);
INSERT INTO menurowcategories VALUES(171,1001,270,9,1,64);
INSERT INTO menurowcategories VALUES(172,1001,271,9,1,65);
INSERT INTO menurowcategories VALUES(173,1001,272,14,1,1);
INSERT INTO menurowcategories VALUES(174,1001,273,14,1,2);
INSERT INTO menurowcategories VALUES(175,1001,274,14,1,3);
INSERT INTO menurowcategories VALUES(176,1001,275,14,1,4);
INSERT INTO menurowcategories VALUES(177,1001,276,14,1,5);
INSERT INTO menurowcategories VALUES(178,1001,277,15,1,1);
INSERT INTO menurowcategories VALUES(179,1001,278,15,1,2);
INSERT INTO menurowcategories VALUES(180,1001,279,15,1,3);
INSERT INTO menurowcategories VALUES(181,1001,280,15,1,4);
INSERT INTO menurowcategories VALUES(182,1001,281,15,1,5);
INSERT INTO menurowcategories VALUES(183,1001,282,15,1,6);
INSERT INTO menurowcategories VALUES(184,1001,283,15,1,7);
INSERT INTO menurowcategories VALUES(185,1001,284,15,1,8);
INSERT INTO menurowcategories VALUES(186,1001,285,15,1,9);
INSERT INTO menurowcategories VALUES(187,1001,286,15,1,10);
INSERT INTO menurowcategories VALUES(188,1001,287,15,1,11);
INSERT INTO menurowcategories VALUES(189,1001,288,15,1,12);
INSERT INTO menurowcategories VALUES(190,1001,289,14,1,6);
INSERT INTO menurowcategories VALUES(191,1001,290,14,1,7);
INSERT INTO menurowcategories VALUES(192,1001,291,15,1,13);
INSERT INTO menurowcategories VALUES(193,1001,292,15,1,14);
INSERT INTO menurowcategories VALUES(194,1001,293,14,1,8);
INSERT INTO menurowcategories VALUES(195,1001,294,24,1,1);
INSERT INTO menurowcategories VALUES(196,1001,295,24,1,2);
INSERT INTO menurowcategories VALUES(197,1001,296,24,1,3);
INSERT INTO menurowcategories VALUES(198,1001,297,24,1,4);
INSERT INTO menurowcategories VALUES(199,1001,298,24,1,5);
INSERT INTO menurowcategories VALUES(200,1001,299,24,1,6);
INSERT INTO menurowcategories VALUES(201,1001,300,24,1,7);
INSERT INTO menurowcategories VALUES(202,1001,1,25,1,1);
INSERT INTO menurowcategories VALUES(203,1001,2,25,1,2);
INSERT INTO menurowcategories VALUES(204,1001,3,25,1,3);
INSERT INTO menurowcategories VALUES(205,1001,4,25,1,4);
INSERT INTO menurowcategories VALUES(206,1001,5,25,1,5);
INSERT INTO menurowcategories VALUES(207,1001,6,25,1,6);
INSERT INTO menurowcategories VALUES(208,1001,7,25,1,7);
INSERT INTO menurowcategories VALUES(209,1001,8,25,1,8);
INSERT INTO menurowcategories VALUES(210,1001,9,25,1,9);
INSERT INTO menurowcategories VALUES(211,1001,10,25,1,1);
INSERT INTO menurowcategories VALUES(212,1001,11,26,1,2);
INSERT INTO menurowcategories VALUES(213,1001,12,25,1,3);
INSERT INTO menurowcategories VALUES(214,1001,13,25,1,4);
INSERT INTO menurowcategories VALUES(215,1001,14,27,1,1);
INSERT INTO menurowcategories VALUES(216,1001,15,27,1,2);
INSERT INTO menurowcategories VALUES(217,1001,16,27,1,3);
INSERT INTO menurowcategories VALUES(218,1001,17,27,1,4);
INSERT INTO menurowcategories VALUES(219,1001,18,27,1,5);
INSERT INTO menurowcategories VALUES(220,1001,19,27,1,6);
INSERT INTO menurowcategories VALUES(221,1001,20,27,1,7);
INSERT INTO menurowcategories VALUES(222,1001,21,27,1,8);
INSERT INTO menurowcategories VALUES(223,1001,22,27,1,9);
INSERT INTO menurowcategories VALUES(224,1001,23,27,1,10);
INSERT INTO menurowcategories VALUES(225,1001,24,27,1,11);
INSERT INTO menurowcategories VALUES(226,1001,25,27,1,12);
INSERT INTO menurowcategories VALUES(227,1001,26,27,1,13);
INSERT INTO menurowcategories VALUES(228,1001,27,27,1,14);
INSERT INTO menurowcategories VALUES(229,1001,28,27,1,15);
INSERT INTO menurowcategories VALUES(230,1001,29,28,1,1);
INSERT INTO menurowcategories VALUES(231,1001,30,28,1,2);
INSERT INTO menurowcategories VALUES(232,1001,31,27,1,3);
INSERT INTO menurowcategories VALUES(233,1001,32,29,1,1);
INSERT INTO menurowcategories VALUES(234,1001,33,29,1,2);
INSERT INTO menurowcategories VALUES(235,1001,34,29,1,3);
INSERT INTO menurowcategories VALUES(236,1001,36,30,1,1);
INSERT INTO menurowcategories VALUES(237,1001,37,30,1,2);
INSERT INTO menurowcategories VALUES(238,1001,38,30,1,3);
INSERT INTO menurowcategories VALUES(239,1001,39,30,1,4);
INSERT INTO menurowcategories VALUES(240,1001,40,30,1,5);
INSERT INTO menurowcategories VALUES(241,1001,41,30,1,6);
INSERT INTO menurowcategories VALUES(242,1001,42,30,1,7);
INSERT INTO menurowcategories VALUES(243,1001,43,31,1,1);
INSERT INTO menurowcategories VALUES(244,1001,44,31,1,2);
INSERT INTO menurowcategories VALUES(245,1001,45,31,1,3);
INSERT INTO menurowcategories VALUES(246,1001,46,31,1,4);
INSERT INTO menurowcategories VALUES(247,1001,47,31,1,5);
INSERT INTO menurowcategories VALUES(248,1001,48,31,1,6);
INSERT INTO menurowcategories VALUES(249,1001,49,31,1,7);
INSERT INTO menurowcategories VALUES(250,1001,50,31,1,8);
INSERT INTO menurowcategories VALUES(251,1001,51,31,1,9);
INSERT INTO menurowcategories VALUES(252,1001,52,33,1,1);
INSERT INTO menurowcategories VALUES(253,1001,53,33,1,2);
INSERT INTO menurowcategories VALUES(254,1001,54,33,1,3);
INSERT INTO menurowcategories VALUES(255,1001,55,33,1,4);
INSERT INTO menurowcategories VALUES(256,1001,57,33,1,5);
INSERT INTO menurowcategories VALUES(257,1001,58,33,1,6);
INSERT INTO menurowcategories VALUES(258,1001,59,33,1,7);
INSERT INTO menurowcategories VALUES(259,1001,60,33,1,8);
INSERT INTO menurowcategories VALUES(260,1001,61,33,1,9);
INSERT INTO menurowcategories VALUES(261,1001,62,33,1,10);
INSERT INTO menurowcategories VALUES(262,1001,63,33,1,11);
INSERT INTO menurowcategories VALUES(263,1001,64,34,1,1);
INSERT INTO menurowcategories VALUES(266,1001,67,34,1,10);
INSERT INTO menurowcategories VALUES(267,1001,68,34,1,5);
INSERT INTO menurowcategories VALUES(268,1001,69,35,1,1);
INSERT INTO menurowcategories VALUES(269,1001,70,35,1,2);
INSERT INTO menurowcategories VALUES(273,1001,74,35,1,7);
INSERT INTO menurowcategories VALUES(274,1001,75,35,1,8);
INSERT INTO menurowcategories VALUES(275,1001,76,35,1,9);
INSERT INTO menurowcategories VALUES(276,1001,77,35,1,10);
INSERT INTO menurowcategories VALUES(277,1001,78,35,1,11);
INSERT INTO menurowcategories VALUES(278,1001,79,35,1,12);
INSERT INTO menurowcategories VALUES(279,1001,80,35,1,13);
INSERT INTO menurowcategories VALUES(280,1001,81,35,1,14);
INSERT INTO menurowcategories VALUES(281,1001,82,35,1,15);
INSERT INTO menurowcategories VALUES(282,1001,83,35,1,16);
INSERT INTO menurowcategories VALUES(283,1001,84,35,1,17);
INSERT INTO menurowcategories VALUES(284,1001,85,34,1,6);
INSERT INTO menurowcategories VALUES(285,1001,86,34,1,7);
INSERT INTO menurowcategories VALUES(300,1001,1,108,1,1);
INSERT INTO menurowcategories VALUES(301,1001,2,108,1,2);
INSERT INTO menurowcategories VALUES(302,1001,3,108,1,3);
INSERT INTO menurowcategories VALUES(303,1001,4,108,1,4);
INSERT INTO menurowcategories VALUES(304,1001,5,108,1,5);
INSERT INTO menurowcategories VALUES(305,1001,6,108,1,6);
INSERT INTO menurowcategories VALUES(306,1001,7,108,1,7);
INSERT INTO menurowcategories VALUES(307,1001,8,108,1,8);
INSERT INTO menurowcategories VALUES(308,1001,9,108,1,9);
INSERT INTO menurowcategories VALUES(309,1001,10,109,1,1);
INSERT INTO menurowcategories VALUES(310,1001,11,109,1,2);
INSERT INTO menurowcategories VALUES(311,1001,12,109,1,3);
INSERT INTO menurowcategories VALUES(312,1001,13,109,1,4);
INSERT INTO menurowcategories VALUES(313,1001,14,110,1,1);
INSERT INTO menurowcategories VALUES(314,1001,15,110,1,2);
INSERT INTO menurowcategories VALUES(315,1001,16,110,1,3);
INSERT INTO menurowcategories VALUES(316,1001,17,110,1,4);
INSERT INTO menurowcategories VALUES(317,1001,18,110,1,5);
INSERT INTO menurowcategories VALUES(318,1001,19,110,1,6);
INSERT INTO menurowcategories VALUES(319,1001,20,110,1,7);
INSERT INTO menurowcategories VALUES(320,1001,21,110,1,8);
INSERT INTO menurowcategories VALUES(321,1001,22,110,1,9);
INSERT INTO menurowcategories VALUES(322,1001,23,110,1,10);
INSERT INTO menurowcategories VALUES(323,1001,24,110,1,11);
INSERT INTO menurowcategories VALUES(324,1001,25,110,1,12);
INSERT INTO menurowcategories VALUES(325,1001,26,110,1,13);
INSERT INTO menurowcategories VALUES(326,1001,27,110,1,14);
INSERT INTO menurowcategories VALUES(327,1001,28,110,1,15);
INSERT INTO menurowcategories VALUES(328,1001,29,111,1,1);
INSERT INTO menurowcategories VALUES(329,1001,30,111,1,2);
INSERT INTO menurowcategories VALUES(330,1001,31,111,1,3);
INSERT INTO menurowcategories VALUES(331,1001,32,112,1,1);
INSERT INTO menurowcategories VALUES(332,1001,33,112,1,2);
INSERT INTO menurowcategories VALUES(333,1001,34,112,1,3);
INSERT INTO menurowcategories VALUES(334,1001,36,113,1,1);
INSERT INTO menurowcategories VALUES(335,1001,37,113,1,2);
INSERT INTO menurowcategories VALUES(336,1001,38,113,1,3);
INSERT INTO menurowcategories VALUES(337,1001,39,113,1,4);
INSERT INTO menurowcategories VALUES(338,1001,40,113,1,5);
INSERT INTO menurowcategories VALUES(339,1001,41,113,1,6);
INSERT INTO menurowcategories VALUES(340,1001,42,113,1,7);
INSERT INTO menurowcategories VALUES(341,1001,43,114,1,1);
INSERT INTO menurowcategories VALUES(342,1001,44,114,1,2);
INSERT INTO menurowcategories VALUES(343,1001,45,114,1,3);
INSERT INTO menurowcategories VALUES(344,1001,46,114,1,4);
INSERT INTO menurowcategories VALUES(345,1001,47,114,1,5);
INSERT INTO menurowcategories VALUES(346,1001,48,114,1,6);
INSERT INTO menurowcategories VALUES(347,1001,49,114,1,7);
INSERT INTO menurowcategories VALUES(348,1001,50,114,1,8);
INSERT INTO menurowcategories VALUES(349,1001,51,114,1,9);
INSERT INTO menurowcategories VALUES(350,1001,52,104,1,0);
INSERT INTO menurowcategories VALUES(351,1001,53,103,1,2);
INSERT INTO menurowcategories VALUES(352,1001,54,103,1,3);
INSERT INTO menurowcategories VALUES(353,1001,55,103,1,4);
INSERT INTO menurowcategories VALUES(354,1001,57,103,1,5);
INSERT INTO menurowcategories VALUES(355,1001,58,103,1,6);
INSERT INTO menurowcategories VALUES(356,1001,59,103,1,7);
INSERT INTO menurowcategories VALUES(357,1001,60,103,1,8);
INSERT INTO menurowcategories VALUES(358,1001,61,103,1,9);
INSERT INTO menurowcategories VALUES(359,1001,62,103,1,10);
INSERT INTO menurowcategories VALUES(360,1001,63,103,1,11);
INSERT INTO menurowcategories VALUES(361,1001,64,104,1,1);
INSERT INTO menurowcategories VALUES(364,1001,67,104,1,10);
INSERT INTO menurowcategories VALUES(365,1001,68,104,1,5);
INSERT INTO menurowcategories VALUES(366,1001,69,101,1,1);
INSERT INTO menurowcategories VALUES(367,1001,70,101,1,2);
INSERT INTO menurowcategories VALUES(371,1001,74,101,1,7);
INSERT INTO menurowcategories VALUES(372,1001,75,101,1,8);
INSERT INTO menurowcategories VALUES(373,1001,76,101,1,9);
INSERT INTO menurowcategories VALUES(374,1001,77,101,1,10);
INSERT INTO menurowcategories VALUES(375,1001,78,101,1,11);
INSERT INTO menurowcategories VALUES(376,1001,79,101,1,12);
INSERT INTO menurowcategories VALUES(377,1001,80,101,1,13);
INSERT INTO menurowcategories VALUES(378,1001,81,101,1,14);
INSERT INTO menurowcategories VALUES(379,1001,82,101,1,15);
INSERT INTO menurowcategories VALUES(380,1001,83,101,1,16);
INSERT INTO menurowcategories VALUES(381,1001,84,101,1,17);
INSERT INTO menurowcategories VALUES(382,1001,85,104,1,6);
INSERT INTO menurowcategories VALUES(383,1001,86,104,1,7);
INSERT INTO menurowcategories VALUES(400,1001,272,116,1,1);
INSERT INTO menurowcategories VALUES(401,1001,273,116,1,2);
INSERT INTO menurowcategories VALUES(402,1001,274,116,1,3);
INSERT INTO menurowcategories VALUES(403,1001,275,116,1,4);
INSERT INTO menurowcategories VALUES(404,1001,276,116,1,5);
INSERT INTO menurowcategories VALUES(405,1001,277,117,1,1);
INSERT INTO menurowcategories VALUES(406,1001,278,117,1,2);
INSERT INTO menurowcategories VALUES(407,1001,279,117,1,3);
INSERT INTO menurowcategories VALUES(408,1001,280,117,1,4);
INSERT INTO menurowcategories VALUES(409,1001,281,117,1,5);
INSERT INTO menurowcategories VALUES(410,1001,282,117,1,6);
INSERT INTO menurowcategories VALUES(411,1001,283,117,1,7);
INSERT INTO menurowcategories VALUES(412,1001,284,117,1,8);
INSERT INTO menurowcategories VALUES(413,1001,285,117,1,9);
INSERT INTO menurowcategories VALUES(414,1001,286,117,1,10);
INSERT INTO menurowcategories VALUES(415,1001,287,117,1,11);
INSERT INTO menurowcategories VALUES(416,1001,288,117,1,12);
INSERT INTO menurowcategories VALUES(417,1001,289,116,1,6);
INSERT INTO menurowcategories VALUES(418,1001,290,116,1,7);
INSERT INTO menurowcategories VALUES(419,1001,291,117,1,13);
INSERT INTO menurowcategories VALUES(420,1001,292,117,1,14);
INSERT INTO menurowcategories VALUES(421,1001,293,116,1,8);
INSERT INTO menurowcategories VALUES(422,1001,294,118,1,1);
INSERT INTO menurowcategories VALUES(423,1001,295,118,1,2);
INSERT INTO menurowcategories VALUES(424,1001,296,118,1,3);
INSERT INTO menurowcategories VALUES(425,1001,297,118,1,4);
INSERT INTO menurowcategories VALUES(426,1001,298,118,1,5);
INSERT INTO menurowcategories VALUES(427,1001,299,118,1,6);
INSERT INTO menurowcategories VALUES(428,1001,300,118,1,7);
INSERT INTO menurowcategories VALUES(429,1001,1,122,1,1);
INSERT INTO menurowcategories VALUES(430,1001,2,122,1,2);
INSERT INTO menurowcategories VALUES(431,1001,3,122,1,3);
INSERT INTO menurowcategories VALUES(432,1001,4,122,1,4);
INSERT INTO menurowcategories VALUES(433,1001,5,122,1,5);
INSERT INTO menurowcategories VALUES(434,1001,6,122,1,6);
INSERT INTO menurowcategories VALUES(435,1001,7,122,1,7);
INSERT INTO menurowcategories VALUES(436,1001,8,122,1,8);
INSERT INTO menurowcategories VALUES(437,1001,9,122,1,9);
INSERT INTO menurowcategories VALUES(438,1001,10,123,1,1);
INSERT INTO menurowcategories VALUES(439,1001,11,123,1,2);
INSERT INTO menurowcategories VALUES(440,1001,12,123,1,3);
INSERT INTO menurowcategories VALUES(441,1001,13,123,1,4);
INSERT INTO menurowcategories VALUES(442,1001,14,124,1,1);
INSERT INTO menurowcategories VALUES(443,1001,15,124,1,2);
INSERT INTO menurowcategories VALUES(444,1001,16,124,1,3);
INSERT INTO menurowcategories VALUES(445,1001,17,124,1,4);
INSERT INTO menurowcategories VALUES(446,1001,18,124,1,5);
INSERT INTO menurowcategories VALUES(447,1001,19,124,1,6);
INSERT INTO menurowcategories VALUES(448,1001,20,124,1,7);
INSERT INTO menurowcategories VALUES(449,1001,21,124,1,8);
INSERT INTO menurowcategories VALUES(450,1001,22,124,1,9);
INSERT INTO menurowcategories VALUES(451,1001,23,124,1,10);
INSERT INTO menurowcategories VALUES(452,1001,24,124,1,11);
INSERT INTO menurowcategories VALUES(453,1001,25,124,1,12);
INSERT INTO menurowcategories VALUES(454,1001,26,124,1,13);
INSERT INTO menurowcategories VALUES(455,1001,27,124,1,14);
INSERT INTO menurowcategories VALUES(456,1001,28,124,1,15);
INSERT INTO menurowcategories VALUES(457,1001,29,125,1,1);
INSERT INTO menurowcategories VALUES(458,1001,30,125,1,2);
INSERT INTO menurowcategories VALUES(459,1001,31,125,1,3);
INSERT INTO menurowcategories VALUES(460,1001,32,126,1,1);
INSERT INTO menurowcategories VALUES(461,1001,33,126,1,2);
INSERT INTO menurowcategories VALUES(462,1001,34,126,1,3);
INSERT INTO menurowcategories VALUES(463,1001,36,127,1,1);
INSERT INTO menurowcategories VALUES(464,1001,37,127,1,2);
INSERT INTO menurowcategories VALUES(465,1001,38,127,1,3);
INSERT INTO menurowcategories VALUES(466,1001,39,127,1,4);
INSERT INTO menurowcategories VALUES(467,1001,40,127,1,5);
INSERT INTO menurowcategories VALUES(468,1001,41,127,1,6);
INSERT INTO menurowcategories VALUES(469,1001,42,127,1,7);
INSERT INTO menurowcategories VALUES(470,1001,43,128,1,1);
INSERT INTO menurowcategories VALUES(471,1001,44,128,1,2);
INSERT INTO menurowcategories VALUES(472,1001,45,128,1,3);
INSERT INTO menurowcategories VALUES(473,1001,46,128,1,4);
INSERT INTO menurowcategories VALUES(474,1001,47,128,1,5);
INSERT INTO menurowcategories VALUES(475,1001,48,128,1,6);
INSERT INTO menurowcategories VALUES(476,1001,49,128,1,7);
INSERT INTO menurowcategories VALUES(477,1001,50,128,1,8);
INSERT INTO menurowcategories VALUES(478,1001,51,128,1,9);
INSERT INTO menurowcategories VALUES(479,1001,301,12,1,1);
INSERT INTO menurowcategories VALUES(480,1001,302,12,1,2);
INSERT INTO menurowcategories VALUES(481,1001,303,12,1,3);
INSERT INTO menurowcategories VALUES(482,1001,304,12,1,4);
INSERT INTO menurowcategories VALUES(483,1001,305,12,1,5);
INSERT INTO menurowcategories VALUES(484,1001,306,12,1,6);
INSERT INTO menurowcategories VALUES(485,1001,307,12,1,7);
INSERT INTO menurowcategories VALUES(486,1001,308,12,1,8);
INSERT INTO menurowcategories VALUES(487,1001,309,12,1,9);
INSERT INTO menurowcategories VALUES(488,1001,310,12,1,10);
INSERT INTO menurowcategories VALUES(489,1001,311,12,1,11);
INSERT INTO menurowcategories VALUES(490,1001,312,12,1,12);
INSERT INTO menurowcategories VALUES(491,1001,313,12,1,13);
INSERT INTO menurowcategories VALUES(492,1001,314,12,1,14);
INSERT INTO menurowcategories VALUES(493,1001,315,12,1,15);
INSERT INTO menurowcategories VALUES(494,1001,316,12,1,16);
INSERT INTO menurowcategories VALUES(495,1001,317,12,1,17);
INSERT INTO menurowcategories VALUES(496,1001,318,12,1,18);
INSERT INTO menurowcategories VALUES(497,1001,319,12,1,19);
INSERT INTO menurowcategories VALUES(498,1001,320,12,1,20);
INSERT INTO menurowcategories VALUES(499,1001,321,12,1,21);
INSERT INTO menurowcategories VALUES(500,1001,322,12,1,22);
INSERT INTO menurowcategories VALUES(501,1001,323,12,1,23);
INSERT INTO menurowcategories VALUES(502,1001,324,12,1,24);
INSERT INTO menurowcategories VALUES(503,1001,301,106,1,1);
INSERT INTO menurowcategories VALUES(504,1001,302,106,1,2);
INSERT INTO menurowcategories VALUES(505,1001,303,106,1,3);
INSERT INTO menurowcategories VALUES(527,1001,325,101,1,3);
INSERT INTO menurowcategories VALUES(528,1001,325,35,1,3);
INSERT INTO menurowcategories VALUES(529,1001,326,11,1,1);
INSERT INTO menurowcategories VALUES(530,1001,327,11,1,2);
INSERT INTO menurowcategories VALUES(531,1001,328,11,1,3);
INSERT INTO menurowcategories VALUES(532,1001,329,11,1,4);
INSERT INTO menurowcategories VALUES(533,1001,330,11,1,5);
INSERT INTO menurowcategories VALUES(534,1001,331,11,1,6);
INSERT INTO menurowcategories VALUES(535,1001,332,11,1,7);
INSERT INTO menurowcategories VALUES(536,1001,333,11,1,8);
INSERT INTO menurowcategories VALUES(537,1001,334,11,1,9);
INSERT INTO menurowcategories VALUES(538,1001,335,11,1,10);
INSERT INTO menurowcategories VALUES(539,1001,336,11,1,11);
INSERT INTO menurowcategories VALUES(540,1001,337,11,1,12);
INSERT INTO menurowcategories VALUES(541,1001,338,11,1,13);
INSERT INTO menurowcategories VALUES(542,1001,339,11,1,14);
INSERT INTO menurowcategories VALUES(543,1001,340,11,1,15);
INSERT INTO menurowcategories VALUES(544,1001,341,11,1,16);
INSERT INTO menurowcategories VALUES(545,1001,342,11,1,17);
INSERT INTO menurowcategories VALUES(546,1001,343,11,1,18);
INSERT INTO menurowcategories VALUES(547,1001,344,11,1,19);
INSERT INTO menurowcategories VALUES(548,1001,345,11,1,20);
INSERT INTO menurowcategories VALUES(549,1001,346,11,1,21);
INSERT INTO menurowcategories VALUES(550,1001,347,11,1,22);
INSERT INTO menurowcategories VALUES(551,1001,348,11,1,23);
INSERT INTO menurowcategories VALUES(552,1001,349,11,1,24);
INSERT INTO menurowcategories VALUES(553,1001,350,11,1,25);
INSERT INTO menurowcategories VALUES(554,1001,351,11,1,26);
INSERT INTO menurowcategories VALUES(555,1001,352,11,1,27);
INSERT INTO menurowcategories VALUES(556,1001,353,11,1,28);
INSERT INTO menurowcategories VALUES(557,1001,354,11,1,29);
INSERT INTO menurowcategories VALUES(558,1001,355,11,1,30);
INSERT INTO menurowcategories VALUES(559,1001,356,11,1,31);
INSERT INTO menurowcategories VALUES(560,1001,357,11,1,32);
INSERT INTO menurowcategories VALUES(561,1001,358,11,1,33);
INSERT INTO menurowcategories VALUES(562,1001,359,11,1,34);
INSERT INTO menurowcategories VALUES(563,1001,360,11,1,35);
INSERT INTO menurowcategories VALUES(564,1001,361,11,1,36);
INSERT INTO menurowcategories VALUES(565,1001,362,11,1,37);
INSERT INTO menurowcategories VALUES(566,1001,363,11,1,38);
INSERT INTO menurowcategories VALUES(567,1001,364,11,1,39);
INSERT INTO menurowcategories VALUES(568,1001,365,11,1,40);
INSERT INTO menurowcategories VALUES(569,1001,366,11,1,41);
INSERT INTO menurowcategories VALUES(570,1001,367,11,1,42);
INSERT INTO menurowcategories VALUES(571,1001,368,11,1,43);
INSERT INTO menurowcategories VALUES(572,1001,369,11,1,44);
INSERT INTO menurowcategories VALUES(573,1001,370,11,1,45);
INSERT INTO menurowcategories VALUES(574,1001,371,11,1,46);
INSERT INTO menurowcategories VALUES(575,1001,372,11,1,47);
INSERT INTO menurowcategories VALUES(576,1001,373,11,1,48);
INSERT INTO menurowcategories VALUES(577,1001,374,11,1,49);
INSERT INTO menurowcategories VALUES(578,1001,375,11,1,50);
INSERT INTO menurowcategories VALUES(579,1001,376,11,1,51);
INSERT INTO menurowcategories VALUES(580,1001,377,11,1,52);
INSERT INTO menurowcategories VALUES(581,1001,378,11,1,53);
INSERT INTO menurowcategories VALUES(582,1001,379,11,1,54);
INSERT INTO menurowcategories VALUES(583,1001,380,11,1,55);
INSERT INTO menurowcategories VALUES(584,1001,381,11,1,56);
INSERT INTO menurowcategories VALUES(585,1001,382,11,1,57);
INSERT INTO menurowcategories VALUES(586,1001,383,11,1,58);
INSERT INTO menurowcategories VALUES(587,1001,384,11,1,59);
INSERT INTO menurowcategories VALUES(588,1001,385,11,1,60);
INSERT INTO menurowcategories VALUES(589,1001,386,11,1,61);
INSERT INTO menurowcategories VALUES(590,1001,387,11,1,62);
INSERT INTO menurowcategories VALUES(591,1001,388,11,1,63);
INSERT INTO menurowcategories VALUES(592,1001,389,11,1,64);
INSERT INTO menurowcategories VALUES(593,1001,390,11,1,65);
INSERT INTO menurowcategories VALUES(594,1001,391,11,1,66);
INSERT INTO menurowcategories VALUES(595,1001,326,105,1,1);
INSERT INTO menurowcategories VALUES(596,1001,327,105,1,2);
INSERT INTO menurowcategories VALUES(597,1001,328,105,1,3);
INSERT INTO menurowcategories VALUES(598,1001,329,105,1,4);
INSERT INTO menurowcategories VALUES(599,1001,330,105,1,5);
INSERT INTO menurowcategories VALUES(600,1001,331,105,1,6);
INSERT INTO menurowcategories VALUES(601,1001,332,105,1,7);
INSERT INTO menurowcategories VALUES(602,1001,333,105,1,8);
INSERT INTO menurowcategories VALUES(603,1001,334,105,1,9);
INSERT INTO menurowcategories VALUES(604,1001,335,105,1,10);
INSERT INTO menurowcategories VALUES(605,1001,336,105,1,11);
INSERT INTO menurowcategories VALUES(606,1001,337,105,1,12);
INSERT INTO menurowcategories VALUES(607,1001,338,105,1,13);
INSERT INTO menurowcategories VALUES(608,1001,339,105,1,14);
INSERT INTO menurowcategories VALUES(609,1001,340,105,1,15);
INSERT INTO menurowcategories VALUES(610,1001,341,105,1,16);
INSERT INTO menurowcategories VALUES(611,1001,342,105,1,17);
INSERT INTO menurowcategories VALUES(612,1001,343,105,1,18);
INSERT INTO menurowcategories VALUES(613,1001,344,105,1,19);
INSERT INTO menurowcategories VALUES(614,1001,345,105,1,20);
INSERT INTO menurowcategories VALUES(615,1001,346,105,1,21);
INSERT INTO menurowcategories VALUES(616,1001,347,105,1,22);
INSERT INTO menurowcategories VALUES(617,1001,348,105,1,23);
INSERT INTO menurowcategories VALUES(618,1001,349,105,1,24);
INSERT INTO menurowcategories VALUES(619,1001,350,105,1,25);
INSERT INTO menurowcategories VALUES(620,1001,351,105,1,26);
INSERT INTO menurowcategories VALUES(621,1001,352,105,1,27);
INSERT INTO menurowcategories VALUES(622,1001,353,105,1,28);
INSERT INTO menurowcategories VALUES(623,1001,354,105,1,29);
INSERT INTO menurowcategories VALUES(624,1001,355,105,1,30);
INSERT INTO menurowcategories VALUES(625,1001,356,105,1,31);
INSERT INTO menurowcategories VALUES(626,1001,357,105,1,32);
INSERT INTO menurowcategories VALUES(627,1001,358,105,1,33);
INSERT INTO menurowcategories VALUES(628,1001,359,105,1,34);
INSERT INTO menurowcategories VALUES(629,1001,360,105,1,35);
INSERT INTO menurowcategories VALUES(630,1001,361,105,1,36);
INSERT INTO menurowcategories VALUES(631,1001,362,105,1,37);
INSERT INTO menurowcategories VALUES(632,1001,363,105,1,38);
INSERT INTO menurowcategories VALUES(633,1001,364,105,1,39);
INSERT INTO menurowcategories VALUES(634,1001,365,105,1,40);
INSERT INTO menurowcategories VALUES(635,1001,366,105,1,41);
INSERT INTO menurowcategories VALUES(636,1001,367,105,1,42);
INSERT INTO menurowcategories VALUES(637,1001,368,105,1,43);
INSERT INTO menurowcategories VALUES(638,1001,369,105,1,44);
INSERT INTO menurowcategories VALUES(639,1001,370,105,1,45);
INSERT INTO menurowcategories VALUES(640,1001,371,105,1,46);
INSERT INTO menurowcategories VALUES(641,1001,372,105,1,47);
INSERT INTO menurowcategories VALUES(642,1001,373,105,1,48);
INSERT INTO menurowcategories VALUES(643,1001,374,105,1,49);
INSERT INTO menurowcategories VALUES(644,1001,375,105,1,50);
INSERT INTO menurowcategories VALUES(645,1001,376,105,1,51);
INSERT INTO menurowcategories VALUES(646,1001,377,105,1,52);
INSERT INTO menurowcategories VALUES(647,1001,378,105,1,53);
INSERT INTO menurowcategories VALUES(648,1001,379,105,1,54);
INSERT INTO menurowcategories VALUES(649,1001,380,105,1,55);
INSERT INTO menurowcategories VALUES(650,1001,381,105,1,56);
INSERT INTO menurowcategories VALUES(651,1001,382,105,1,57);
INSERT INTO menurowcategories VALUES(652,1001,383,105,1,58);
INSERT INTO menurowcategories VALUES(653,1001,384,105,1,59);
INSERT INTO menurowcategories VALUES(654,1001,385,105,1,60);
INSERT INTO menurowcategories VALUES(655,1001,386,105,1,61);
INSERT INTO menurowcategories VALUES(656,1001,387,105,1,62);
INSERT INTO menurowcategories VALUES(657,1001,388,105,1,63);
INSERT INTO menurowcategories VALUES(658,1001,389,105,1,64);
INSERT INTO menurowcategories VALUES(659,1001,390,105,1,65);
INSERT INTO menurowcategories VALUES(660,1001,391,105,1,66);
INSERT INTO menurowcategories VALUES(661,1001,393,105,1,67);
INSERT INTO menurowcategories VALUES(662,1001,272,129,1,1);
INSERT INTO menurowcategories VALUES(663,1001,273,129,1,2);
INSERT INTO menurowcategories VALUES(664,1001,274,129,1,3);
INSERT INTO menurowcategories VALUES(665,1001,275,129,1,4);
INSERT INTO menurowcategories VALUES(666,1001,276,129,1,5);
INSERT INTO menurowcategories VALUES(667,1001,289,129,1,6);
INSERT INTO menurowcategories VALUES(668,1001,290,129,1,7);
INSERT INTO menurowcategories VALUES(669,1001,293,129,1,8);
INSERT INTO menurowcategories VALUES(670,1001,69,131,1,1);
INSERT INTO menurowcategories VALUES(671,1001,70,131,1,2);
INSERT INTO menurowcategories VALUES(675,1001,74,131,1,7);
INSERT INTO menurowcategories VALUES(676,1001,75,131,1,8);
INSERT INTO menurowcategories VALUES(677,1001,76,131,1,9);
INSERT INTO menurowcategories VALUES(678,1001,77,131,1,10);
INSERT INTO menurowcategories VALUES(679,1001,78,131,1,11);
INSERT INTO menurowcategories VALUES(680,1001,79,131,1,12);
INSERT INTO menurowcategories VALUES(681,1001,80,131,1,13);
INSERT INTO menurowcategories VALUES(682,1001,81,131,1,14);
INSERT INTO menurowcategories VALUES(683,1001,82,131,1,15);
INSERT INTO menurowcategories VALUES(684,1001,83,131,1,16);
INSERT INTO menurowcategories VALUES(685,1001,84,131,1,17);
INSERT INTO menurowcategories VALUES(686,1001,325,131,1,3);
INSERT INTO menurowcategories VALUES(687,1001,53,133,1,2);
INSERT INTO menurowcategories VALUES(688,1001,54,133,1,3);
INSERT INTO menurowcategories VALUES(689,1001,55,133,1,4);
INSERT INTO menurowcategories VALUES(690,1001,57,133,1,5);
INSERT INTO menurowcategories VALUES(691,1001,58,133,1,6);
INSERT INTO menurowcategories VALUES(692,1001,59,133,1,7);
INSERT INTO menurowcategories VALUES(693,1001,60,133,1,8);
INSERT INTO menurowcategories VALUES(694,1001,61,133,1,9);
INSERT INTO menurowcategories VALUES(695,1001,62,133,1,10);
INSERT INTO menurowcategories VALUES(696,1001,63,133,1,11);
INSERT INTO menurowcategories VALUES(697,1001,52,134,1,0);
INSERT INTO menurowcategories VALUES(698,1001,64,134,1,1);
INSERT INTO menurowcategories VALUES(701,1001,67,134,1,10);
INSERT INTO menurowcategories VALUES(702,1001,68,134,1,5);
INSERT INTO menurowcategories VALUES(703,1001,85,134,1,6);
INSERT INTO menurowcategories VALUES(704,1001,86,134,1,7);
INSERT INTO menurowcategories VALUES(705,1001,207,135,1,1);
INSERT INTO menurowcategories VALUES(706,1001,208,135,1,2);
INSERT INTO menurowcategories VALUES(707,1001,209,135,1,3);
INSERT INTO menurowcategories VALUES(708,1001,210,135,1,4);
INSERT INTO menurowcategories VALUES(709,1001,211,135,1,5);
INSERT INTO menurowcategories VALUES(710,1001,212,135,1,6);
INSERT INTO menurowcategories VALUES(711,1001,213,135,1,7);
INSERT INTO menurowcategories VALUES(712,1001,214,135,1,8);
INSERT INTO menurowcategories VALUES(713,1001,215,135,1,9);
INSERT INTO menurowcategories VALUES(714,1001,216,135,1,10);
INSERT INTO menurowcategories VALUES(715,1001,217,135,1,11);
INSERT INTO menurowcategories VALUES(716,1001,218,135,1,12);
INSERT INTO menurowcategories VALUES(717,1001,219,135,1,13);
INSERT INTO menurowcategories VALUES(718,1001,220,135,1,14);
INSERT INTO menurowcategories VALUES(719,1001,221,135,1,15);
INSERT INTO menurowcategories VALUES(720,1001,222,135,1,16);
INSERT INTO menurowcategories VALUES(721,1001,223,135,1,17);
INSERT INTO menurowcategories VALUES(722,1001,224,135,1,18);
INSERT INTO menurowcategories VALUES(723,1001,225,135,1,19);
INSERT INTO menurowcategories VALUES(724,1001,226,135,1,20);
INSERT INTO menurowcategories VALUES(725,1001,227,135,1,21);
INSERT INTO menurowcategories VALUES(726,1001,228,135,1,22);
INSERT INTO menurowcategories VALUES(727,1001,229,135,1,23);
INSERT INTO menurowcategories VALUES(728,1001,230,135,1,24);
INSERT INTO menurowcategories VALUES(729,1001,231,135,1,25);
INSERT INTO menurowcategories VALUES(730,1001,232,135,1,26);
INSERT INTO menurowcategories VALUES(731,1001,233,135,1,27);
INSERT INTO menurowcategories VALUES(732,1001,234,135,1,28);
INSERT INTO menurowcategories VALUES(733,1001,235,135,1,29);
INSERT INTO menurowcategories VALUES(734,1001,236,135,1,30);
INSERT INTO menurowcategories VALUES(735,1001,237,135,1,31);
INSERT INTO menurowcategories VALUES(736,1001,238,135,1,32);
INSERT INTO menurowcategories VALUES(737,1001,239,135,1,33);
INSERT INTO menurowcategories VALUES(738,1001,240,135,1,34);
INSERT INTO menurowcategories VALUES(739,1001,241,135,1,35);
INSERT INTO menurowcategories VALUES(740,1001,242,135,1,36);
INSERT INTO menurowcategories VALUES(741,1001,243,135,1,37);
INSERT INTO menurowcategories VALUES(742,1001,244,135,1,38);
INSERT INTO menurowcategories VALUES(743,1001,245,135,1,39);
INSERT INTO menurowcategories VALUES(744,1001,246,135,1,40);
INSERT INTO menurowcategories VALUES(745,1001,247,135,1,41);
INSERT INTO menurowcategories VALUES(746,1001,248,135,1,42);
INSERT INTO menurowcategories VALUES(747,1001,249,135,1,43);
INSERT INTO menurowcategories VALUES(748,1001,250,135,1,44);
INSERT INTO menurowcategories VALUES(749,1001,251,135,1,45);
INSERT INTO menurowcategories VALUES(750,1001,252,135,1,46);
INSERT INTO menurowcategories VALUES(751,1001,253,135,1,47);
INSERT INTO menurowcategories VALUES(752,1001,254,135,1,48);
INSERT INTO menurowcategories VALUES(753,1001,255,135,1,49);
INSERT INTO menurowcategories VALUES(754,1001,256,135,1,50);
INSERT INTO menurowcategories VALUES(755,1001,257,135,1,51);
INSERT INTO menurowcategories VALUES(756,1001,258,135,1,52);
INSERT INTO menurowcategories VALUES(757,1001,259,135,1,53);
INSERT INTO menurowcategories VALUES(758,1001,260,135,1,54);
INSERT INTO menurowcategories VALUES(759,1001,261,135,1,55);
INSERT INTO menurowcategories VALUES(760,1001,262,135,1,56);
INSERT INTO menurowcategories VALUES(761,1001,263,135,1,57);
INSERT INTO menurowcategories VALUES(762,1001,264,135,1,58);
INSERT INTO menurowcategories VALUES(763,1001,265,135,1,59);
INSERT INTO menurowcategories VALUES(764,1001,266,135,1,60);
INSERT INTO menurowcategories VALUES(765,1001,267,135,1,61);
INSERT INTO menurowcategories VALUES(766,1001,268,135,1,62);
INSERT INTO menurowcategories VALUES(767,1001,269,135,1,63);
INSERT INTO menurowcategories VALUES(768,1001,270,135,1,64);
INSERT INTO menurowcategories VALUES(769,1001,271,135,1,65);
INSERT INTO menurowcategories VALUES(770,1001,71,136,1,1);
INSERT INTO menurowcategories VALUES(771,1001,71,137,1,1);
INSERT INTO menurowcategories VALUES(772,1001,72,136,1,1);
INSERT INTO menurowcategories VALUES(773,1001,72,137,1,1);
INSERT INTO menurowcategories VALUES(774,1001,73,136,1,1);
INSERT INTO menurowcategories VALUES(775,1001,73,137,1,1);
INSERT INTO menurowcategories VALUES(777,1001,65,139,1,1);
INSERT INTO menurowcategories VALUES(778,1001,65,140,1,1);
INSERT INTO menurowcategories VALUES(779,1001,66,139,1,1);
INSERT INTO menurowcategories VALUES(780,1001,66,140,1,1);
INSERT INTO menurowcategories VALUES(781,1001,151,141,1,2);
INSERT INTO menurowcategories VALUES(782,1001,6,141,1,1);
INSERT INTO menurowcategories VALUES(783,1001,400,139,1,1);
INSERT INTO menurowcategories VALUES(784,1001,400,140,1,1);
INSERT INTO menurowcategories VALUES(785,1001,401,139,1,1);
INSERT INTO menurowcategories VALUES(786,1001,401,140,1,1);
INSERT INTO menurowcategories VALUES(787,1001,70,100,1,1);
INSERT INTO menurowcategories VALUES(788,1001,129,142,1,1);
INSERT INTO menurowcategories VALUES(789,1001,157,142,1,1);
INSERT INTO menurowcategories VALUES(790,1001,130,142,1,1);
INSERT INTO menurowcategories VALUES(791,1001,196,143,1,1);
INSERT INTO menurowcategories VALUES(792,1001,190,143,1,1);
INSERT INTO menurowcategories VALUES(793,1001,402,100,1,1);
INSERT INTO menurowcategories VALUES(794,1002,404,145,1,1);
INSERT INTO menurowcategories VALUES(795,1002,405,145,1,1);
INSERT INTO menurowcategories VALUES(796,1002,406,145,1,1);
INSERT INTO menurowcategories VALUES(797,1002,407,145,1,1);
INSERT INTO menurowcategories VALUES(798,1002,408,145,1,1);
INSERT INTO menurowcategories VALUES(799,1002,409,145,1,1);
INSERT INTO menurowcategories VALUES(800,1002,410,145,1,1);
INSERT INTO menurowcategories VALUES(801,1002,411,145,1,1);
INSERT INTO menurowcategories VALUES(802,1002,412,145,1,1);
INSERT INTO menurowcategories VALUES(803,1002,413,145,1,1);
INSERT INTO menurowcategories VALUES(804,1002,414,145,1,1);
INSERT INTO menurowcategories VALUES(805,1002,415,145,1,1);
INSERT INTO menurowcategories VALUES(806,1002,416,145,1,1);
INSERT INTO menurowcategories VALUES(807,1002,417,145,1,1);
INSERT INTO menurowcategories VALUES(808,1002,418,145,1,1);
INSERT INTO menurowcategories VALUES(809,1002,419,145,1,1);
INSERT INTO menurowcategories VALUES(810,1002,420,145,1,1);
INSERT INTO menurowcategories VALUES(811,1002,421,145,1,1);
INSERT INTO menurowcategories VALUES(812,1002,422,145,1,1);
INSERT INTO menurowcategories VALUES(813,1002,423,145,1,1);
INSERT INTO menurowcategories VALUES(814,1002,424,145,1,1);
INSERT INTO menurowcategories VALUES(815,1002,425,145,1,1);
INSERT INTO menurowcategories VALUES(816,1002,426,145,1,1);
INSERT INTO menurowcategories VALUES(817,1002,427,145,1,1);
INSERT INTO menurowcategories VALUES(818,1002,428,145,1,1);
INSERT INTO menurowcategories VALUES(819,1002,429,145,1,1);
INSERT INTO menurowcategories VALUES(820,1002,430,145,1,1);
INSERT INTO menurowcategories VALUES(821,1002,431,145,1,1);
INSERT INTO menurowcategories VALUES(822,1002,432,145,1,1);
INSERT INTO menurowcategories VALUES(823,1002,433,145,1,1);
INSERT INTO menurowcategories VALUES(824,1002,434,145,1,1);
INSERT INTO menurowcategories VALUES(825,1002,435,145,1,1);
INSERT INTO menurowcategories VALUES(826,1002,436,145,1,1);
INSERT INTO menurowcategories VALUES(827,1002,437,145,1,1);
INSERT INTO menurowcategories VALUES(828,1002,438,145,1,1);
INSERT INTO menurowcategories VALUES(829,1002,439,145,1,1);
INSERT INTO menurowcategories VALUES(830,1002,440,145,1,1);
INSERT INTO menurowcategories VALUES(831,1002,441,145,1,1);
INSERT INTO menurowcategories VALUES(832,1002,442,145,1,1);
INSERT INTO menurowcategories VALUES(833,1002,443,145,1,1);
INSERT INTO menurowcategories VALUES(834,1002,444,145,1,1);
INSERT INTO menurowcategories VALUES(835,1002,445,145,1,1);
INSERT INTO menurowcategories VALUES(836,1002,446,145,1,1);
INSERT INTO menurowcategories VALUES(837,1002,447,145,1,1);
INSERT INTO menurowcategories VALUES(838,1002,448,145,1,1);
INSERT INTO menurowcategories VALUES(839,1002,449,145,1,1);
INSERT INTO menurowcategories VALUES(840,1002,450,145,1,1);
INSERT INTO menurowcategories VALUES(841,1002,451,145,1,1);
INSERT INTO menurowcategories VALUES(842,1002,452,145,1,1);
INSERT INTO menurowcategories VALUES(843,1002,453,145,1,1);
INSERT INTO menurowcategories VALUES(844,1002,454,145,1,1);
INSERT INTO menurowcategories VALUES(845,1002,455,145,1,1);
INSERT INTO menurowcategories VALUES(846,1002,456,145,1,1);
INSERT INTO menurowcategories VALUES(847,1002,457,145,1,1);
INSERT INTO menurowcategories VALUES(848,1002,458,145,1,1);
INSERT INTO menurowcategories VALUES(849,1002,459,145,1,1);
INSERT INTO menurowcategories VALUES(850,1002,460,145,1,1);
INSERT INTO menurowcategories VALUES(851,1002,461,145,1,1);
INSERT INTO menurowcategories VALUES(852,1002,462,145,1,1);
INSERT INTO menurowcategories VALUES(853,1002,463,145,1,1);
INSERT INTO menurowcategories VALUES(854,1002,464,145,1,1);
INSERT INTO menurowcategories VALUES(855,1002,465,145,1,1);
INSERT INTO menurowcategories VALUES(856,1002,466,145,1,1);
INSERT INTO menurowcategories VALUES(857,1002,467,145,1,1);
INSERT INTO menurowcategories VALUES(858,1002,468,145,1,1);
INSERT INTO menurowcategories VALUES(859,1002,469,146,1,1);
INSERT INTO menurowcategories VALUES(860,1002,470,146,1,1);
INSERT INTO menurowcategories VALUES(861,1002,471,146,1,1);
INSERT INTO menurowcategories VALUES(862,1002,472,146,1,1);
INSERT INTO menurowcategories VALUES(863,1002,473,146,1,1);
INSERT INTO menurowcategories VALUES(864,1002,474,146,1,1);
INSERT INTO menurowcategories VALUES(865,1002,475,146,1,1);
INSERT INTO menurowcategories VALUES(866,1002,476,146,1,1);
INSERT INTO menurowcategories VALUES(867,1002,477,146,1,1);
INSERT INTO menurowcategories VALUES(868,1002,478,146,1,1);
INSERT INTO menurowcategories VALUES(869,1002,479,146,1,1);
INSERT INTO menurowcategories VALUES(870,1002,480,146,1,1);
INSERT INTO menurowcategories VALUES(871,1002,481,146,1,1);
INSERT INTO menurowcategories VALUES(901,1002,511,146,1,1);
INSERT INTO menurowcategories VALUES(902,1002,512,146,1,1);
INSERT INTO menurowcategories VALUES(903,1002,513,146,1,1);
INSERT INTO menurowcategories VALUES(904,1002,514,146,1,1);
INSERT INTO menurowcategories VALUES(905,1002,515,146,1,1);
INSERT INTO menurowcategories VALUES(906,1002,516,146,1,1);
INSERT INTO menurowcategories VALUES(907,1002,517,146,1,1);
INSERT INTO menurowcategories VALUES(908,1002,518,146,1,1);
INSERT INTO menurowcategories VALUES(909,1002,519,146,1,1);
INSERT INTO menurowcategories VALUES(910,1002,520,146,1,1);
INSERT INTO menurowcategories VALUES(911,1002,521,146,1,1);
INSERT INTO menurowcategories VALUES(912,1002,522,146,1,1);
INSERT INTO menurowcategories VALUES(913,1002,523,146,1,1);
INSERT INTO menurowcategories VALUES(914,1002,524,146,1,1);
INSERT INTO menurowcategories VALUES(915,1002,525,146,1,1);
INSERT INTO menurowcategories VALUES(916,1002,526,146,1,1);
INSERT INTO menurowcategories VALUES(917,1002,427,159,1,0);
INSERT INTO menurowcategories VALUES(918,1002,436,159,1,0);
INSERT INTO menurowcategories VALUES(919,1002,459,159,1,0);
INSERT INTO menurowcategories VALUES(920,1002,464,159,1,0);
INSERT INTO menurowcategories VALUES(1000,1011,600,200,1,0);
INSERT INTO menurowcategories VALUES(1001,1011,601,200,1,10);
INSERT INTO menurowcategories VALUES(1002,1011,602,200,1,20);
INSERT INTO menurowcategories VALUES(1003,1011,603,200,1,30);
INSERT INTO menurowcategories VALUES(1004,1011,604,200,1,40);
INSERT INTO menurowcategories VALUES(1005,1011,605,200,1,50);
INSERT INTO menurowcategories VALUES(1006,1011,606,200,1,60);
INSERT INTO menurowcategories VALUES(1007,1011,607,200,1,70);
INSERT INTO menurowcategories VALUES(1008,1011,608,200,1,80);
INSERT INTO menurowcategories VALUES(1009,1011,609,200,1,90);
INSERT INTO menurowcategories VALUES(1010,1011,610,200,1,100);
INSERT INTO menurowcategories VALUES(1011,1011,611,200,1,110);
INSERT INTO menurowcategories VALUES(1012,1011,612,200,1,120);
INSERT INTO menurowcategories VALUES(1013,1011,613,200,1,130);
INSERT INTO menurowcategories VALUES(1014,1011,614,201,1,10);
INSERT INTO menurowcategories VALUES(1015,1011,615,201,1,20);
INSERT INTO menurowcategories VALUES(1016,1011,616,201,1,30);
INSERT INTO menurowcategories VALUES(1017,1011,617,201,1,40);
INSERT INTO menurowcategories VALUES(1018,1011,618,201,1,50);
INSERT INTO menurowcategories VALUES(1019,1011,619,201,1,60);
INSERT INTO menurowcategories VALUES(1020,1011,620,202,1,10);
INSERT INTO menurowcategories VALUES(1021,1011,621,202,1,20);
INSERT INTO menurowcategories VALUES(1022,1011,622,202,1,30);
INSERT INTO menurowcategories VALUES(1023,1011,623,202,1,40);
INSERT INTO menurowcategories VALUES(1024,1011,624,202,1,50);
INSERT INTO menurowcategories VALUES(1025,1011,625,202,1,60);
INSERT INTO menurowcategories VALUES(1026,1011,626,202,1,70);
INSERT INTO menurowcategories VALUES(1027,1011,627,202,1,80);
INSERT INTO menurowcategories VALUES(1028,1011,628,202,1,90);
INSERT INTO menurowcategories VALUES(1029,1011,629,202,1,110);
INSERT INTO menurowcategories VALUES(1030,1011,630,202,1,120);
INSERT INTO menurowcategories VALUES(1031,1011,631,202,1,130);
INSERT INTO menurowcategories VALUES(1032,1011,632,202,1,140);
INSERT INTO menurowcategories VALUES(1033,1011,633,202,1,150);
INSERT INTO menurowcategories VALUES(1034,1011,634,202,1,160);
INSERT INTO menurowcategories VALUES(1035,1011,635,202,1,170);
INSERT INTO menurowcategories VALUES(1036,1011,636,203,1,10);
INSERT INTO menurowcategories VALUES(1037,1011,637,203,1,20);
INSERT INTO menurowcategories VALUES(1038,1011,638,203,1,30);
INSERT INTO menurowcategories VALUES(1039,1011,639,203,1,40);
INSERT INTO menurowcategories VALUES(1040,1011,640,203,1,50);
INSERT INTO menurowcategories VALUES(1041,1011,641,203,1,60);
INSERT INTO menurowcategories VALUES(1042,1011,642,203,1,70);
INSERT INTO menurowcategories VALUES(1043,1011,643,203,1,80);
INSERT INTO menurowcategories VALUES(1044,1011,644,203,1,90);
INSERT INTO menurowcategories VALUES(1045,1011,645,203,1,100);
INSERT INTO menurowcategories VALUES(1046,1011,646,203,1,155);
INSERT INTO menurowcategories VALUES(1047,1011,647,203,1,120);
INSERT INTO menurowcategories VALUES(1048,1011,648,203,1,130);
INSERT INTO menurowcategories VALUES(1049,1011,649,203,1,140);
INSERT INTO menurowcategories VALUES(1050,1011,650,203,1,150);
INSERT INTO menurowcategories VALUES(1051,1011,651,203,1,160);
INSERT INTO menurowcategories VALUES(1052,1011,652,203,1,170);
INSERT INTO menurowcategories VALUES(1053,1011,653,203,1,180);
INSERT INTO menurowcategories VALUES(1054,1011,654,203,1,190);
INSERT INTO menurowcategories VALUES(1055,1011,655,203,1,200);
INSERT INTO menurowcategories VALUES(1056,1011,656,203,1,210);
INSERT INTO menurowcategories VALUES(1057,1011,657,203,1,220);
INSERT INTO menurowcategories VALUES(1058,1011,658,203,1,230);
INSERT INTO menurowcategories VALUES(1059,1011,659,203,1,240);
INSERT INTO menurowcategories VALUES(1060,1011,660,203,1,250);
INSERT INTO menurowcategories VALUES(1061,1011,661,203,1,260);
INSERT INTO menurowcategories VALUES(1062,1011,662,203,1,270);
INSERT INTO menurowcategories VALUES(1063,1011,663,203,1,280);
INSERT INTO menurowcategories VALUES(1064,1011,664,203,1,290);
INSERT INTO menurowcategories VALUES(1065,1011,665,203,1,300);
INSERT INTO menurowcategories VALUES(1066,1011,666,203,1,310);
INSERT INTO menurowcategories VALUES(1067,1011,667,203,1,320);
INSERT INTO menurowcategories VALUES(1068,1011,668,203,1,330);
INSERT INTO menurowcategories VALUES(1069,1011,669,203,1,340);
INSERT INTO menurowcategories VALUES(1070,1011,670,203,1,350);
INSERT INTO menurowcategories VALUES(1071,1011,671,203,1,360);
INSERT INTO menurowcategories VALUES(1072,1011,672,203,1,370);
INSERT INTO menurowcategories VALUES(1073,1011,673,203,1,380);
INSERT INTO menurowcategories VALUES(1074,1011,674,203,1,390);
INSERT INTO menurowcategories VALUES(1075,1011,675,203,1,400);
INSERT INTO menurowcategories VALUES(1076,1011,676,203,1,410);
INSERT INTO menurowcategories VALUES(1077,1011,677,203,1,420);
INSERT INTO menurowcategories VALUES(1079,1011,679,204,1,320);
INSERT INTO menurowcategories VALUES(1080,1011,680,204,1,330);
INSERT INTO menurowcategories VALUES(1081,1011,681,204,1,340);
INSERT INTO menurowcategories VALUES(1082,1011,682,204,1,350);
INSERT INTO menurowcategories VALUES(1083,1011,683,204,1,360);
INSERT INTO menurowcategories VALUES(1084,1011,684,205,1,370);
INSERT INTO menurowcategories VALUES(1085,1011,685,205,1,380);
INSERT INTO menurowcategories VALUES(1086,1011,686,205,1,390);
INSERT INTO menurowcategories VALUES(1087,1011,687,205,1,400);
INSERT INTO menurowcategories VALUES(1088,1011,688,205,1,410);
INSERT INTO menurowcategories VALUES(1089,1011,689,205,1,420);
INSERT INTO menurowcategories VALUES(1090,1011,690,206,1,430);
INSERT INTO menurowcategories VALUES(1091,1011,691,206,1,440);
INSERT INTO menurowcategories VALUES(1092,1011,692,206,1,450);
INSERT INTO menurowcategories VALUES(1093,1011,693,207,1,460);
INSERT INTO menurowcategories VALUES(1094,1011,694,207,1,470);
INSERT INTO menurowcategories VALUES(1095,1011,695,207,1,480);
INSERT INTO menurowcategories VALUES(1096,1011,696,207,1,490);
INSERT INTO menurowcategories VALUES(1097,1011,697,208,1,500);
INSERT INTO menurowcategories VALUES(1098,1011,698,208,1,510);
INSERT INTO menurowcategories VALUES(1099,1011,699,208,1,520);
INSERT INTO menurowcategories VALUES(1100,1011,700,208,1,530);
INSERT INTO menurowcategories VALUES(1101,1011,701,208,1,540);
INSERT INTO menurowcategories VALUES(1102,1011,702,208,1,550);
INSERT INTO menurowcategories VALUES(1103,1011,703,208,1,560);



DROP TABLE IF EXISTS menurows;

CREATE TABLE `menurows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `section` int DEFAULT NULL,
  `description` mediumtext,
  `price` int DEFAULT '0',
  `status` int DEFAULT NULL,
  `long_description` longtext,
  `long_description_en` longtext,
  `printdescription` varchar(100) DEFAULT NULL,
  `image_path_low` varchar(100) DEFAULT NULL,
  `image_path_high` varchar(100) DEFAULT NULL,
  `note` int DEFAULT '0',
  `qty_min` int DEFAULT '1',
  `qty_max` int DEFAULT '20',
  `qty_step` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=704 DEFAULT CHARSET=latin1;

INSERT INTO menurows VALUES(1,1001,Muller Thurgau,2,Azienda agricola Traval Alto Adige,1400,0,Azienda agricola Traval Alto Adige,NULL,NULL,userimage/1_low.jpeg,userimage/1_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(2,1001,Gewurztraminer,2,Azienda agricola Traval Alto Adige,1500,1,Azienda agricola Traval Alto Adige,NULL,NULL,userimage/2_low.jpeg,userimage/2_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(3,1001,Falanghina,2,Azienda agricola Feudi S.Gregorio Campania,1600,0,Azienda agricola Feudi S.Gregorio Campania,NULL,NULL,userimage/3_low.jpeg,userimage/3_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(4,1001,Greco di Tufo,2,Azienda agricola Feudi S.Gregorio Campania,1800,0,Azienda agricola Feudi S.Gregorio Campania,NULL,NULL,userimage/4_low.jpeg,userimage/4_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(5,1001,Anthilia,2,Azienda agricola donna Fugata Sicilia,1600,1,Azienda agricola donna Fugata Sicilia,NULL,NULL,userimage/5_low.jpeg,userimage/5_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(6,1001,Galestro capsula viola,2,Azienda agricola Antinori Toscana,1000,1,Azienda agricola Antinori Toscana,NULL,NULL,userimage/6_low.jpeg,userimage/6_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(7,1001,Verdicchio,2,Azienda agricola Fazi & Battaglia Marche,1000,0,Azienda agricola Fazi & Battaglia Marche,NULL,NULL,userimage/7_low.jpeg,userimage/7_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(8,1001,Vermentino di Maremma,2,Azienda agricola Balbino Toscana,1500,0,Azienda agricola Balbino Toscana,NULL,NULL,userimage/8_low.jpeg,userimage/8_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(9,1001,Ribolla Gialla,2,Azienda agricola Toblar Friuli,1800,1,Azienda agricola Toblar Friuli,NULL,NULL,userimage/9_low.jpeg,userimage/9_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(10,1001,Pinot Nero (vin.Bianco),2,Azienda agricola Giorgi Lombardia,1500,1,Azienda agricola Giorgi Lombardia,NULL,NULL,userimage/10_low.jpeg,userimage/10_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(11,1001,Ortrugo vivace,2,Cantina Il Casello,1000,0,Cantina Il Casello,NULL,NULL,userimage/11_low.jpeg,userimage/11_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(12,1001,Malvasia secca,2,Azienda agricola Montesissa Emilia Romagna,1000,1,Azienda agricola Montesissa Emilia Romagna,NULL,NULL,userimage/12_low.jpeg,userimage/12_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(13,1001,Malvasia dolce,2,Azienda agricola Ariola Emilia Romagna,1000,1,Azienda agricola Ariola Emilia Romagna,NULL,NULL,userimage/13_low.jpeg,userimage/13_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(14,1001,Brentino rosso del veneto,2,Azienda agricola Maculan Veneto,1800,1,Azienda agricola Maculan Veneto,NULL,NULL,userimage/14_low.jpeg,userimage/14_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(15,1001,Dolcetto d'Alba,2,Azienda agricola Sylla Sebaste Piemonte,1500,0,Azienda agricola Sylla Sebaste Piemonte,NULL,NULL,userimage/15_low.jpeg,userimage/15_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(16,1001,Nobile di Montepulciano,2,Azienda agricola Poliziano Toscana,3000,1,Azienda agricola Poliziano Toscana,NULL,NULL,userimage/16_low.jpeg,userimage/16_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(17,1001,Rosso di Montepulciano,2,Azienda agricola Poliziano Toscana,2000,0,Azienda agricola Poliziano Toscana,NULL,NULL,userimage/17_low.jpeg,userimage/17_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(18,1001,Guado al Tasso,2,Tenuta Guado al Tasso,7000,1,Tenuta Guado al Tasso,NULL,NULL,userimage/18_low.jpeg,userimage/18_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(19,1001,Bolgheri Le Volte,2,Tenuta Ornellaia,2400,0,Tenuta Ornellaia,NULL,NULL,userimage/19_low.jpeg,userimage/19_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(20,1001,Amarone,2,Azienda agricola Zenato Veneto,4500,1,Azienda agricola Zenato Veneto,NULL,NULL,userimage/20_low.jpeg,userimage/20_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(21,1001,Chianti d.o.c.g.,2,Azienda agricola Piccolo Borgo Toscana,1500,1,Azienda agricola Piccolo Borgo Toscana,NULL,NULL,userimage/21_low.jpeg,userimage/21_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(22,1001,Primitivo di Manduria,2,Azienda agricola Archidamo Campania,1500,1,Azienda agricola Archidamo Campania,NULL,NULL,userimage/22_low.jpeg,userimage/22_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(23,1001,Sassicaia,2,Azienda agricola Bolgheri Toscana,12000,1,Azienda agricola Bolgheri Toscana,NULL,NULL,userimage/23_low.jpeg,userimage/23_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(24,1001,Valpolicella classe superiore,2,Azienda agricola Zenato Veneto,1500,0,Azienda agricola Zenato Veneto,NULL,NULL,userimage/24_low.jpeg,userimage/24_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(25,1001,Morellino di Scansano,2,Azienda agricola Terenzi Toscana,1500,0,Azienda agricola Terenzi Toscana,NULL,NULL,userimage/25_low.jpeg,userimage/25_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(26,1001,Sherezade (Nero d'Avola),2,Azienda agricola donna Fugata Sicilia,1500,1,Azienda agricola donna Fugata Sicilia,NULL,NULL,userimage/26_low.jpeg,userimage/26_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(27,1001,Gutturnio fermo barricato,2,Cantina Il Casello,1500,0,Cantina Il Casello,NULL,NULL,userimage/27_low.jpeg,userimage/27_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(28,1001,San Giovese di Romagna,2,Azienda agricola Spalletti Emilia Romagna,1200,0,Azienda agricola Spalletti Emilia Romagna,NULL,NULL,userimage/28_low.jpeg,userimage/28_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(29,1001,Gutturnio,2,Cantina Il Casello,1000,0,Cantina Il Casello,NULL,NULL,userimage/29_low.jpeg,userimage/29_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(30,1001,Bonarda dolce,2,Azienda agricola Montesissa Emilia Romagna,1000,1,Azienda agricola Montesissa Emilia Romagna,NULL,NULL,userimage/30_low.jpeg,userimage/30_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(31,1001,Lambrusco Terre Verdiane,2,Azienda agricola Ceci Emilia Romagna,1000,1,Azienda agricola Ceci Emilia Romagna,NULL,NULL,userimage/31_low.jpeg,userimage/31_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(32,1001,Otello rosato frizzante,2,Azienda agricola Ceci Emilia Romagna,1200,1,Azienda agricola Ceci Emilia Romagna,NULL,NULL,userimage/32_low.jpeg,userimage/32_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(33,1001,Scalabrone Rosato,2,Azienda agricola Antinori Toscana,2200,1,Azienda agricola Antinori Toscana,NULL,NULL,userimage/33_low.jpeg,userimage/33_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(34,1001,Moscato rosa,2,Azienda agricola Cormons Friuli Venezia Giulia,1500,0,Azienda agricola Cormons Friuli Venezia Giulia,NULL,NULL,userimage/34_low.jpeg,userimage/34_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(36,1001,Galestro capsula viola,2,Azienda agricola Antinori Toscana,600,1,Azienda agricola Antinori Toscana,NULL,NULL,userimage/36_low.jpeg,userimage/36_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(37,1001,Verdicchio,2,Azienda agricola Fazi & Battaglia Marche,500,1,Azienda agricola Fazi & Battaglia Marche,NULL,NULL,userimage/37_low.jpeg,userimage/37_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(38,1001,Pinot Nero (vin.Bianco),2,Azienda agricola Giorgi Lombardia,700,1,Azienda agricola Giorgi Lombardia,NULL,NULL,userimage/38_low.jpeg,userimage/38_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(39,1001,Chianti d.o.c.g.,2,Azienda agricola Pirovano Toscana,600,1,Azienda agricola Pirovano Toscana,NULL,NULL,userimage/39_low.jpeg,userimage/39_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(40,1001,San Giovese di Romagna,2,Azienda agricola Spalletti Emilia Romagna,600,1,Azienda agricola Spalletti Emilia Romagna,NULL,NULL,userimage/40_low.jpeg,userimage/40_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(41,1001,Morellino di Scansano,2,Azienda agricola Terenzi Toscana,600,1,Azienda agricola Terenzi Toscana,NULL,NULL,userimage/41_low.jpeg,userimage/41_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(42,1001,Nero d'Avola,2,Azienda agricola Fina Sicilia,600,1,Azienda agricola Fina Sicilia,NULL,NULL,userimage/42_low.jpeg,userimage/42_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(43,1001,Coller Spumante,2,Azienda agricola Coller Lombardia,1800,0,Azienda agricola Coller Lombardia,NULL,NULL,userimage/43_low.jpeg,userimage/43_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(44,1001,Saten Vista,2,Azienda agricola Bellavista Franciacorta,3000,0,Azienda agricola Bellavista Franciacorta,NULL,NULL,userimage/44_low.jpeg,userimage/44_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(45,1001,Bellavista Brut,2,Azienda agricola Bellavista Franciacorta,3500,1,Azienda agricola Bellavista Franciacorta,NULL,NULL,userimage/45_low.jpeg,userimage/45_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(46,1001,Ferrari Brut,2,Azienda agricola Fratelli Lunelli Trentino,2500,1,Azienda agricola Fratelli Lunelli Trentino,NULL,NULL,userimage/46_low.jpeg,userimage/46_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(47,1001,Berlucchi Cellarius Brut,2,Azienda agricola Berlucchi Veneto,2500,1,Azienda agricola Berlucchi Veneto,NULL,NULL,userimage/47_low.jpeg,userimage/47_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(48,1001,Col Vetoraz,2,Azienda Col Vetoraz Veneto,2200,1,Azienda Col Vetoraz Veneto,NULL,NULL,userimage/48_low.jpeg,userimage/48_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(49,1001,Moet & Chandon,2,Cantina Moet & Chandon France,6000,1,Cantina Moet & Chandon France,NULL,NULL,userimage/49_low.jpeg,userimage/49_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(50,1001,Veuve Cliquot,2,Cantina Veuve Cliquot France,6000,1,Cantina Veuve Cliquot France,NULL,NULL,userimage/50_low.jpeg,userimage/50_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(51,1001,Krug,2,Maison Krug France,12000,0,Maison Krug France,NULL,NULL,userimage/51_low.jpeg,userimage/51_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(52,1001,Stria chiara - alla spina,2,NULL,400,0,description,NULL,NULL,userimage/52_low.jpeg,userimage/52_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(53,1001,Re Hop,2,Chiara beverina,1200,1,Chiara beverina,NULL,NULL,userimage/53_low.jpeg,userimage/53_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(54,1001,Re Hop Magnum,2,NULL,2200,0,description,NULL,NULL,userimage/54_low.jpeg,userimage/54_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(55,1001,Jadis,2,Ambrata,1200,1,Ambrata,NULL,NULL,userimage/55_low.jpeg,userimage/55_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(57,1001,Ambrosia,2,Bianca di frumento,1200,0,Bianca di frumento,NULL,NULL,userimage/57_low.jpeg,userimage/57_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(58,1001,Skizoid,2,Rossa tipo England,1200,1,Rossa tipo England,NULL,NULL,userimage/58_low.jpeg,userimage/58_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(59,1001,Stray Dog,2,Ambrata,1200,0,Ambrata,NULL,NULL,userimage/59_low.jpeg,userimage/59_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(60,1001,Via Emilia,2,Chiara,1200,1,Chiara,NULL,NULL,userimage/60_low.jpeg,userimage/60_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(61,1001,New Morning,2,ambrata,1200,1,ambrata,NULL,NULL,userimage/61_low.jpeg,userimage/61_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(62,1001,A.F.O. ale for obsessed,2,color ramato,1200,0,color ramato,NULL,NULL,userimage/62_low.jpeg,userimage/62_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(63,1001,Winterlude,2,Dorato intenso,1200,1,Dorato intenso,NULL,NULL,userimage/63_low.jpeg,userimage/63_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(64,1001,Birra Weiss Franziskaner,2,NULL,500,1,description,NULL,NULL,userimage/64_low.jpeg,userimage/64_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(65,1001,Birra alla spina piccola Bitburger,2,NULL,300,1,description,NULL,NULL,userimage/65_low.jpeg,userimage/65_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(66,1001,Birra alla spina media Bitburger,2,NULL,450,1,description,NULL,NULL,userimage/65_low.jpeg,userimage/65_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(67,1001,Birra Heineken lattina,2,NULL,350,1,description,NULL,NULL,userimage/67_low.jpeg,userimage/67_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(68,1001,Birra analcolica boccetto,2,NULL,350,0,description,NULL,NULL,userimage/68_low.jpeg,userimage/PNA_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(69,1001,Coca Cola in bottiglia di vetro,2,150 cl.,700,0,Coca Cola nella tradizionale bottiglia Contour che l'ha resa celeberrima,Coke in the traditional Contour the glass bottle which made it famous all over the world,NULL,userimage/69_low.jpeg,userimage/69_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(70,1001,Acqua minerale,2,Bottiglia di vetro da 75 cl.,250,1,L'Acqua Pejo Fonte Alpina sgorga a 1.393 Metri in una delle localita' piu' suggestive del Parco Nazionale dello Stelvio,Natural water. Pejo Fonte Alpina water flows 1.393 meters high in one of the most suggestive resort in the Stelvio National Park,NULL,userimage/acqua_low.jpg,userimage/acqua_high.jpg,0,1,20,1);
INSERT INTO menurows VALUES(71,1001,Crodino,2,NULL,300,1,description,NULL,NULL,userimage/71_low.jpeg,userimage/71_high.jpeg,0,6,60,2);
INSERT INTO menurows VALUES(72,1001,San Bitter,2,NULL,300,1,description,NULL,NULL,userimage/72_low.jpeg,userimage/72_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(73,1001,Campari Soda,2,NULL,300,1,description,NULL,NULL,userimage/73_low.jpeg,userimage/73_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(74,1001,Coca Cola in lattina,2,33 cl.,300,1,,Coke can,NULL,userimage/74_low.jpeg,userimage/74_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(75,1001,Coca Cola Light,2,Lattina slim da 33 cl.,300,1,,Diet Coke in slim can,NULL,userimage/75_low.jpeg,userimage/75_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(76,1001,Coca Cola Zero,2,NULL,300,1,description,NULL,NULL,userimage/76_low.jpeg,userimage/76_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(77,1001,Chino',2,NULL,300,1,Chino',NULL,NULL,userimage/77_low.jpeg,userimage/77_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(78,1001,Fanta in lattina slim,2,NULL,300,1,description,NULL,NULL,userimage/78_low.jpeg,userimage/78_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(79,1001,Lemonsoda,2,NULL,300,1,description,NULL,NULL,userimage/79_low.jpeg,userimage/79_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(80,1001,Aranciata S.Pellegrino Amara,2,NULL,300,1,description,NULL,NULL,userimage/80_low.jpeg,userimage/80_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(81,1001,Shweppes in lattina,2,NULL,300,1,description,NULL,NULL,userimage/81_low.jpeg,userimage/81_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(82,1001,The al limone San Bebedetto in lattina,2,NULL,300,0,description,NULL,NULL,userimage/82_low.jpeg,userimage/82_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(83,1001,The alla pesca San Bebedetto in lattina,2,NULL,300,0,description,NULL,NULL,userimage/83_low.jpeg,userimage/83_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(84,1001,Sprite in lattina slim,2,NULL,300,1,description,NULL,NULL,userimage/84_low.jpeg,userimage/84_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(85,1001,Birra in bottiglia Beck's,2,NULL,300,1,description,NULL,NULL,userimage/85_low.jpeg,userimage/85_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(86,1001,Birra in bottiglia Tourtel,2,NULL,300,0,description,NULL,NULL,userimage/upload/20130416013219_low.jpeg,userimage/upload/20130416013219_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(100,1001,Affettato misto,0,NULL,1200,1,Affettato misto,mixed of sliced hams,NULL,userimage/100_low.jpeg,userimage/100_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(101,1001,Culatello e formaggio Grana,0,NULL,1000,0,Culatello e formaggio Grana,special ham's king of Parma with parmesan cheese,NULL,userimage/101_low.jpeg,userimage/101_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(102,1001,Culatello con riccioli di burro,0,NULL,800,0,Culatello con riccioli di burro,special ham's king of Parma with butter,NULL,userimage/102_low.jpeg,userimage/102_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(103,1001,Prosciutto crudo di parma 22 Mesi,0,NULL,1000,1,Prosciutto crudo di parma 22 Mesi,cured parma ham,NULL,userimage/103_low.jpeg,userimage/103_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(104,1001,Prosciutto crudo e grana,0,NULL,800,0,Prosciutto crudo e grana,cured parma and parmesan cheese,NULL,userimage/104_low.jpeg,userimage/104_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(105,1001,Bresaola olio e limone,0,NULL,1000,1,Bresaola olio e limone,cured raw beef dressed with oil and lemon,NULL,userimage/105_low.jpeg,userimage/105_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(106,1001,Bresaola rucola e grana,0,NULL,1000,0,Bresaola rucola e grana,cured raw beef with rocket and parmesan cheese,NULL,userimage/106_low.jpeg,userimage/PNA_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(107,1001,Caprese con mozzarella di bufala,0,NULL,1200,0,Caprese con mozzarella di bufala,salad mozzarella and tomatoes,NULL,userimage/107_low.jpeg,userimage/107_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(108,1001,Prosciutto crudo e melone,0,NULL,1200,1,Prosciutto crudo e melone,Parma ham and melon,NULL,userimage/108_low.jpeg,userimage/108_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(109,1001,Antipasto fantasia maremonti,0,NULL,1500,0,Antipasto fantasia maremonti,NULL,NULL,userimage/upload/20130418004033_low.jpeg,userimage/upload/20130418004033_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(110,1001,Misto mare L'Incontro,0,NULL,1000,1,Misto mare L'Incontro,mixed sea of the house,NULL,userimage/110_low.jpeg,userimage/110_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(111,1001,Pepata di cozze (bianche),0,NULL,1000,0,Pepata di cozze (bianche),mussels,NULL,userimage/111_low.jpeg,userimage/111_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(112,1001,Cozze alla Tarantina,0,NULL,1600,1,Cozze alla Tarantina, with tomato sauce and pasjey,NULL,userimage/112_low.jpeg,userimage/112_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(113,1001,Saute' di mare,0,NULL,1000,1,Saute' di mare,shellfish and sea food in tomato sauce,NULL,userimage/113_low.jpeg,userimage/113_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(114,1001,Insalata di mare,0,NULL,1000,1,Insalata di mare,hot see food salad,NULL,userimage/114_low.jpeg,userimage/114_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(115,1001,Polipo caldo con patate,0,NULL,1000,0,Polipo caldo con patate,hot octopus and potatoes salad,NULL,userimage/115_low.jpeg,userimage/115_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(116,1001,Cocktail di gamberetti,0,NULL,800,1,Cocktail di gamberetti,prawn cocktail,NULL,userimage/116_low.jpeg,userimage/116_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(117,1001,Alici marinate,0,NULL,1000,1,Alici marinate,marinated anchoves,NULL,userimage/117_low.jpeg,userimage/117_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(118,1001,Alici piccanti ''Rizzoli'' con rucola,0,NULL,1200,0,Alici piccanti ''Rizzoli'' con rucola,spicy rizzoli anchoves with rocket,NULL,userimage/118_low.jpeg,userimage/118_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(119,1001,Carpaccio di polipo con salsa al basilico e pinoli,0,NULL,1000,0,Carpaccio di polipo con salsa al basilico e pinoli,carpaccio of octopus with basil sauce and pine nuts,NULL,userimage/119_low.jpeg,userimage/119_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(120,1001,Gamberetti con rucola, pomodorini, scaglie di grana e zucchine,0,NULL,800,1,Gamberetti con rucola, pomodorini, scaglie di grana e zucchine,NULL,NULL,userimage/120_low.jpeg,userimage/120_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(121,1001,Spaghetti all'incontro,0,NULL,700,0,Spaghetti all'incontro,with ham bolognese, curry and cream,NULL,userimage/121_low.jpeg,userimage/PNA_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(122,1001,Spaghetti all'amatriciana,0,NULL,600,0,Spaghetti all'amatriciana,smoked bacon, onion, tomato sauce,NULL,userimage/122_low.jpeg,userimage/122_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(123,1001,Spaghetti pomodoro e basilico,0,NULL,700,0,Spaghetti pomodoro e basilico,spaghetti with tomatoes and basil sauce,NULL,userimage/123_low.jpeg,userimage/123_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(124,1001,Spaghetti alla carbonara,0,NULL,700,0,Spaghetti alla carbonara,smoked bacon, pieces, eggs, and cream,NULL,userimage/124_low.jpeg,userimage/124_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(125,1001,Penne all'arrabbiata,0,NULL,600,1,Penne all'arrabbiata,NULL,NULL,userimage/125_low.jpeg,userimage/125_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(126,1001,Spaghetti aglio e olio,0,NULL,700,0,Spaghetti aglio e olio,NULL,NULL,userimage/126_low.jpeg,userimage/126_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(127,1001,Tagliatelle al ragu',0,NULL,900,1,Tagliatelle al ragu',home-made noodles in bolognese sauce,NULL,userimage/127_low.jpeg,userimage/127_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(128,1001,Tagliatelle con funghi porcini,0,NULL,700,0,Tagliatelle con funghi porcini,home-made noodles with mushrooms,NULL,userimage/128_low.jpeg,userimage/128_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(129,1001,Chicche della nonna,0,NULL,800,1,Chicche della nonna,Potaoe dumplins with spinach in a tomatoe cream,NULL,userimage/129_low.jpeg,userimage/129_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(130,1001,Tortelloni alla Mantovana,0,NULL,800,1,Tortelloni alla Mantovana,pasta stuffed with zucca and sausage,NULL,userimage/130_low.jpeg,userimage/130_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(131,1001,Tortelloni alla parmigiana,0,NULL,700,0,Tortelloni alla parmigiana,Pasta stuffed with buttermilk cheese,NULL,userimage/131_low.jpeg,userimage/131_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(132,1001,Gnocchi al pomodoro,0,NULL,800,1,Gnocchi al pomodoro,potaoe dumplins with tomatoe sauce,NULL,userimage/132_low.jpeg,userimage/132_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(133,1001,Gnocchi al gongorzola dolce,0,NULL,900,1,Gnocchi al gongorzola dolce,potatoe dumplins in gongorzola sauce,NULL,userimage/133_low.jpeg,userimage/133_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(134,1001,Gnocchi alla Giuseppe Verdi,0,NULL,700,0,Gnocchi alla Giuseppe Verdi,potatoe dumplins in a Parma ham mushroom and asparagus,NULL,userimage/134_low.jpeg,userimage/134_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(135,1001,Tagliolini alla crudaiola,0,NULL,800,0,Tagliolini alla crudaiola,mozzarella cheese with tomatoe and basil,NULL,userimage/135_low.jpeg,userimage/135_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(136,1001,Tagliolini alla Genovese,0,NULL,1000,1,Tagliolini alla Genovese,hand-made noodles with pesto potatoes and green beans,NULL,userimage/136_low.jpeg,userimage/136_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(137,1001,Cigno di Venere,0,NULL,800,0,Cigno di Venere,home-made noodles with truffle, parma ham and cream sauce,NULL,userimage/137_low.jpeg,userimage/PNA_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(138,1001,Lasagne alla bolognese,0,NULL,800,0,Lasagne alla bolognese,NULL,NULL,userimage/138_low.jpeg,userimage/138_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(139,1001,Ravioli panna e prosciutto,0,NULL,1000,0,Ravioli panna e prosciutto,NULL,NULL,userimage/139_low.jpeg,userimage/139_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(140,1001,Agnolotti con salsa tartufo e prosciutto di Praga,0,NULL,800,1,Agnolotti con salsa tartufo e prosciutto di Praga,NULL,NULL,userimage/140_low.jpeg,userimage/140_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(141,1001,Pisarei e faso',0,NULL,700,0,Pisarei e faso',NULL,NULL,userimage/141_low.jpeg,userimage/141_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(142,1001,Orecchiette alla Barese,0,NULL,900,0,Orecchiette alla Barese,NULL,NULL,userimage/142_low.jpeg,userimage/142_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(143,1001,Cappelletti in brodo,0,NULL,900,0,Cappelletti in brodo,NULL,NULL,userimage/143_low.jpeg,userimage/143_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(144,1001,Cappelletti rucola e speck,0,NULL,1200,0,Cappelletti rucola e speck,NULL,NULL,userimage/144_low.jpeg,userimage/144_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(145,1001,Spaghetti allo scoglio,0,NULL,1000,0,Spaghetti allo scoglio,spaghetti with seafood sauce,NULL,userimage/145_low.jpeg,userimage/145_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(146,1001,Spaghetti alle vongole veraci,0,NULL,2000,0,Spaghetti alle vongole veraci,spaghetti with cockies,NULL,userimage/146_low.jpeg,userimage/146_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(147,1001,Tagliolini caserecci con Astice,0,NULL,900,1,Tagliolini caserecci con Astice,Home-made noodles with crawfish,NULL,userimage/147_low.jpeg,userimage/147_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(148,1001,Tagliolini al salmone,0,NULL,1000,1,Tagliolini al salmone,Home-made noodles with salmon,NULL,userimage/148_low.jpeg,userimage/148_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(149,1001,Tagliolini al sapore di mare,0,NULL,1000,0,Tagliolini al sapore di mare,Home-made noodles with seafood,NULL,userimage/149_low.jpeg,userimage/149_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(150,1001,Paglia e fieno agli scampi,0,NULL,1600,1,Paglia e fieno agli scampi,Pasta with scampi,NULL,userimage/150_low.jpeg,userimage/PNA_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(151,1001,Paella di pesce,0,NULL,1000,1,Paella di pesce,Fish Paella,NULL,userimage/151_low.jpeg,userimage/151_high.jpeg,0,2,20,2);
INSERT INTO menurows VALUES(152,1001,Gnocchi Incontro,0,NULL,1000,0,Gnocchi Incontro,Potatoe dumplings, courgettes, prawns,NULL,userimage/152_low.jpeg,userimage/PNA_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(153,1001,Garganelli Vesuvio,0,NULL,1000,1,Garganelli Vesuvio,Pasta with truffle sauce, prawns, porcini mushrooms,NULL,userimage/153_low.jpeg,userimage/153_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(154,1001,Garganelli al curry gamberetty e zucchine,0,NULL,1000,1,Garganelli al curry gamberetty e zucchine,Pasta with courgettes, prawns, curry sauce,NULL,userimage/154_low.jpeg,userimage/154_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(155,1001,Tagliatelle con polipo e carciofi,0,NULL,800,1,Tagliatelle con polipo e carciofi,NULL,NULL,userimage/155_low.jpeg,userimage/155_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(156,1001,Risotto alla parmigiana,0,NULL,1000,1,Risotto alla parmigiana,Rice parmesan cheese,NULL,userimage/156_low.jpeg,userimage/156_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(157,1001,Risotto ai funghi porcini,0,NULL,900,1,Risotto ai funghi porcini,NULL,NULL,userimage/157_low.jpeg,userimage/157_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(158,1001,Risotto radicchio e provola,0,NULL,1000,1,Risotto radicchio e provola,NULL,NULL,userimage/158_low.jpeg,userimage/158_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(159,1001,Risotto alla Giuseppe Verdi,0,NULL,1200,1,Risotto alla Giuseppe Verdi,NULL,NULL,userimage/159_low.jpeg,userimage/159_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(160,1001,Risotto del pescatore,0,NULL,1400,0,Risotto del pescatore,NULL,NULL,userimage/160_low.jpeg,userimage/160_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(161,1001,Spadellata di tonno fresco con erbe aromatiche e verdure al vapore,0,NULL,1200,0,Spadellata di tonno fresco con erbe aromatiche e verdure al vapore,NULL,NULL,userimage/161_low.jpeg,userimage/161_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(162,1001,Fritto misto,0,NULL,1800,0,Fritto misto,NULL,NULL,userimage/162_low.jpeg,userimage/162_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(163,1001,Misto alla griglia,0,NULL,1400,1,Misto alla griglia,NULL,NULL,userimage/163_low.jpeg,userimage/163_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(164,1001,Spiedini di gamberi e calamari,0,NULL,350,1,Spiedini di gamberi e calamari,NULL,NULL,userimage/164_low.jpeg,userimage/164_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(165,1001,Orata o branzino al forno 400/600,0,NULL,350,1,Orata o branzino al forno 400/600,NULL,NULL,userimage/165_low.jpeg,userimage/165_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(166,1001,Orata o branzino all'asolana 400/600,0,NULL,1600,0,Orata o branzino all'asolana 400/600,NULL,NULL,userimage/166_low.jpeg,userimage/166_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(167,1001,Scampi gratinati al forno,0,NULL,1600,0,Scampi gratinati al forno,NULL,NULL,userimage/167_low.jpeg,userimage/167_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(168,1001,Scampi alla griglia,0,NULL,1600,1,Scampi alla griglia,NULL,NULL,userimage/168_low.jpeg,userimage/168_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(169,1001,Gamberoni alla griglia,0,NULL,1200,0,Gamberoni alla griglia,NULL,NULL,userimage/169_low.jpeg,userimage/169_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(170,1001,Trancio di tonno fresco con pomodorini,0,NULL,1800,1,Trancio di tonno fresco con pomodorini,NULL,NULL,userimage/170_low.jpeg,userimage/170_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(171,1001,Gamberoni al curry con riso pilaw,0,NULL,2000,1,Gamberoni al curry con riso pilaw,NULL,NULL,userimage/171_low.jpeg,userimage/171_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(172,1001,Delizie del pescatore,0,NULL,2000,0,Delizie del pescatore,NULL,NULL,userimage/172_low.jpeg,userimage/172_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(173,1001,Misto di verdure alla griglia,0,NULL,400,1,Misto di verdure alla griglia,Mixed grilled vegetables,NULL,userimage/173_low.jpeg,userimage/173_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(174,1001,Carciofi gratinati,0,NULL,500,0,Carciofi gratinati,Artichokes gratin,NULL,userimage/174_low.jpeg,userimage/174_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(175,1001,Insalata mista,0,NULL,400,1,Insalata mista,mixed salad,NULL,userimage/175_low.jpeg,userimage/175_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(176,1001,Patatine fritte,0,NULL,300,1,Patatine fritte,French fries,NULL,userimage/176_low.jpeg,userimage/176_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(177,1001,Spinaci al burro,0,NULL,400,0,Spinaci al burro,Spinach in butter,NULL,userimage/177_low.jpeg,userimage/177_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(178,1001,Patate al vapore,0,NULL,300,0,Patate al vapore,Boiled tomatoes,NULL,userimage/178_low.jpeg,userimage/178_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(179,1001,Verdure cotte miste al vapore,0,NULL,400,0,Verdure cotte miste al vapore,boiled vegetables,NULL,userimage/179_low.jpeg,userimage/179_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(180,1001,Pinzimonio,0,NULL,900,1,Pinzimonio,NULL,NULL,userimage/180_low.jpeg,userimage/180_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(181,1001,Filetto di manzo ''Angus'' all'Incontro,0,NULL,1800,1,Filetto di manzo ''Angus'' all'Incontro,Fillet steak in balsamic inegar sauce with parmesan cheese,NULL,userimage/181_low.jpeg,userimage/181_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(182,1001,Filetto di manzo alla brace,0,NULL,1600,1,Filetto di manzo alla brace,oven cooked fillet steak,NULL,userimage/182_low.jpeg,userimage/182_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(183,1001,Filetto al pepe verde,0,NULL,1700,1,Filetto al pepe verde,fillet steak in green peppercom sauce,NULL,userimage/183_low.jpeg,userimage/183_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(184,1001,Filetto ai funghi porcini,0,NULL,1800,0,Filetto ai funghi porcini,fillet with mushrooms,NULL,userimage/184_low.jpeg,userimage/184_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(185,1001,Filetto gongorzola e peperoni,0,NULL,1700,1,Filetto gongorzola e peperoni,NULL,NULL,userimage/185_low.jpeg,userimage/185_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(186,1001,Costata con osso 400/600 gr.,0,NULL,350,0,Costata con osso 400/600 gr.,NULL,NULL,userimage/186_low.jpeg,userimage/186_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(187,1001,Fiorentina 900/1200 gr.,0,NULL,450,0,Fiorentina 900/1200 gr.,Large T-Bone 900/1200 gr.,NULL,userimage/187_low.jpeg,userimage/187_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(188,1001,Tagliata rucola e scaglie di grana,0,NULL,1400,0,Tagliata rucola e scaglie di grana,steak slices with rockey and parmesan,NULL,userimage/188_low.jpeg,userimage/188_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(189,1001,Tagliata alle erbe,0,NULL,1400,0,Tagliata alle erbe,steak slices, herbs,NULL,userimage/189_low.jpeg,userimage/189_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(190,1001,Tagliata aceto balsamico e grana,0,NULL,1400,1,Tagliata aceto balsamico e grana,steak slices with balsamic vinegar & parmesan,NULL,userimage/190_low.jpeg,userimage/190_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(191,1001,Paillard di vitello alla griglia,0,NULL,900,0,Paillard di vitello alla griglia,grilled veal steak,NULL,userimage/191_low.jpeg,userimage/191_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(192,1001,Scaloppine di vitello al limone,0,NULL,900,0,Scaloppine di vitello al limone,Veal in lemon sauce,NULL,userimage/192_low.jpeg,userimage/192_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(193,1001,Scaloppine di vitello al vino bianco,0,NULL,900,0,Scaloppine di vitello al vino bianco,Veal in white wine sauce,NULL,userimage/193_low.jpeg,userimage/193_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(194,1001,Misto alla griglia,0,NULL,1800,0,Misto alla griglia,NULL,NULL,userimage/194_low.jpeg,userimage/194_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(195,1001,Super grigliata,0,NULL,2400,1,Super grigliata,NULL,NULL,userimage/195_low.jpeg,userimage/195_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(196,1001,Nodino di vitello burro e salvia,0,NULL,1500,1,Nodino di vitello burro e salvia,NULL,NULL,userimage/196_low.jpeg,userimage/196_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(197,1001,Cotoletta alla Milanese,0,NULL,1000,0,Cotoletta alla Milanese,NULL,NULL,userimage/197_low.jpeg,userimage/197_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(198,1001,Luganega alla griglia con patatine,0,NULL,700,0,Luganega alla griglia con patatine,NULL,NULL,userimage/198_low.jpeg,userimage/198_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(199,1001,Wurstel con patatine,0,NULL,700,1,Wurstel con patatine,NULL,NULL,userimage/199_low.jpeg,userimage/199_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(200,1001,Uova con asparagi e salsa tartufo,0,NULL,900,0,Uova con asparagi e salsa tartufo,NULL,NULL,userimage/200_low.jpeg,userimage/200_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(201,1001,Insalata primavera,0,NULL,700,1,Insalata primavera,NULL,NULL,userimage/201_low.jpeg,userimage/201_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(202,1001,Insalata rustica,0,NULL,700,1,Insalata rustica,NULL,NULL,userimage/202_low.jpeg,userimage/202_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(203,1001,Insalata viennese,0,NULL,700,1,Insalata viennese,NULL,NULL,userimage/203_low.jpeg,userimage/203_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(204,1001,Insalata nizzarda,0,NULL,700,1,Insalata nizzarda,NULL,NULL,userimage/204_low.jpeg,userimage/204_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(205,1001,Insalata stranazzella,0,NULL,1000,0,Insalata stranazzella,NULL,NULL,userimage/205_low.jpeg,userimage/PNA_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(206,1001,Chicchirichi',0,NULL,900,0,Chicchirichi',NULL,NULL,userimage/206_low.jpeg,userimage/PNA_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(207,1001,All'Incontro,1,NULL,800,0,All'Incontro,NULL,NULL,userimage/207_low.jpeg,userimage/207_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(208,1001,Margherita,1,NULL,600,1,Margherita,NULL,NULL,userimage/208_low.jpeg,userimage/208_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(209,1001,Napoletana,1,NULL,700,1,Napoletana,NULL,NULL,userimage/209_low.jpeg,userimage/209_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(210,1001,Culatello,1,NULL,1000,0,Culatello,NULL,NULL,userimage/210_low.jpeg,userimage/210_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(211,1001,Culatello e porcini,1,NULL,1300,0,Culatello e porcini,NULL,NULL,userimage/211_low.jpeg,userimage/211_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(212,1001,Culatello e gongorzola,1,NULL,1100,0,Culatello e gongorzola,NULL,NULL,userimage/212_low.jpeg,userimage/212_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(213,1001,Prosciutto crudo,1,NULL,800,1,Prosciutto crudo,NULL,NULL,userimage/213_low.jpeg,userimage/213_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(214,1001,Prosciutto crudo, rucola e grana,1,NULL,950,1,Prosciutto crudo, rucola e grana,NULL,NULL,userimage/214_low.jpeg,userimage/214_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(215,1001,Prosciutto crudo e funghi champignon,1,NULL,900,0,Prosciutto crudo e funghi champignon,NULL,NULL,userimage/215_low.jpeg,userimage/215_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(216,1001,Prosciutto crudo e funghi porcini,1,NULL,1150,1,Prosciutto crudo e funghi porcini,NULL,NULL,userimage/216_low.jpeg,userimage/216_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(217,1001,Prosciutto crudo porcini e grana,1,NULL,1250,0,Prosciutto crudo porcini e grana,NULL,NULL,userimage/217_low.jpeg,userimage/217_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(218,1001,Prosciutto crudo e funghi chiodini,1,NULL,900,0,Prosciutto crudo e funghi chiodini,NULL,NULL,userimage/218_low.jpeg,userimage/218_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(219,1001,Prosciutto crudo e gongorzola,1,NULL,900,0,Prosciutto crudo e gongorzola,NULL,NULL,userimage/219_low.jpeg,userimage/219_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(220,1001,Prosciutto di Praga,1,NULL,800,0,Prosciutto di Praga,NULL,NULL,userimage/220_low.jpeg,userimage/220_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(221,1001,Prosciutto cotto,1,prosciutto cotto,780,0,Prosciutto cotto,NULL,NULL,userimage/upload/20130416005748_low.jpeg,userimage/upload/20130416005748_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(222,1001,Prosciutto cotto e funghi champignon,1,NULL,850,0,Prosciutto cotto e funghi champignon,NULL,NULL,userimage/222_low.jpeg,userimage/222_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(223,1001,Prosciutto cotto e funghi porcini,1,NULL,1000,0,Prosciutto cotto e funghi porcini,NULL,NULL,userimage/223_low.jpeg,userimage/223_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(224,1001,Prosciutto cotto e funghi,1,NULL,850,0,Prosciutto cotto e funghi,NULL,NULL,userimage/224_low.jpeg,userimage/224_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(225,1001,Prosciutto cotto e carciofi,1,NULL,850,0,Prosciutto cotto e carciofi,NULL,NULL,userimage/225_low.jpeg,userimage/225_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(226,1001,Prosciutto cotto e melanzane,1,NULL,850,0,Prosciutto cotto e melanzane,NULL,NULL,userimage/226_low.jpeg,userimage/226_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(227,1001,prosciutto cotto e gongorzola,1,NULL,850,0,prosciutto cotto e gongorzola,NULL,NULL,userimage/227_low.jpeg,userimage/227_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(228,1001,Contadina (pomodorini e rucola),1,NULL,700,0,Contadina (pomodorini e rucola),NULL,NULL,userimage/228_low.jpeg,userimage/228_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(229,1001,Cenerentola (rucola e stracchino),1,NULL,750,0,Cenerentola (rucola e stracchino),NULL,NULL,userimage/229_low.jpeg,userimage/229_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(230,1001,Ortolana (verdure cotte a vapore),1,NULL,750,1,Ortolana (verdure cotte a vapore),NULL,NULL,userimage/230_low.jpeg,userimage/230_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(231,1001,Frutti di mare,1,NULL,1000,1,Frutti di mare,NULL,NULL,userimage/231_low.jpeg,userimage/231_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(232,1001,Philadelphia rucola e crudo,1,NULL,900,0,Philadelphia rucola e crudo,NULL,NULL,userimage/232_low.jpeg,userimage/232_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(233,1001,Rucola pomodoro e tonno,1,NULL,800,0,Rucola pomodoro e tonno,NULL,NULL,userimage/233_low.jpeg,userimage/233_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(234,1001,Salmone,1,NULL,900,0,Salmone,NULL,NULL,userimage/234_low.jpeg,userimage/234_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(235,1001,Salmone rucola e pomodorini,1,NULL,950,0,Salmone rucola e pomodorini,NULL,NULL,userimage/235_low.jpeg,userimage/235_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(236,1001,Bufala (La mozzarella viene aggiunta a freddo al termine della cottura),1,NULL,800,0,Bufala (La mozzarella viene aggiunta a freddo al termine della cottura),NULL,NULL,userimage/236_low.jpeg,userimage/236_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(237,1001,Bufalina (bufala rucola e pomodorini) (La mozzarella viene aggiunta a freddo al termine della cottur,1,Bufalina (bufala rucola e pomodorini) (La mozzarella viene aggiunta a freddo al termine della cottura),850,0,Bufalina (bufala rucola e pomodorini) (La mozzarella viene aggiunta a freddo al termine della cottura),NULL,NULL,userimage/237_low.jpeg,userimage/237_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(238,1001,Speck,1,NULL,750,0,Speck,NULL,NULL,userimage/238_low.jpeg,userimage/238_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(239,1001,Speck e brie,1,NULL,850,1,Speck e brie,NULL,NULL,userimage/239_low.jpeg,userimage/239_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(240,1001,Speck e gongorzola,1,NULL,850,0,Speck e gongorzola,NULL,NULL,userimage/240_low.jpeg,userimage/240_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(241,1001,Ilaria (speck e mascarpone),1,NULL,850,0,Ilaria (speck e mascarpone),NULL,NULL,userimage/241_low.jpeg,userimage/241_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(242,1001,Della chef (radicchio scamorza e pancetta),1,NULL,850,0,Della chef (radicchio scamorza e pancetta),NULL,NULL,userimage/242_low.jpeg,userimage/242_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(243,1001,Bomba (salsiccia, cipolla e gongorzola),1,NULL,800,0,Bomba (salsiccia, cipolla e gongorzola),NULL,NULL,userimage/243_low.jpeg,userimage/243_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(244,1001,Gongorzola,1,NULL,750,0,Gongorzola,NULL,NULL,userimage/244_low.jpeg,userimage/244_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(245,1001,Gongorzola e cipolla,1,NULL,750,0,Gongorzola e cipolla,NULL,NULL,userimage/245_low.jpeg,userimage/245_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(246,1001,4 formaggi (gongorzola, stracchino, mozzarella, grana),1,NULL,800,0,4 formaggi (gongorzola, stracchino, mozzarella, grana),NULL,NULL,userimage/246_low.jpeg,image/no_image_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(247,1001,1995 (rucola, gamberetti in salsa rosa),1,NULL,1000,0,1995 (rucola, gamberetti in salsa rosa),NULL,NULL,userimage/247_low.jpeg,userimage/247_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(248,1001,Lardo di colonnata,1,NULL,700,0,Lardo di colonnata,NULL,NULL,userimage/248_low.jpeg,userimage/248_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(249,1001,Salsiccia,1,NULL,700,0,Salsiccia,NULL,NULL,userimage/249_low.jpeg,userimage/249_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(250,1001,Salsiccia e patatine fritte,1,NULL,800,0,Salsiccia e patatine fritte,NULL,NULL,userimage/250_low.jpeg,userimage/250_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(251,1001,Patatine fritte,1,NULL,750,0,Patatine fritte,NULL,NULL,userimage/251_low.jpeg,userimage/251_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(252,1001,Wurstel,1,NULL,650,0,Wurstel,NULL,NULL,userimage/252_low.jpeg,userimage/252_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(253,1001,Wurstel e patatine,1,NULL,800,0,Wurstel e patatine,NULL,NULL,userimage/253_low.jpeg,userimage/253_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(254,1001,Salamino piccante,1,NULL,750,0,Salamino piccante,NULL,NULL,userimage/254_low.jpeg,userimage/254_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(255,1001,Acciughe e salame piccante,1,NULL,850,0,Acciughe e salame piccante,acciughe,NULL,userimage/upload/20130416005625_low.jpeg,userimage/upload/20130416005625_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(256,1001,Acciughe piccanti ''Rizzoli'',1,NULL,1000,1,Acciughe piccanti ''Rizzoli'',NULL,NULL,userimage/256_low.jpeg,userimage/256_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(257,1001,Rustica (prosciutto cotto, funghi, carciofi),1,NULL,950,0,Rustica (prosciutto cotto, funghi, carciofi),NULL,NULL,userimage/257_low.jpeg,userimage/257_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(258,1001,Valtellina (bresaola, pecorino, rucola),1,NULL,850,0,Valtellina (bresaola, pecorino, rucola),NULL,NULL,userimage/258_low.jpeg,userimage/258_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(259,1001,Marinara (senza mozzarella con aglio e prezzemolo),1,NULL,550,0,Marinara (senza mozzarella con aglio e prezzemolo),NULL,NULL,userimage/259_low.jpeg,userimage/259_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(260,1001,Tonno e cipolla,1,NULL,750,1,Tonno e cipolla,NULL,NULL,userimage/260_low.jpeg,userimage/260_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(261,1001,Boscaiola (Misto funghi),1,NULL,850,0,Boscaiola (Misto funghi),NULL,NULL,userimage/261_low.jpeg,userimage/261_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(262,1001,Farcita (Prosciutto cotto, funghi, carciofi),1,NULL,800,1,Farcita (Prosciutto cotto, funghi, carciofi),NULL,NULL,userimage/262_low.jpeg,userimage/262_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(263,1001,Rucola prorcini e scaglie di grana,1,NULL,950,0,Rucola prorcini e scaglie di grana,NULL,NULL,userimage/263_low.jpeg,userimage/263_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(264,1001,Corolle di carciofo,1,NULL,800,0,Corolle di carciofo,NULL,NULL,userimage/264_low.jpeg,userimage/264_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(265,1001,Funghi porcini,1,NULL,900,0,Funghi porcini,NULL,NULL,userimage/265_low.jpeg,userimage/265_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(266,1001,Funghi champignon,1,NULL,700,0,Funghi champignon,NULL,NULL,userimage/266_low.jpeg,userimage/266_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(267,1001,Culatello, alici Rizzoli, salsa tartufo, porcini,1,NULL,300,1,Culatello, alici Rizzoli, salsa tartufo, porcini,NULL,NULL,userimage/267_low.jpeg,userimage/267_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(268,1001,Prosciutto cotto, Prosciutto crudo, lardo, speck, gamberetti, salmone, scamorza, mascarpone,1,NULL,200,0,Prosciutto cotto, Prosciutto crudo, lardo, speck, gamberetti, salmone, scamorza, mascarpone,NULL,NULL,userimage/268_low.jpeg,userimage/268_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(269,1001,Acciughe, asparagi, carciofi, champignon, chiodini, funghi, grana, gongorzola,1,NULL,200,0,Acciughe, asparagi, carciofi, champignon, chiodini, funghi, grana, gongorzola,NULL,NULL,userimage/269_low.jpeg,userimage/269_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(270,1001,Peperoni, melanzane, zucchine, brie, salsiccia, salame piccante, stracchino, tonno, philadelphia,1,NULL,200,0,Peperoni, melanzane, zucchine, brie, salsiccia, salame piccante, stracchino, tonno, philadelphia,NULL,NULL,userimage/270_low.jpeg,userimage/270_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(271,1001,Aglio, capperi, olive, pomodorini, wurstel, cipolla,1,NULL,100,0,Aglio, capperi, olive, pomodorini, wurstel, cipolla,NULL,NULL,userimage/upload/20130416220650_low.jpeg,userimage/upload/20130416220650_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(272,1001,Gelato al gusto di Yogurt,1,NULL,500,1,Gelato al gusto di Yogurt a Km. 0 artigianale di nostra produzione. Con Fragole oppure Cioccolato,o Caramello da indicare nelle note ),NULL,NULL,userimage/272_low.jpeg,userimage/272_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(273,1001,Yogurt con fragole,1,NULL,500,0,Yogurt con fragole,NULL,NULL,userimage/273_low.jpeg,userimage/273_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(274,1001,Yogurt con macedonia,1,NULL,500,0,Yogurt con macedonia,NULL,NULL,userimage/274_low.jpeg,userimage/274_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(275,1001,Yogurt con cioccolato,1,NULL,500,0,Yogurt con cioccolato,NULL,NULL,userimage/275_low.jpeg,userimage/275_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(276,1001,Nutellino,1,NULL,450,0,Nutellino,NULL,NULL,userimage/276_low.jpeg,userimage/276_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(277,1001,Crema al mascarpone con frutti di bosco,1,NULL,450,1,Crema al mascarpone con frutti di bosco,NULL,NULL,userimage/277_low.jpeg,userimage/277_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(278,1001,Crema al mascarpone con cioccolato,1,NULL,450,0,Crema al mascarpone con cioccolato,NULL,NULL,userimage/278_low.jpeg,userimage/278_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(279,1001,Crema al mascarpone con cacao,1,NULL,450,0,Crema al mascarpone con cacao,NULL,NULL,userimage/279_low.jpeg,userimage/PNA_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(280,1001,Crema al mascarpone con fragole,1,NULL,500,0,Crema al mascarpone con fragole,NULL,NULL,userimage/280_low.jpeg,userimage/280_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(281,1001,Panna cotta,1,NULL,450,1,Panna cotta (con frutti di bosco, fragole, cioccolata, caramello. Da indicare nelle note),NULL,NULL,userimage/281_low.jpeg,userimage/281_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(282,1001,Panna cotta con cioccolato,1,NULL,450,0,Panna cotta con cioccolato,NULL,NULL,userimage/282_low.jpeg,userimage/282_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(283,1001,Panna cotta con fragole,1,NULL,500,0,Panna cotta con fragole,NULL,NULL,userimage/283_low.jpeg,userimage/283_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(284,1001,Panna cotta alla menta con cioccolato (After Eight),1,NULL,500,0,Panna cotta alla menta con cioccolato (After Eight),NULL,NULL,userimage/284_low.jpeg,userimage/284_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(285,1001,Crema catalana,1,NULL,460,1,Crema catalana,NULL,NULL,userimage/285_low.jpeg,userimage/285_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(286,1001,Tiramisu',1,,450,1,Tiramisu',NULL,NULL,userimage/286_low.jpeg,userimage/286_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(287,1001,Profiterol,1,NULL,450,0,Profiterol,NULL,NULL,userimage/287_low.jpeg,userimage/287_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(288,1001,Semifreddo al torroncino con panna montata e salsa cioccolato,1,NULL,500,1,Semifreddo al torroncino con panna montata e salsa cioccolato,NULL,NULL,userimage/288_low.jpeg,userimage/288_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(289,1001,Tartufo bianco,1,NULL,450,1,Tartufo bianco,NULL,NULL,userimage/289_low.jpeg,userimage/289_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(290,1001,Tartufo nero,0,NULL,450,0,Tartufo nero,NULL,NULL,userimage/290_low.jpeg,userimage/290_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(291,1001,Meringa,1,NULL,450,0,Meringa,NULL,NULL,userimage/291_low.jpeg,userimage/291_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(292,1001,Meringa con salsa cioccolato,1,NULL,500,0,Meringa con salsa cioccolato,NULL,NULL,userimage/292_low.jpeg,userimage/PNA_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(293,1001,Sorbetto al limone,1,NULL,300,1,Sorbetto al limone,NULL,NULL,userimage/293_low.jpeg,userimage/293_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(294,1001,Ananas fresco,1,NULL,400,0,Ananas fresco,NULL,NULL,userimage/294_low.jpeg,userimage/294_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(295,1001,Macedonia di frutta fresca,1,NULL,400,1,Macedonia di frutta fresca (indicare se con gelato o con panna nelle note. Costo aggiuntivo Euro1,00 ),NULL,NULL,userimage/295_low.jpeg,userimage/295_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(296,1001,Macedonia di frutta con gelato,1,NULL,500,0,Macedonia di frutta con gelato,NULL,NULL,userimage/296_low.jpeg,userimage/296_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(297,1001,Macedonia di frutta con panna montata,1,NULL,500,0,Macedonia di frutta con panna montata,NULL,NULL,userimage/297_low.jpeg,userimage/297_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(298,1001,Fragole,1,NULL,400,1,Fragole con limone e zucchero. (Indicare nelle note eventuale aggiunta di panna montata o gelato. Costo aggiuntivo Euro 1,00),NULL,NULL,userimage/298_low.jpeg,userimage/298_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(299,1001,Fragole con gelato,1,NULL,500,0,Fragole con gelato,NULL,NULL,userimage/299_low.jpeg,userimage/299_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(300,1001,Fragole con panna montata,1,NULL,500,0,Fragole con panna montata,NULL,NULL,userimage/300_low.jpeg,userimage/300_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(301,1001,Caffe' ,1,NULL,120,1,Caffe' normale,Italian Expresso,NULL,userimage/301_low.jpeg,userimage/301_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(302,1001,Caffe' doppio,1,NULL,240,0,Caffe' doppio,Double expresso,NULL,userimage/302_low.jpeg,userimage/302_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(303,1001,Caffe' Hag,1,NULL,140,1,Caffe' Hag,Decaffeinated coffee,NULL,userimage/303_low.jpeg,userimage/303_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(304,1001,Caffe' Americano,1,NULL,150,1,Caffe' Americano,American coffee,NULL,userimage/304_low.jpeg,userimage/304_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(305,1001,Caffe' d'orzo,1,NULL,150,0,Caffe' d'orzo,Barley coffee,NULL,userimage/305_low.jpeg,userimage/305_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(306,1001,Capuccino,1,NULL,140,1,Capuccino,Cappuccino,NULL,userimage/306_low.jpeg,userimage/306_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(307,1001,Caffe' lungo,1,NULL,120,0,Caffe' lungo,Long Expresso,NULL,userimage/307_low.jpeg,userimage/307_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(308,1001,Caffe' ristretto,1,NULL,120,0,Caffe' ristretto,Expresso short,NULL,userimage/308_low.jpeg,userimage/308_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(309,1001,Caffe' macchiato caldo,1,NULL,120,0,Caffe' macchiato caldo,Expresso with hot milk,NULL,userimage/309_low.jpeg,userimage/309_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(310,1001,Caffe' macchiato freddo,1,NULL,120,0,Caffe' macchiato freddo,Expresso with cold milk,NULL,userimage/310_low.jpeg,userimage/310_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(311,1001,Caffe' schiumato,1,NULL,120,0,Caffe' schiumato,Foamed expresso,NULL,userimage/311_low.jpeg,userimage/311_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(312,1001,Caffe' con gelato,1,NULL,170,1,Caffe' con gelato,Expresso with icecream,NULL,userimage/312_low.jpeg,userimage/312_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(313,1001,Caffe' con panna,1,NULL,180,1,Caffe' con panna,Expresso with whipped cream,NULL,userimage/313_low.jpeg,userimage/313_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(314,1001,Caffe' corretto,1,NULL,170,1,Caffe' corretto. Indicare la correzione nelle note: Brandy, Grappa, Anice, ecc. Indicare inoltre se si vuole la correzione in bicchiere a parte o direttamente nel caffe',Expresso with liquor added (to be specified in the note field),NULL,userimage/314_low.jpeg,userimage/314_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(315,1001,Caffe' corretto con brandy,1,NULL,170,0,Caffe' corretto con brandy,Expresso with Italian cognac,NULL,userimage/315_low.jpeg,userimage/315_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(316,1001,Caffe' corretto con cognac,1,NULL,230,0,Caffe' corretto con cognac,Expresso with French cognac,NULL,userimage/316_low.jpeg,userimage/316_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(317,1001,Caffe' corretto con crema whisky,1,NULL,170,0,Caffe' corretto con crema whisky,Expresso with whisky cream,NULL,userimage/317_low.jpeg,userimage/317_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(318,1001,Caffe' corretto con fernet menta,1,NULL,170,0,Caffe' corretto con fernet menta,Expresso with Italian liquor (mint flavour),NULL,userimage/318_low.jpeg,userimage/318_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(319,1001,Caffe' corretto con fernet,1,NULL,170,0,Caffe' corretto con fernet,Expresso with Italian liquor,NULL,userimage/319_low.jpeg,userimage/319_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(320,1001,Caffe' corretto con grappa,1,NULL,170,0,Caffe' corretto con grappa,Expresso with grappa,NULL,userimage/320_low.jpeg,userimage/320_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(321,1001,Caffe' corretto con rhum,1,NULL,170,0,Caffe' corretto con rhum,Expresso with rhum,NULL,userimage/321_low.jpeg,userimage/321_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(322,1001,Caffe' corretto con stravecchio,1,NULL,170,0,Caffe' corretto con stravecchio,Expresso with Italian cognac,NULL,userimage/322_low.jpeg,userimage/322_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(323,1001,Caffe' corretto con vecchia,1,NULL,170,0,Caffe' corretto con vecchia,Expresso with Italian cognac,NULL,userimage/323_low.jpeg,userimage/323_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(324,1001,Caffe' corretto con whishy,1,,170,0,,Expresso with whisky,NULL,userimage/324_low.jpeg,userimage/324_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(325,1001,Acqua minerale Pejo (Frizzante),2,Bottiglia di vetro da 75 cl.,250,0,L'Acqua Pejo Fonte Alpina sgorga a 1.393 Metri in una delle localita piu suggestive del Parco Nazionale dello Stelvio,Sparkling water. Pejo Fonte Alpina water flows 1.393 meters high in one of the most suggestive resort in the Stelvio National Park,NULL,image/no_image_low.jpeg,image/no_image_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(326,1001,Amaretto di Saronno,2,,250,0,,,NULL,userimage/326_low.jpeg,userimage/326_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(327,1001,Aperol,2,,250,1,,,NULL,userimage/327_low.jpeg,userimage/327_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(328,1001,Averna,2,Amaro,250,1,,,NULL,userimage/328_low.jpeg,userimage/328_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(329,1001,Amaro Baby,2,,220,0,,,NULL,userimage/329_low.jpeg,userimage/329_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(330,1001,Bargnolino,2,NULL,250,0,NULL,NULL,NULL,userimage/330_low.jpeg,userimage/330_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(331,1001,Braulio,2,Amaro,250,0,NULL,NULL,NULL,userimage/331_low.jpeg,userimage/331_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(332,1001,Camomillina,2,NULL,250,0,NULL,NULL,NULL,userimage/332_low.jpeg,userimage/332_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(333,1001,China Calda,2,,260,0,,,NULL,userimage/333_low.jpeg,userimage/333_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(334,1001,China Martini,2,,250,1,,,NULL,userimage/334_low.jpeg,userimage/334_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(335,1001,Cynar,2,Amaro,250,1,,,NULL,userimage/335_low.jpeg,userimage/335_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(336,1001,Fernet Branca,2,,250,1,,,NULL,userimage/336_low.jpeg,userimage/336_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(337,1001,Fragolino,2,,350,0,,,NULL,userimage/337_low.jpeg,userimage/337_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(338,1001,Jagermeister,2,Amaro ,250,1,,,NULL,userimage/338_low.jpeg,userimage/338_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(339,1001,Limoncino,2,,250,0,,,NULL,userimage/339_low.jpeg,userimage/339_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(340,1001,Lucano,2,Amaro ,250,0,,,NULL,userimage/340_low.jpeg,userimage/340_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(341,1001,Martini Bianco,2,,250,0,,,NULL,userimage/341_low.jpeg,userimage/341_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(342,1001,Martini Rosso,2,,250,0,,,NULL,userimage/342_low.jpeg,userimage/342_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(343,1001,Mirto,2,,250,0,,,NULL,userimage/343_low.jpeg,userimage/343_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(344,1001,Montenegro,2,Amaro ,250,1,,,NULL,userimage/344_low.jpeg,userimage/344_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(345,1001,Nocino,2,,250,0,,,NULL,userimage/345_low.jpeg,userimage/345_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(346,1001,Petrus,2,Amaro ,250,0,,,NULL,userimage/346_low.jpeg,userimage/346_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(347,1001,Ramazzotti,2,Amaro ,250,1,,,NULL,userimage/347_low.jpeg,userimage/347_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(348,1001,S.Marzano Borsci,2,Amaro ,250,0,,,NULL,userimage/348_low.jpeg,userimage/348_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(349,1001,Sambuca,2,,250,1,,,NULL,userimage/349_low.jpeg,userimage/349_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(350,1001,Unicum,2,Amaro ,250,0,,,NULL,userimage/350_low.jpeg,userimage/350_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(351,1001,Cointreau,2,,300,1,,,NULL,userimage/351_low.jpeg,userimage/351_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(352,1001,Gin,2,,300,0,,,NULL,userimage/352_low.jpeg,userimage/352_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(353,1001,Grand Marnier,2,,400,0,,,NULL,userimage/353_low.jpeg,userimage/353_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(354,1001,Porto,2,,300,1,,,NULL,userimage/354_low.jpeg,userimage/354_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(355,1001,Punch all'arancia,2,,300,0,,,NULL,userimage/355_low.jpeg,userimage/355_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(356,1001,Cardenal Mendoza,2,Brandy,500,0,,,NULL,userimage/356_low.jpeg,userimage/356_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(357,1001,Carlos I,2,Brandy,500,0,,,NULL,userimage/357_low.jpeg,userimage/357_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(358,1001,Courvasier,2,Cognac,500,0,,,NULL,userimage/358_low.jpeg,userimage/358_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(359,1001,Fundador,2,Brandy,500,1,,,NULL,userimage/359_low.jpeg,userimage/359_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(360,1001,Martell,2,Cognac,500,0,,,NULL,userimage/360_low.jpeg,userimage/360_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(361,1001,Remy Martin,2,Cognac,500,0,,,NULL,userimage/361_low.jpeg,userimage/361_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(362,1001,Stravecchio Branca,2,Brandy,250,1,,,NULL,userimage/362_low.jpeg,userimage/362_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(363,1001,Vecchia Romagna,2,Brandy,250,1,,,NULL,userimage/363_low.jpeg,userimage/363_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(364,1001,Macallan Invecchiato 12 Anni,2,Whisky,600,1,,,NULL,userimage/364_low.jpeg,userimage/364_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(365,1001,Whisky Baby 12 anni,2,Whisky,350,0,,,NULL,userimage/365_low.jpeg,userimage/365_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(366,1001,Whisky Baby,2,Whisky,250,0,,,NULL,userimage/366_low.jpeg,userimage/366_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(367,1001,Ballantines,2,Whisky,400,0,,,NULL,userimage/367_low.jpeg,userimage/367_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(368,1001,Chivas,2,Whisky,450,1,,,NULL,userimage/368_low.jpeg,userimage/368_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(369,1001,Crema di whisky,2,,300,0,,,NULL,userimage/369_low.jpeg,userimage/369_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(370,1001,Four Roses,2,Bourbon,400,0,,,NULL,userimage/370_low.jpeg,userimage/370_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(371,1001,Glen Grant,2,Whisky,400,1,,,NULL,userimage/371_low.jpeg,userimage/371_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(372,1001,Glen Livet,2,Whisky,650,1,,,NULL,userimage/372_low.jpeg,userimage/372_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(373,1001,J&B,2,Whisky,350,1,,,NULL,userimage/373_low.jpeg,userimage/373_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(374,1001,Jack Daniel's,2,Whisky,450,1,,,NULL,userimage/374_low.jpeg,userimage/374_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(375,1001,Laphroaig,2,Whisky,650,1,,,NULL,userimage/375_low.jpeg,userimage/375_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(376,1001,Lagavulin,2,Whisky,600,1,,,NULL,userimage/376_low.jpeg,userimage/376_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(377,1001,Grappa Champagne,2,,450,0,,,NULL,userimage/377_low.jpeg,userimage/377_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(378,1001,Grappa Moscato,2,,300,1,,,NULL,userimage/378_low.jpeg,userimage/378_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(379,1001,Grappa Prime Uve,2,,450,0,,,NULL,userimage/379_low.jpeg,userimage/379_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(380,1001,Grappa Prosecco,2,,450,0,,,NULL,userimage/380_low.jpeg,userimage/380_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(381,1001,Grappa Ramandolo,2,,300,0,,,NULL,userimage/381_low.jpeg,userimage/381_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(382,1001,Grappa secca,2,,300,0,,,NULL,userimage/382_low.jpeg,userimage/382_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(383,1001,Grappa Williams,2,,450,0,,,NULL,userimage/383_low.jpeg,userimage/383_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(384,1001,Grappa Barricata,2,,450,0,,,NULL,userimage/384_low.jpeg,userimage/384_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(385,1001,Rhum Zacapa,2,,700,1,,,NULL,userimage/385_low.jpeg,userimage/385_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(386,1001,Rhum Anniversario,2,,600,0,,,NULL,userimage/386_low.jpeg,userimage/386_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(387,1001,Rhum Havana,2,,350,0,,,NULL,userimage/387_low.jpeg,userimage/387_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(388,1001,Rhum Pampero,2,,350,1,,,NULL,userimage/388_low.jpeg,userimage/388_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(389,1001,Vodka,2,,250,0,,,NULL,userimage/389_low.jpeg,userimage/389_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(390,1001,Vodka lemon,2,,250,0,,,NULL,userimage/390_low.jpeg,userimage/390_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(391,1001,Vodka alla pesca,2,,250,0,,,NULL,userimage/391_low.jpeg,userimage/391_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(393,1001,Nome tiramisu',1,,1000,0,descrizione lunga lunga lunga tiramisu',long long long long tiramisu' description,NULL,userimage/upload/20130414203718_low.jpeg,userimage/upload/20130414203718_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(394,1001,pippo,0,pippopoppo,1,1,NULL,NULL,NULL,image/no_image_low.jpeg,image/no_image_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(395,1001,2,0,NULL,1,1,NULL,NULL,NULL,image/no_image_low.jpeg,image/no_image_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(396,1001,2,0,NULL,1,1,NULL,NULL,NULL,image/no_image_low.jpeg,image/no_image_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(397,1001,1,0,descrizione breve,1150,1,descrizione lungaa,descrizione fatti i fatti toi,pippo,userimage/upload/1001_20131107001536_low.jpeg,userimage/upload/1001_20131107001536_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(398,1001,Prova1,0,sddfsdf,1,1,sddfsdf,cambi la descrizione,1,userimage/upload/20130416013452_low.jpeg,userimage/upload/20130416013452_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(399,1001,Prova nuovo prodotto,0,descrizione breve ,700,1,descrizione lunga,english description,descrizione per stampa,userimage/upload/20130416013751_low.jpeg,userimage/upload/20130416013751_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(400,1001,Birra alla spina piccola Kilkenny,2,NULL,350,1,Birra rossa alla spina,NULL,NULL,userimage/birra_low.jpeg,userimage/birra_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(401,1001,Birra alla spina media Kilkenny,2,NULL,500,1,Birra rossa alla spina,NULL,NULL,userimage/birra_low.jpeg,userimage/birra_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(402,1001,Bonarda dolce,2,Azienda agricola Montesissa Emilia Romagna,0,1,Compreso nel menu del giorno,NULL,NULL,userimage/30_low.jpeg,userimage/30_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(404,1002,All'Incontro,1,NULL,800,0,All'Incontro,NULL,NULL,userimage/207_low.jpeg,userimage/207_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(405,1002,Margherita,1,NULL,600,1,Margherita,NULL,NULL,userimage/208_low.jpeg,userimage/208_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(406,1002,Napoletana,1,NULL,700,1,Napoletana,NULL,NULL,userimage/209_low.jpeg,userimage/209_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(407,1002,Culatello,1,NULL,1000,0,Culatello,NULL,NULL,userimage/210_low.jpeg,userimage/210_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(408,1002,Culatello e porcini,1,NULL,1300,0,Culatello e porcini,NULL,NULL,userimage/211_low.jpeg,userimage/211_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(409,1002,Culatello e gongorzola,1,NULL,1100,0,Culatello e gongorzola,NULL,NULL,userimage/212_low.jpeg,userimage/212_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(410,1002,Prosciutto crudo,1,NULL,800,1,Prosciutto crudo,NULL,NULL,userimage/213_low.jpeg,userimage/213_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(411,1002,Prosciutto crudo, rucola e grana,1,NULL,950,1,Prosciutto crudo, rucola e grana,NULL,NULL,userimage/214_low.jpeg,userimage/214_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(412,1002,Prosciutto crudo e funghi champignon,1,NULL,900,0,Prosciutto crudo e funghi champignon,NULL,NULL,userimage/215_low.jpeg,userimage/215_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(413,1002,Prosciutto crudo e funghi porcini,1,NULL,1150,1,Prosciutto crudo e funghi porcini,NULL,NULL,userimage/216_low.jpeg,userimage/216_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(414,1002,Prosciutto crudo porcini e grana,1,NULL,1250,0,Prosciutto crudo porcini e grana,NULL,NULL,userimage/217_low.jpeg,userimage/217_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(415,1002,Prosciutto crudo e funghi chiodini,1,NULL,900,0,Prosciutto crudo e funghi chiodini,NULL,NULL,userimage/218_low.jpeg,userimage/218_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(416,1002,Prosciutto crudo e gongorzola,1,NULL,900,0,Prosciutto crudo e gongorzola,NULL,NULL,userimage/219_low.jpeg,userimage/219_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(417,1002,Prosciutto di Praga,1,NULL,800,0,Prosciutto di Praga,NULL,NULL,userimage/220_low.jpeg,userimage/220_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(418,1002,Prosciutto cotto,1,prosciutto cotto,780,0,Prosciutto cotto,NULL,NULL,userimage/upload/20130416005748_low.jpeg,userimage/upload/20130416005748_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(419,1002,Prosciutto cotto e funghi champignon,1,NULL,850,0,Prosciutto cotto e funghi champignon,NULL,NULL,userimage/222_low.jpeg,userimage/222_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(420,1002,Prosciutto cotto e funghi porcini,1,NULL,1000,0,Prosciutto cotto e funghi porcini,NULL,NULL,userimage/223_low.jpeg,userimage/223_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(421,1002,Prosciutto cotto e funghi,1,NULL,850,0,Prosciutto cotto e funghi,NULL,NULL,userimage/224_low.jpeg,userimage/224_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(422,1002,Prosciutto cotto e carciofi,1,NULL,850,0,Prosciutto cotto e carciofi,NULL,NULL,userimage/225_low.jpeg,userimage/225_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(423,1002,Prosciutto cotto e melanzane,1,NULL,850,0,Prosciutto cotto e melanzane,NULL,NULL,userimage/226_low.jpeg,userimage/226_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(424,1002,prosciutto cotto e gongorzola,1,NULL,850,0,prosciutto cotto e gongorzola,NULL,NULL,userimage/227_low.jpeg,userimage/227_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(425,1002,Contadina (pomodorini e rucola),1,NULL,700,0,Contadina (pomodorini e rucola),NULL,NULL,userimage/228_low.jpeg,userimage/228_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(426,1002,Cenerentola (rucola e stracchino),1,NULL,750,0,Cenerentola (rucola e stracchino),NULL,NULL,userimage/229_low.jpeg,userimage/229_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(427,1002,Ortolana (verdure cotte a vapore),1,NULL,750,1,Ortolana (verdure cotte a vapore),NULL,NULL,userimage/230_low.jpeg,userimage/230_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(428,1002,Frutti di mare,1,NULL,1000,1,Frutti di mare,NULL,NULL,userimage/231_low.jpeg,userimage/231_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(429,1002,Philadelphia rucola e crudo,1,NULL,900,0,Philadelphia rucola e crudo,NULL,NULL,userimage/232_low.jpeg,userimage/232_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(430,1002,Rucola pomodoro e tonno,1,NULL,800,0,Rucola pomodoro e tonno,NULL,NULL,userimage/233_low.jpeg,userimage/233_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(431,1002,Salmone,1,NULL,900,0,Salmone,NULL,NULL,userimage/234_low.jpeg,userimage/234_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(432,1002,Salmone rucola e pomodorini,1,NULL,950,0,Salmone rucola e pomodorini,NULL,NULL,userimage/235_low.jpeg,userimage/235_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(433,1002,Bufala (La mozzarella viene aggiunta a freddo al termine della cottura),1,NULL,800,0,Bufala (La mozzarella viene aggiunta a freddo al termine della cottura),NULL,NULL,userimage/236_low.jpeg,userimage/236_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(434,1002,Bufalina (bufala rucola e pomodorini) (La mozzarella viene aggiunta a freddo al termine della cottur,1,Bufalina (bufala rucola e pomodorini) (La mozzarella viene aggiunta a freddo al termine della cottura),850,0,Bufalina (bufala rucola e pomodorini) (La mozzarella viene aggiunta a freddo al termine della cottura),NULL,NULL,userimage/237_low.jpeg,userimage/237_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(435,1002,Speck,1,NULL,750,0,Speck,NULL,NULL,userimage/238_low.jpeg,userimage/238_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(436,1002,Speck e brie,1,NULL,850,1,Speck e brie,NULL,NULL,userimage/239_low.jpeg,userimage/239_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(437,1002,Speck e gongorzola,1,NULL,850,0,Speck e gongorzola,NULL,NULL,userimage/240_low.jpeg,userimage/240_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(438,1002,Ilaria (speck e mascarpone),1,NULL,850,0,Ilaria (speck e mascarpone),NULL,NULL,userimage/241_low.jpeg,userimage/241_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(439,1002,Della chef (radicchio scamorza e pancetta),1,NULL,850,0,Della chef (radicchio scamorza e pancetta),NULL,NULL,userimage/242_low.jpeg,userimage/242_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(440,1002,Bomba (salsiccia, cipolla e gongorzola),1,NULL,800,0,Bomba (salsiccia, cipolla e gongorzola),NULL,NULL,userimage/243_low.jpeg,userimage/243_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(441,1002,Gongorzola,1,NULL,750,0,Gongorzola,NULL,NULL,userimage/244_low.jpeg,userimage/244_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(442,1002,Gongorzola e cipolla,1,NULL,750,0,Gongorzola e cipolla,NULL,NULL,userimage/245_low.jpeg,userimage/245_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(443,1002,4 formaggi (gongorzola, stracchino, mozzarella, grana),1,NULL,800,0,4 formaggi (gongorzola, stracchino, mozzarella, grana),NULL,NULL,userimage/246_low.jpeg,image/no_image_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(444,1002,1995 (rucola, gamberetti in salsa rosa),1,NULL,1000,0,1995 (rucola, gamberetti in salsa rosa),NULL,NULL,userimage/247_low.jpeg,userimage/247_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(445,1002,Lardo di colonnata,1,NULL,700,0,Lardo di colonnata,NULL,NULL,userimage/248_low.jpeg,userimage/248_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(446,1002,Salsiccia,1,NULL,700,0,Salsiccia,NULL,NULL,userimage/249_low.jpeg,userimage/249_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(447,1002,Salsiccia e patatine fritte,1,NULL,800,0,Salsiccia e patatine fritte,NULL,NULL,userimage/250_low.jpeg,userimage/250_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(448,1002,Patatine fritte,1,NULL,750,0,Patatine fritte,NULL,NULL,userimage/251_low.jpeg,userimage/251_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(449,1002,Wurstel,1,NULL,650,0,Wurstel,NULL,NULL,userimage/252_low.jpeg,userimage/252_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(450,1002,Wurstel e patatine,1,NULL,800,0,Wurstel e patatine,NULL,NULL,userimage/253_low.jpeg,userimage/253_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(451,1002,Salamino piccante,1,NULL,750,0,Salamino piccante,NULL,NULL,userimage/254_low.jpeg,userimage/254_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(452,1002,Acciughe e salame piccante,1,NULL,850,0,Acciughe e salame piccante,acciughe,NULL,userimage/upload/20130416005625_low.jpeg,userimage/upload/20130416005625_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(453,1002,Acciughe piccanti ''Rizzoli'',1,NULL,900,1,Acciughe piccanti ''Rizzoli'',NULL,NULL,userimage/256_low.jpeg,userimage/256_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(454,1002,Rustica (prosciutto cotto, funghi, carciofi),1,NULL,950,0,Rustica (prosciutto cotto, funghi, carciofi),NULL,NULL,userimage/257_low.jpeg,userimage/257_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(455,1002,Valtellina (bresaola, pecorino, rucola),1,NULL,850,0,Valtellina (bresaola, pecorino, rucola),NULL,NULL,userimage/258_low.jpeg,userimage/258_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(456,1002,Marinara (senza mozzarella con aglio e prezzemolo),1,NULL,550,0,Marinara (senza mozzarella con aglio e prezzemolo),NULL,NULL,userimage/259_low.jpeg,userimage/259_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(457,1002,Tonno e cipolla,1,NULL,750,1,Tonno e cipolla,NULL,NULL,userimage/260_low.jpeg,userimage/260_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(458,1002,Boscaiola (Misto funghi),1,NULL,850,0,Boscaiola (Misto funghi),NULL,NULL,userimage/261_low.jpeg,userimage/261_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(459,1002,Farcita (Prosciutto cotto, funghi, carciofi),1,NULL,800,1,Farcita (Prosciutto cotto, funghi, carciofi),NULL,NULL,userimage/262_low.jpeg,userimage/262_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(460,1002,Rucola prorcini e scaglie di grana,1,NULL,950,0,Rucola prorcini e scaglie di grana,NULL,NULL,userimage/263_low.jpeg,userimage/263_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(461,1002,Corolle di carciofo,1,NULL,800,0,Corolle di carciofo,NULL,NULL,userimage/264_low.jpeg,userimage/264_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(462,1002,Funghi porcini,1,NULL,900,0,Funghi porcini,NULL,NULL,userimage/265_low.jpeg,userimage/265_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(463,1002,Funghi champignon,1,NULL,700,0,Funghi champignon,NULL,NULL,userimage/266_low.jpeg,userimage/266_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(464,1002,Culatello, alici Rizzoli, salsa tartufo, porcini,1,NULL,300,1,Culatello, alici Rizzoli, salsa tartufo, porcini,NULL,NULL,userimage/267_low.jpeg,userimage/267_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(465,1002,Prosciutto cotto, Prosciutto crudo, lardo, speck, gamberetti, salmone, scamorza, mascarpone,1,NULL,200,0,Prosciutto cotto, Prosciutto crudo, lardo, speck, gamberetti, salmone, scamorza, mascarpone,NULL,NULL,userimage/268_low.jpeg,userimage/268_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(466,1002,Acciughe, asparagi, carciofi, champignon, chiodini, funghi, grana, gongorzola,1,NULL,200,0,Acciughe, asparagi, carciofi, champignon, chiodini, funghi, grana, gongorzola,NULL,NULL,userimage/269_low.jpeg,userimage/269_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(467,1002,Peperoni, melanzane, zucchine, brie, salsiccia, salame piccante, stracchino, tonno, philadelphia,1,NULL,200,0,Peperoni, melanzane, zucchine, brie, salsiccia, salame piccante, stracchino, tonno, philadelphia,NULL,NULL,userimage/270_low.jpeg,userimage/270_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(468,1002,Aglio, capperi, olive, pomodorini, wurstel, cipolla,1,NULL,100,0,Aglio, capperi, olive, pomodorini, wurstel, cipolla,NULL,NULL,userimage/upload/20130416220650_low.jpeg,userimage/upload/20130416220650_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(469,1002,Coca Cola in bottiglia di vetro,2,150 cl.,700,0,Coca Cola nella tradizionale bottiglia Contour che l'ha resa celeberrima,Coke in the traditional Contour the glass bottle which made it famous all over the world,NULL,userimage/69_low.jpeg,userimage/69_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(470,1002,Acqua minerale,2,Bottiglia di vetro da 75 cl.,250,1,L'Acqua Pejo Fonte Alpina sgorga a 1.393 Metri in una delle localita' piu' suggestive del Parco Nazionale dello Stelvio,Natural water. Pejo Fonte Alpina water flows 1.393 meters high in one of the most suggestive resort in the Stelvio National Park,NULL,userimage/acqua_low.jpg,userimage/acqua_high.jpg,0,1,20,1);
INSERT INTO menurows VALUES(471,1002,Coca Cola in lattina,2,33 cl.,300,1,,Coke can,NULL,userimage/74_low.jpeg,userimage/74_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(472,1002,Coca Cola Light,2,Lattina slim da 33 cl.,300,1,,Diet Coke in slim can,NULL,userimage/75_low.jpeg,userimage/75_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(473,1002,Coca Cola Zero,2,NULL,300,1,description,NULL,NULL,userimage/76_low.jpeg,userimage/76_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(474,1002,Chino',2,NULL,300,1,Chino',NULL,NULL,userimage/77_low.jpeg,userimage/77_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(475,1002,Fanta in lattina slim,2,NULL,300,1,description,NULL,NULL,userimage/78_low.jpeg,userimage/78_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(476,1002,Lemonsoda,2,NULL,300,1,description,NULL,NULL,userimage/79_low.jpeg,userimage/79_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(477,1002,Aranciata S.Pellegrino Amara,2,NULL,300,1,description,NULL,NULL,userimage/80_low.jpeg,userimage/80_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(478,1002,Shweppes in lattina,2,NULL,300,1,description,NULL,NULL,userimage/81_low.jpeg,userimage/81_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(479,1002,The al limone San Bebedetto in lattina,2,NULL,300,0,description,NULL,NULL,userimage/82_low.jpeg,userimage/82_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(480,1002,The alla pesca San Bebedetto in lattina,2,NULL,300,0,description,NULL,NULL,userimage/83_low.jpeg,userimage/83_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(481,1002,Sprite in lattina slim,2,NULL,300,1,description,NULL,NULL,userimage/84_low.jpeg,userimage/84_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(511,1002,Stria chiara - alla spina,2,NULL,400,0,description,NULL,NULL,userimage/52_low.jpeg,userimage/52_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(512,1002,Re Hop,2,Chiara beverina,1200,1,Chiara beverina,NULL,NULL,userimage/53_low.jpeg,userimage/53_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(513,1002,Re Hop Magnum,2,NULL,2200,0,description,NULL,NULL,userimage/54_low.jpeg,userimage/54_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(514,1002,Jadis,2,Ambrata,1200,1,Ambrata,NULL,NULL,userimage/55_low.jpeg,userimage/55_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(515,1002,Ambrosia,2,Bianca di frumento,1200,0,Bianca di frumento,NULL,NULL,userimage/57_low.jpeg,userimage/57_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(516,1002,Skizoid,2,Rossa tipo England,1200,1,Rossa tipo England,NULL,NULL,userimage/58_low.jpeg,userimage/58_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(517,1002,Stray Dog,2,Ambrata,1200,0,Ambrata,NULL,NULL,userimage/59_low.jpeg,userimage/59_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(518,1002,Via Emilia,2,Chiara,1200,1,Chiara,NULL,NULL,userimage/60_low.jpeg,userimage/60_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(519,1002,New Morning,2,ambrata,1200,1,ambrata,NULL,NULL,userimage/61_low.jpeg,userimage/61_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(520,1002,A.F.O. ale for obsessedd,2,color ramato,1200,0,color ramato,NULL,NULL,userimage/62_low.jpeg,userimage/62_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(521,1002,Winterlude,2,Dorato intenso,1200,1,Dorato intenso,NULL,NULL,userimage/63_low.jpeg,userimage/63_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(522,1002,Birra Weiss Franziskaner,2,NULL,500,1,description,NULL,NULL,userimage/64_low.jpeg,userimage/64_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(523,1002,Birra Heineken lattina,2,NULL,350,1,description,NULL,NULL,userimage/67_low.jpeg,userimage/67_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(524,1002,Birra analcolica boccetto,2,NULL,350,0,description,NULL,NULL,userimage/68_low.jpeg,userimage/PNA_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(525,1002,Birra in bottiglia Beck's,2,NULL,300,1,description,NULL,NULL,userimage/85_low.jpeg,userimage/85_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(526,1002,Birra in bottiglia Tourtel,2,NULL,300,0,description,NULL,NULL,userimage/upload/20130416013219_low.jpeg,userimage/upload/20130416013219_high.jpeg,0,1,20,1);
INSERT INTO menurows VALUES(530,1001,prova1,2,prova1,1000,1,prova1,prova1,prova1,userimage/upload/20130416004809_low.jpeg,userimage/upload/20130416004809_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(531,1004,promo prodotto,2,promo prodotto,3000,1,promo prodotto,promo prodotto,NULL,image/no_image_low.jpeg,image/no_image_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(532,1001,aaaaaa,2,aaa,500,1,aaa,aaa,aaa,userimage/upload/20130615223354_low.jpeg,userimage/upload/20130615223354_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(533,1001,1111,2,lwdfkmsf,500,1,dfgdsfg,dfgdsfg,prova,userimage/upload/20130615223646_low.jpeg,userimage/upload/20130615223646_high.jpeg,1,1,20,1);
INSERT INTO menurows VALUES(534,1001,111,2,NULL,111,1,NULL,NULL,111,image/no_image_low.jpeg,image/no_image_high.jpeg,1,6,70,2);
INSERT INTO menurows VALUES(535,1100,Birra alla spina piccola,NULL,Birra alla spina da 0.3 cl,300,1,NULL,NULL,NULL,userimage/upload/1100_20170214233413_low.jpeg,userimage/upload/1100_20170214233413_high.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(536,1100,Birra alla spina media,NULL,Birra alla spina 0,4 cl,400,1,NULL,NULL,NULL,userimage/upload/1100_20170214233747_low.jpeg,userimage/upload/1100_20170214233747_high.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(600,1011,Champagne Brut Grand Cru Blanc de Blancs,NULL,Mallol-Gantois Cramant,5000,1,Prodotto con uve Chardonnay raccolte con vendemmia manuale e selezione delle uve. Molto gradevole in bocca con aromi intensi,NULL,NULL,userimage/bollicine.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(601,1011,Champagne Brut Selection Brut Pinot Noir,NULL,Casters Louis,5000,1,Champagne di color paglierino vivace e brillante, con leggera sfumatura ramata, cremoso con bollicine finissime. Al naso senti tracce di prodotti da forno e nocciole. Al palato è cremoso e vellutato.,NULL,NULL,userimage/bollicine.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(602,1011,Champagne Nature Premier Cru Cuvèe,NULL,Desruets Joseph Hautvillers,6000,1,E’ una miscela di Pinot Nero,Chardonnay e Pinot Meunier, con un invecchiamento minimo di 48 mesi sui lieviti.dal colore oro pallido, questo champagne si presenta con aromi di frutta matura al naso, in bocca si trovano sensazioni di albicocche, pesche.,NULL,NULL,userimage/bollicine.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(603,1011,Prosecco di Valdobbiadene Extra Dry (Veneto),NULL,Rebuli,1800,1,Lo spumante Extra-Dry metodo charmat tenuamente e tipicamente aromatico.,NULL,NULL,userimage/bollicine.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(604,1011,Franciacorta Brut (Lombardia),NULL,La Fioca,2500,1,Una vendemmia piuttosto anticipata permette di ottenere un prodotto di giusta gradazione ed acidità, preservandone al massimo i profumi floreali e fruttati. Accarezza il palato con fini e persistenti bollicine,che esaltano l’elegante struttura, terminando con un intrigante retrogusto.,NULL,NULL,userimage/bollicine.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(605,1011,Franciacorta Saten Brut (Lombardia),NULL,La Fioca,3000,1,Un leggero suono di bollicine, che risalgono la sommità del bicchiere e sprigionano un sensuale bouchet di profumi. Morbidamente accarezzano il palato e scivolano via regalando estasianti sensazioni di piacere.Chardonnay in purezza che,dopo essere stato accuratamente selezionato, regala un Franciacorta di rara finezza.,NULL,NULL,userimage/bollicine.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(606,1011,Franciacorta Rosè Brut (Lombardia),NULL,La Fioca,3000,1,Unisce alla piacevolezza,dolcezza e cremosità del gusto la delicatezza del colore ed eleganti profumi. Da provare con formaggi di media stagionatura e culatello.,NULL,NULL,userimage/bollicine.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(607,1011,Cuvèe Leonora Alta Langa Rosè (Piemonte),NULL,Cascina Bretta Rossa,2500,1,Rosato rubino intenso, con un profumo fruttato, accattivante  che richiama la ciliegia e la mora, tipiche del Dolcetto, ma anche intense note agrumate e floreali. Il suo gusto è morbido, moderatamente acidulo, lievemente minerale, accompagnato da un perlage fine e persistente.,NULL,NULL,userimage/bollicine.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(608,1011,Cuvèe Leonora Alta Langa (Piemonte),NULL,Cascina Bretta Rossa,2500,1,E’una nuova DOCG Piemontese da uve Pinot e Chardonnay. Il prodotto della vendemmia corrente è addizionato di un 10% del cuvèe della vendemmia precedente, invecchiata in botti di rovere. Il risultato è uno spumante con almeno 30 mesi di invecchiamento sui lieviti, rotondo e ricco.,NULL,NULL,userimage/bollicine.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(609,1011,Trento Brut Monfort (Trentino),NULL,Casata Monfort,2500,1,Prodotto con uve Chardonnay provenienti dalle colline di Trento e Pergine Valsugana. Spumante dal profumo intenso e fruttato.,NULL,NULL,userimage/bollicine.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(610,1011,Ribolla gialla Brut M.M (Friuli Venezia Giulia),NULL,Komjanc Simon,2000,1,Prodotto con sole uve “Ribolla Gialla” provenienti da vigneti di proprietà. Vendemmia manuale in cassetta con selezione in vigna. Spumante inserito nel progetto “Bollicine da uve italiane”,NULL,NULL,userimage/bollicine.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(611,1011,Brachetto spumante Bel Roseto (Piemonte),NULL,Cascina Fonda,2000,1,Brachetto spumante Bel Roseto (Piemonte),NULL,NULL,userimage/bollicine.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(612,1011,Freisa d’Asti Luna di maggio frizzante (Piemonte),NULL,Cascina Gilli,1800,1,Freisa d’Asti Luna di maggio frizzante (Piemonte),NULL,NULL,userimage/bollicine.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(613,1011,Moscato d’Asti Chiara Blanc (Piemonte),NULL,Cascina Fonda,1500,1,Moscato d’Asti Chiara Blanc (Piemonte),NULL,NULL,userimage/bollicine.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(614,1011,Sablettes Sauternes 2008,NULL,Calice €6,00,2000,1,Dal colore giallo carico dorato e brillante, ha un profumo ampio, intenso, persistente con netti sentori di miele,acacia e confettura come albicocca e arance. In bocca è morbido, di grande struttura, armonico e mieloso e di razza nobile.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(615,1011,Vin Santo del Chianti lt. 0,500,NULL,Gualandi - Calice €6,00,3500,1,Prodotto daa un’attenta selezione dei migliori grappoli, fatti appassire ed invecchiati in carati per almeno tre anni.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(616,1011,Recioto della Valpolicella,NULL,Brigaldara - Calice €6,00,3000,1,Recioto della Valpolicella,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(617,1011,Silva Reis Porto,NULL,Tawny - Calice €5,00,2500,1,Silva Reis Porto,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(618,1011,Zibibbo,NULL,Angileri - Calice €4,00,2000,1,Vino liquoroso dolce, di colore dorato, aroma delicato e fine, sapore morbido e aromatico.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(619,1011,Passito di Sicilia lt. 0,500,NULL,Colosi - Calice €5,00,2000,1,Passito di Sicilia lt. 0,500,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(620,1011,Gewurztraminer Valle d’Isarco 2018 (Alto Adige),NULL,Petruskellerei,2000,1,Vino bianco caratteristico, elegante ed aromatico, dal profumo pieno. Col tempo il colore giallo paglierino, dorato, si carica ed il profumo originale si affina accentuando il bouchet.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(621,1011,Chardonnay 2017 (Alto Adige),NULL,Rottensteiner,1800,1,La mineralità sapida, le asprezze e gli aromi che si intrecciano. Uno chardonnay di montagna espressivo e distinto.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(622,1011,Pinot Grigio 2017 (Alto Adige),NULL,Griesbauerhof,2000,1,Da un’azienda spigliata ma rispettosa della tradizione,un’interpretazione di Pinot Grigio convincente e meditata. Ci sono un sacco di agrumi e note floreali quando si solleva il bicchiere.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(623,1011,Sauvignon Vallagarina 2018(Trentino),NULL,La Cadalora,2000,1,Colore giallo paglierino con riflessi verdognoli. Profumo molto aromatico, delicato, ricorda il peperone giallo, la pesca, il pompelmo, il melone, la salvia. Sapore elegante e vellutato con grande corposità.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(624,1011,Riesling Renano 2016 (Trentino),NULL,Pelz,2000,1,Colore giallo paglierino, profumo tipico, aromatico con sapore secco, sapido, lievemente amarognolo.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(625,1011,Friulano 2018 (FriuliVenezia-Giulia),NULL,Korsic,2000,1,Giallo paglierino con riflessi verdognoli. Fine e delicato, tipico sapore di mandorla amara, rotondo, con tenore di acidità leggermente inferiore agli altri vini.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(626,1011,Ribolla Gialla Collio 2017 (FriuliVenezia-Giulia),NULL,Draga,2000,1,Di colore giallo paglierino, il bouchet è piacevole e suadente, le note gustative ricordano profumi di fiori di prato e vaniglia.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(627,1011,Soave classico Battistelle 2018 (Veneto),NULL,Le Battistelle,1800,1,Vino ottenuto dalla vinificazione in bianco di solo uva Garganega. Di colore giallo paglierino piuttosto carico, al profumo è minerale, un po’ sulfureo, con sentori di fiori bianchi, frutta a polpa bianca ed erbe aromatiche. Al gusto si presenta fresco, armonico, con buona sapidità e mineralità, struttura e persistenza.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(628,1011,Vermentino 2018 Riviera Ligure di Ponente (Liguria),NULL,Sancio,2200,1,Nasce da un vitigno che non tollera il freddo, cresce nei climi temperati delle coste mediterranee. Le escursioni termiche, la ventilazione, l’odore del mare, gli conferiscono dei delicati profumi di agreste, il colore è dorato con riflessi verdi, il gusto è morbido e carezzevole.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(629,1011,Verdicchio Castelli di Jesi 2018 (Marche),NULL,Staffa,2000,1,Di colore giallo paglierino tenue. Dal sapore asciutto, armonico, con retrogusto gradevolmente amarognolo.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(630,1011,Rose di settembre 2018 (Marche),NULL,Giusti,1500,1,La cantina Giusti è stata una delle poche ad aver tentato di vinificare il vitigno Lacrima di Moro d’Alba nella versione rosato. Vino di profonda impronta floreale,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(631,1011,Greco di Tufo 2015 (Campania),NULL,Ferrara,2000,1,La vinificazione avviene utilizzando solo uve autoprodotte e con metodi trazionali. Dal colore giallo paglierino sbiadito, ha un profumo intenso ed un gusto asciutto e acidulo, con un sottile sentore mandorlato amarognolo.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(632,1011,Fiano di Avellino 2015 (Campania),NULL,Vadiaperti,2000,1,Aperto e complesso con delle eleganti note floreali. Mano a mano che si alza la temperatura i toni si fanno quelli del fiano, quelli di nocciola tostata e di leggero fumè. Al gusto c’è il giusto equilibrio tra la morbidezza del frutto e la freschezza acida.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(633,1011,Falanghina 2018 (Campania),NULL,Vadiaperti,2000,1,Ha un colore paglierino dorato con accesi riflessi verdognoli. Di buona intensità aromatica, ha spiccate note di mela verde, ananas e bergamotto. Il gusto è secco e morbido.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(634,1011,Vermentino Villa Solais 2018 (Sardegna),NULL,Santadi,1500,1,La caratteristica principale di questo vino è rappresentata dai suoi evidenti aromi e sapori di mandorla. Nota la sua finezza, in quanto proviene dai terreni di origine granitica tipici della Gallura.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(635,1011,Chardonnay Daliah 2015 (Sicilia),NULL,Feudo Disisa,2000,1,Colore giallo oro. Profumi intensi di miele con note di agrumi. Gusto avvolgente con grande persistenza.,NULL,NULL,userimage/vini_dessert.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(636,1011,Chinon les Terrasses 2017 Val de Loire (Francia),NULL,Lambert,2500,1,Delizioso vino con toni di frutti rossi, ciliegie rosse, erbe ed un tocco di motivi floreali. Senza aggiunta di zolfo, si presenta ben equilibrato.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(637,1011,Bordeaux Alios de Sainte Marie 2016 (Francia),NULL,Chateau Sainte-Marie,2500,1,Tipica espressione dei vini di Bordeaux, minerale, speziato e con tannini presenti, ma assai piacevole con note di frutta e vaniglia.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(638,1011,Torrette 2015 (Val d’Aosta),NULL,La Source Saint-Pierre ,2200,1,Vino rosso armonico e strutturato che si caratterizza per la notevole persistenza e la complessità aromatica. Prodotto da un vitigno autoctono che trova sempre più spazio nei vigneti della valle.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(639,1011,Blauburgunder Pinot Nero 2017  (Alto Adige),NULL,Petruskellerei,2200,1,Caratterizzato da terreno porfire e dal clima particalmente favorevole.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(640,1011,Cabernet Riserva 2016 (Alto Adige),NULL,Rottensteiner,2200,1,Rosso granato profondo. Al naso si esprime su note di piccoli frutti rossi, prugna. In bocca è pieno e intenso, mediamente fresco, con una nota calorica decisa ma ben supportata dai tannini morbidi. E’ un vino deciso che ben si abbina ai piatti importanti e saporiti.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(641,1011,Lagrein Riserva 2017 (Alto Adige),NULL,Rottensteiner,2200,1,L’esperienza, molto intuito e le uniche particolarità microclimatiche dei rinomati vigneti, conferiscono a questo vino una personalità inconfondibile.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(642,1011,Trentino Marzemino 2018 (Trentino),NULL,Battistotti,1500,1,Tipico vino della valle dal colore rosso rubino,dal profumo delicato e intenso, gradevole ed armonico con la caratteristica nota di viola mammola. Ha un gusto sapido e pieno di eleganza e gentilezza.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(643,1011,Teroldego Rotaliano 2017 (Trentino),NULL,Casata Monfort,2200,1,Ottenuto dall’omonimo vitigno e vinificato in piccoli serbatoi d’accaio dopo una lunga macerazione, è affinato per un anno in barriques e un ulteriore altro anno in grandi botti di rovere. Dopo l’imbottigliamento riposa 12 mesi in bottiglia per raggiungere il gusto di piacevolezza. Di colore rosso rubino intenso, con spiccati sentori di piccoli frutti, vaniglia, resina e spezie. Il sapore deciso denota in corpo pieno, caldo e piacevolmente tannico.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(644,1011,Nebbiolo Langhe 2016 (Piemonte),NULL,Cascina Morassino,2500,1,Tipico prodotto della Langa, ha sapore secco, vellutato con profumo tenue e delicato, con sentori di viola e frutta rossa.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(645,1011,Barbaresco 2015 (Piemonte),NULL,Castello di Verduno,4500,1,E’ l’espressione più convincente della tradizione condivisa del Nebbiolo in questa grande parte di Langa. Il loro Barbaresco riesce a condividere freschezza, eleganza e grande rigore formale.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(646,1011,“Tajà” Dolcetto di Ovada 2015  (Piemonte),NULL,Cascina  Bretta Rossa,2000,1,Espressione massima del Dolcetto di Ovada, prende il nome da un vigneto ultraottantenne ancora in grande forma mantenuto a resa limitata. Di colore rosso rubino, tendente al granata, ha un profumo di prugne, ciliegie mature, confettura. ,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(647,1011,Barbera d’Alba 2018 (Piemonte),NULL,Castello di Verduno,2200,1,E’ ottenuto da scelte uve barbera. All’aspetto è limpido, di colore rosso rubino intenso con riflessi violacei. All’olfatto si presenta intenso, persistente, fine,con sentori di mora e ciliegia matura.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,0,1,10,1);
INSERT INTO menurows VALUES(648,1011,Barolo del comune di Barolo 2014 (Piemonte) ,NULL,Virna Borgogno,6000,1,La passione per la viticoltura della titolare Virna, prima donna laureata in enologia nel 1991, l’obiettivo di produrre grandi vini di ricercata finezza ed eleganza. La continua ricerca della qualità d’eccellenza nasce prima di tutto da un accurato lavoro in vigna.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(649,1011,Dolcetto d’Alba DOC2018  (Piemonte),NULL,Adriano Mario e Vittorio,1500,1,Di bella veste e color rosso rubino intenso, con sfumature violacee,ha un profumo vinoso, a volte fruttato. Il sapore è asciutto, di buon corpo, gradevolmente amarognolo.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(650,1011,Macatin’  2015  (Piemonte),NULL,Cascina  Bretta Rossa,2000,1,Vino nuovo fatto con uve Pinot, Shiraz e Albarossa. Il colore è un rosso rubino carico, con intenso profumo di frutta, dal corpo pieno, con tannini morbidi.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(651,1011,Bardolino 2017  (Veneto),NULL,Tantini,1800,1,Note di ciliegia e frutti rossi caratterizzano questo rosso prodotto da una piccola cantina attenta alla qualità.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(652,1011,Valpolicella Classico 2018  (Veneto),NULL,Brigaldara,1800,1,Colore rosso rubino con riflessi violacei. Profumo di frutta rossa come ciliegia ed amarena. In bocca ricorda l’erba leggermente bagnata.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(653,1011,“Il Vegro” Ripasso Superiore 2017  (Veneto),NULL,Brigaldara,3000,1,Di colore rosso rubino intenso, nel bicchiere delinea grandi archi dati da alcoli superiori. Al naso ricorda l’uva appassita, con sentori di ciliegia, prugna e sottobosco, chiudendo poi con intriganti e raffinati profumi di pepe e spezie. In bocca è avvolgente, denso e complesso, di lunghissima persistenza.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(654,1011,Amarone della Valpolicella Classico 2013  (Veneto),NULL,Brigaldara,5500,1,Pregiatissimo vino della Valpolicella, è un vino completamente secco, di colore granato intenso con riflessi nel tempo mattonati, il profumo è persistente ed ampio con sentore di noce e confettura di ribes, culminati nel sapore corposo, altero, asciutto, vellutato ed aromatico. E’ prodotto in piccole quantità con un metodo artigianale rimasto inalterato negli anni e caratterizzato da un’attenta selezione dei grappoli; è nella fase di affinamento ed invecchiamento, operata in apposite botti, che il vino acquista le caratteristiche organolettiche e si impreziosisce. E’ stato imbottigliato la prima volta nel 1952. Ha caratteristiche uniche : è ricco di alcool, di glicerina, molto strutturato e potente ma anche elegante.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(655,1011,Refosco  2016  (Friuli Venezia-Giulia),NULL,Grillo,2000,1,Fresco ed intenso, ricorda la frutta di sottobosco. Molto fruttato al naso; al palato entra deciso grazie alla grande struttura, lascia tenui note acidule classiche del vitigno.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(656,1011,Merlot  “Ghebo”  2015 (Friuli Venezia-Giulia),NULL,La Frassina,2000,1,Al palato entra dolce, morbido, rilevando via via la sua struttura tannica. Lascia la bocca ampia ed una lunga persistenza aromatica.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(657,1011,Cabernet Sauvignon Collio 2016  (Friuli Venezia-Giulia) ,NULL,Simon,2000,1,Pieno e fragrante con tenue profumo di rosa. Ottimo vino da riserva, ha profumi di frutta matura, di sottobosco, continua con note aromatiche animali e di cuoio. Al palato entra deciso, di ottima struttura, si fa più aromatico con l’invecchiamento.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(658,1011,Rosso di Montepulciano 2017  (Toscana),NULL,Lombardo,2000,1,Nasce dagli stessi vitigni del vino Nobile, senza peraltro richiedere lo stesso tipo di invecchiamento. Una “discreta” presenza di Merlot contribuisce a dargli un gusto fresco, pulito e al tempo stesso robusto.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(659,1011,Brunello di Montalcino 2013  (Toscana),NULL,Podere  Fornacella,5000,1,Da questa micro-azienda l’ennesima conferma che la cura certosina porta a buoni risultati sul piano della personalità. Dagli appigli territoriali netti e dalla matrice artigianale, questo Brunello poggia le fondamenta su un’idea di frutto candido e naturale.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(660,1011,Rosso di Montalcino 2017  (Toscana),NULL,Podere  Fornacella,2500,1,Proviene da uve di Sangiovese grosso, certificazione biologica.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(661,1011,Nobile di Montepulciano 2015  (Toscana),NULL,Il Conventino,2500,1,Nitido, ma ancora da definirsi compiutamente nei profumi, dà il meglio di sé in bocca, dove risulta progressivo nello sviluppo gustativo e nel finale particolarmente lungo.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(662,1011,Chianti Colli Senesi 2017   (Toscana)   BIOLOGICO,NULL,La Lastra,2000,1,Sulle colline del Chianti fiorentino questa azienda produce vini di sicura affidabilità. Pieno di frutto e gioviale, il suo Chianti si distingue per la immediata piacevolezza senza rinunciare alla struttura.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(663,1011,Sassato Morellino di Scansano 2015 (Toscana) ,NULL,Provveditore,2000,1,Colore rosso rubino brillante, dal profumo fruttato ed intenso. Gusto pieno, di buona freschezza ed armonia. ,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(664,1011,Julius Rosso Conero 2016  (Marche),NULL,Strologo,2000,1,E’ un uvaggio di Montepulciano e Sangiovese con vinificazione classica del rosso con tini in legno. Colore limpido, granato, vivace, trasparente. Dal profumo intenso, persistente, sentore di prugna. Di grande beviibilità.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(665,1011,Montepulciano d’Abruzzo 2016 BIOLOGICO ,NULL,Torre dei Beati,2000,1,Dalle sole uve più sane e mature vendemmiate con raccolta scalare in piccole casse nel vecchio vigneto di Cocciapazza e sottoposte a cernita sul tavolo di scelta, si è voluto salvaguardare la particolare tipicità aromatica e la genuità con un’attenta fermentazione in “pilotage” di temperatura e la successiva maturazione in rovere.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(666,1011,Primitivo di Manduria  2017 (Puglia),NULL,Feudi  Salentini,1800,1,Vino che matura in vasche d’acciaio. Esprime aromi intensi che si aprono con note di frutti di bosco. Si presenta con un colore rosso rubino intenso e sfumature rosso porpora, abbastanza trasparente.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(667,1011,Aglianico “Le Fole“ 2016 (Campania),NULL,Giardino,2500,1,Antichissimo vitigno del nostro sud. In questa espressione è ricco, compatto e concentrato, eppure di grande beva.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(668,1011,Cirò Rosso Classico Superiore  2013  (Calabria),NULL,Scala,1500,1,Si presenta di colore rosso rubino, profumo intenso, fragrante e persistente. Sapore giustamente armonico, ben equilibrato.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(669,1011,Nero d’Avola 2017  (Sicilia),NULL,Feudo Disisa,1500,1,Il principe dei vitigni rossi siciliani esprime, in quest’area, netti sentori di frutti rossi e sfumature floreali. Al gusto si mostra giustamente tannico e rivela una grande morbidezza con piacevole ritorno delle sensazioni olfattive.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(670,1011,Syrah Alaki 2017  (Sicilia),NULL,Dimore di  Giurfo,1500,1,dal colore rosso rubino intenso, profumo di bacca rossa, sapore pieno, vellutato.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(671,1011,Cannonau di Sardegna 2016,NULL,Santadi,2000,1,Prodotto da tradizionali vigneti ad alberolle dell’Ogliastra e di Oliena. Colore rubino intenso e fitto, si annuncia all’olfatto vigoroso:ciliegie, lamponi, ribes e sentori di prugna matura e more selvatiche.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(672,1011,Sangiovese di Romagna 2018  (E.Romagna),NULL,Zavalloni,1500,1,Nasce al momento dell’assemblaggio delle barriques per l’affinamento finale del “pruno”. Sangiovese di misurata consistenza e giusta maturazione, che privilegia l’immediata piacevolezza e bevibilità.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(673,1011,Lambrusco “Nebbia e sabbia”  (E.Romagna),NULL,Podere Crocetta,1000,1,Vino rosso frizzante ottenuto da uve “Lambrusco Maestri”, prodotto da vitigno autoctono coltivato su terreni sabbiosi prossimi al Po in comune di Zibello. Uve selezionate e raccolte a mano.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(674,1011,Lambrusco Ottocento nero  (E. Romagna),NULL,Albinea Canali,1000,1,Lambrusco Salamino50%, Lambrusco Grasparossa 40%, Lancellotta 10%. Dall’audace connubio del Salamino, fruttato e di spiccata acidità, con il Grasparossa, di morbidezza e corpo. Colore rosso rubino e dalla spuma briosa, profumo intenso con sentori di frutti di bosco.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(675,1011,Lambrusco Mantovano “Rubilio” (E.Romagna),NULL,Lebovitz,1000,1,Rosso rubino con una spuma intensa e vivace. Al naso si trova sentore di viole e ribes, con sfumature di ciliegia.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(676,1011,Gutturnio frizzante (E.Romagna) ,NULL,Loschi,1000,1,Giovanissima realtà, già in grado di proporre vini di intransigente carattere. Cure naturali, solida struttura e fragranze fruttate.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(677,1011,Fortana “Nebbia e Sabbia” (E.Romagna),NULL,Podere Crocetta,1000,1,Tradizionalmente accompagna i salumi della bassa Emiliana del Po.,NULL,NULL,userimage/vini_rossi.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(679,1011,Tagliere di salume misto con torta fritta,NULL,,1200,1,Tagliere di salume misto con torta fritta,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(680,1011,Culatello di Zibello DOP “Podere Cadassa“ ,NULL,,1200,1,Culatello di Zibello DOP “Podere Cadassa“ ,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(681,1011,Sformatino al parmigiano con confettura di cipolla rossa di  Tropea,NULL,,800,1,Sformatino al parmigiano con confettura di cipolla rossa di  Tropea,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(682,1011,Bocconcini di bufala, carciofini all’olio, pomodorini secchi al basilico,NULL,,800,1,Bocconcini di bufala, carciofini all’olio, pomodorini secchi al basilico,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(683,1011,Parmigiana di melanzane in pasta sfoglia e crema allo scalogno,NULL,,800,1,Parmigiana di melanzane in pasta sfoglia e crema allo scalogno,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(684,1011,Tortelli d’erbette,NULL,,1000,1,Tortelli d’erbette *In mancanza di prodotti freschi potranno essere utilizzati surgelati e congelati,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(685,1011,Malfatti di  ricotta all’albicocca con squaquerone e speck croccante,NULL,,1000,1,Malfatti di  ricotta all’albicocca con squaquerone e speck croccante *In mancanza di prodotti freschi potranno essere utilizzati surgelati e congelati,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(686,1011,Risotto agli asparagi,NULL,,1000,1,Risotto agli asparagi *In mancanza di prodotti freschi potranno essere utilizzati surgelati e congelati,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(687,1011,Tagliolini al ragù di salsiccia,NULL,,1000,1,Tagliolini al ragù di salsiccia *In mancanza di prodotti freschi potranno essere utilizzati surgelati e congelati,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(688,1011,Cappellacci di culatello in crema di porri,NULL,,1000,1,Cappellacci di culatello in crema di porri *In mancanza di prodotti freschi potranno essere utilizzati surgelati e congelati,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(689,1011,Ravioli allo stracchino al pesto di zucchine,NULL,,1000,1,Ravioli allo stracchino al pesto di zucchine *In mancanza di prodotti freschi potranno essere utilizzati surgelati e congelati,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(690,1011,Uova agli asparagi ,NULL,,1000,1,Uova agli asparagi *I secondi vengono serviti con contorni abbinati,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(691,1011,Hamberger di cavallo con melanzane alla parmigiana e fonduta di provola,NULL,,1400,1,Hamberger di cavallo con melanzane alla parmigiana e fonduta di provola *I secondi vengono serviti con contorni abbinati **La carne di manzo utilizzata è italiana e proviene dall’Alta Val Trebbia,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(692,1011,Selezione di formaggi,NULL,,1400,1,Selezione di formaggi *I secondi vengono serviti con contorni abbinati,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(693,1011,Tagliata di controfiletto di manzo,NULL,,1600,1,Tagliata di controfiletto di manzo *I secondi vengono serviti con contorni abbinati **La carne di manzo utilizzata è italiana e proviene dall’Alta Val Trebbia,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(694,1011,Spiedone di carne mista (kg 1),NULL,,2000,1,Spiedone di carne mista (kg 1) *I secondi vengono serviti con contorni abbinati **La carne di manzo utilizzata è italiana e proviene dall’Alta Val Trebbia,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(695,1011,Filetto di manzo,NULL,,2000,1,Filetto di manzo *I secondi vengono serviti con contorni abbinati **La carne di manzo utilizzata è italiana e proviene dall’Alta Val Trebbia,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(696,1011,Bistecca alla fiorentina (min kg 1) all’etto,NULL,,400,1,Bistecca alla fiorentina (min kg 1) *I secondi vengono serviti con contorni abbinati **La carne di manzo utilizzata è italiana e proviene dall’Alta Val Trebbia,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(697,1011,Mousse allo yoghurt con fragole e frutti di bosco,NULL,,400,1,Mousse allo yoghurt con fragole e frutti di bosco,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(698,1011,Tirami su,NULL,,400,1,Tirami su,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(699,1011,Panna cotta al caramello,NULL,,400,1,Panna cotta al caramello,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(700,1011,Spiedini di fragole e cioccolatina,NULL,,400,1,Spiedini di fragole e cioccolatina,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(701,1011,Semifreddo agli amaretti con zabaione  caldo,NULL,,400,1,Semifreddo agli amaretti con zabaione  caldo,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(702,1011,Panna cotta ai frutti di bosco,NULL,,400,1,Panna cotta ai frutti di bosco,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);
INSERT INTO menurows VALUES(703,1011,Panna cotta al cioccolato,NULL,,400,1,Panna cotta al cioccolato,NULL,NULL,userimage/menu_generico.jpeg,userimage/blank_hight.jpeg,1,1,10,1);



DROP TABLE IF EXISTS orderrows;

CREATE TABLE `orderrows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `row_id` int DEFAULT NULL,
  `number` int DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `client_visibility` int DEFAULT '1',
  `note` longtext,
  PRIMARY KEY (`id`),
  KEY `order_id_idx` (`order_id`),
  KEY `row_id_idx` (`row_id`),
  CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `row_id` FOREIGN KEY (`row_id`) REFERENCES `menurows` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=983 DEFAULT CHARSET=latin1;

INSERT INTO orderrows VALUES(959,1001,518,10,1,2017-02-04 17:44:51,1,);
INSERT INTO orderrows VALUES(960,1001,518,2,1,2017-02-04 17:44:57,1,);
INSERT INTO orderrows VALUES(961,1001,518,9,1,2017-02-04 17:45:04,1,);
INSERT INTO orderrows VALUES(962,1001,519,129,1,2017-02-04 17:49:40,1,);
INSERT INTO orderrows VALUES(963,1001,520,71,6,2017-02-04 17:51:40,1,);
INSERT INTO orderrows VALUES(964,1001,521,71,60,2017-02-04 17:52:05,1,);
INSERT INTO orderrows VALUES(966,1001,522,10,4,2017-02-04 22:48:30,1,);
INSERT INTO orderrows VALUES(967,1001,523,65,1,2017-02-04 22:59:00,1,);
INSERT INTO orderrows VALUES(968,1001,523,71,12,2017-02-04 22:59:10,1,);
INSERT INTO orderrows VALUES(969,1001,523,209,2,2017-02-04 22:59:27,1,ben votta);
INSERT INTO orderrows VALUES(970,1001,524,129,1,2017-02-04 23:00:38,1,);
INSERT INTO orderrows VALUES(971,1001,524,130,1,2017-02-04 23:00:43,1,);
INSERT INTO orderrows VALUES(972,1001,525,190,5,2017-02-04 23:03:52,1,);
INSERT INTO orderrows VALUES(973,1001,525,70,2,2017-02-04 23:03:37,1,);
INSERT INTO orderrows VALUES(974,1002,526,471,4,2017-02-04 23:21:54,1,);
INSERT INTO orderrows VALUES(975,1002,526,405,2,2017-02-04 23:21:08,1,);
INSERT INTO orderrows VALUES(976,1002,527,405,2,2017-02-05 18:57:07,1,);
INSERT INTO orderrows VALUES(977,1002,528,410,1,2020-05-05 08:52:05,1,);
INSERT INTO orderrows VALUES(978,1011,529,600,4,2020-05-12 09:59:17,1,);
INSERT INTO orderrows VALUES(979,1011,529,619,1,2020-05-12 01:09:26,1,);
INSERT INTO orderrows VALUES(980,1011,529,635,1,2020-05-12 10:31:02,1,);
INSERT INTO orderrows VALUES(981,1011,529,625,1,2020-05-12 10:31:58,1,);
INSERT INTO orderrows VALUES(982,1011,529,634,10,2020-05-12 23:10:22,1,);



DROP TABLE IF EXISTS orders;

CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `session` varchar(45) DEFAULT NULL,
  `tableId` varchar(45) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=530 DEFAULT CHARSET=latin1;

INSERT INTO orders VALUES(518,1001,tb5a7g05mfstdt2ru82867h0o6,-1,2017-02-04 17:44:51);
INSERT INTO orders VALUES(519,1001,21cgd6qvg7brugrj16dkc47bo1,-1,2017-02-04 17:49:40);
INSERT INTO orders VALUES(520,1001,rdaa2o60ueap9hcvtoesn6gah4,-1,2017-02-04 17:51:40);
INSERT INTO orders VALUES(521,1001,5ddhl914a1kg7r442drupq6mq6,-1,2017-02-04 17:52:05);
INSERT INTO orders VALUES(522,1001,8m075tdkktr2rcgugn1a7uo1f7,-1,2017-02-04 22:32:37);
INSERT INTO orders VALUES(523,1001,6ladqhl6qri00cj3t3hbsrktk4,-1,2017-02-04 22:53:01);
INSERT INTO orders VALUES(524,1001,ks05ut61edka7vb6q843hbslm1,-1,2017-02-04 23:00:38);
INSERT INTO orders VALUES(525,1001,0gr0di1rt592haj1brb0k2j0h6,-1,2017-02-04 23:03:22);
INSERT INTO orders VALUES(526,1002,q6t96ruk129pklmd4cpu1mkmd7,-1,2017-02-04 23:05:46);
INSERT INTO orders VALUES(527,1002,4k2gl893ltopeqgjcj9oa9j4g5,-1,2017-02-05 18:56:51);
INSERT INTO orders VALUES(528,1002,i95odfoip8reqba4iltjcvqac7,-1,2020-05-05 08:52:05);
INSERT INTO orders VALUES(529,1011,iqna2v4ou31ap8qmr4kjobad97,-1,2020-05-12 00:09:26);



DROP TABLE IF EXISTS province;

CREATE TABLE `province` (
  `idprovincia` int NOT NULL AUTO_INCREMENT,
  `nomeprovincia` varchar(20) NOT NULL DEFAULT '',
  `idregione` int NOT NULL DEFAULT '0',
  `siglaprovincia` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`idprovincia`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

INSERT INTO province VALUES(1,Ancona,1,AN);
INSERT INTO province VALUES(2,Macerata,1,MC);
INSERT INTO province VALUES(3,Pesaro Urbino,1,PU);
INSERT INTO province VALUES(4,Ascoli Piceno,1,AP);
INSERT INTO province VALUES(5,Alessandria,13,AL);
INSERT INTO province VALUES(6,Asti,13,AT);
INSERT INTO province VALUES(7,Biella,13,BI);
INSERT INTO province VALUES(8,Cuneo,13,CN);
INSERT INTO province VALUES(9,Novara,13,NO);
INSERT INTO province VALUES(10,Vercelli,13,VC);
INSERT INTO province VALUES(11,Torino,13,TO);
INSERT INTO province VALUES(12,Agrigento,11,AG);
INSERT INTO province VALUES(13,Caltanissetta,11,CL);
INSERT INTO province VALUES(14,Catania,11,CT);
INSERT INTO province VALUES(15,Enna,11,EN);
INSERT INTO province VALUES(16,Messina,11,ME);
INSERT INTO province VALUES(17,Palermo,11,PA);
INSERT INTO province VALUES(18,Ragusa,11,RG);
INSERT INTO province VALUES(19,Siracusa,11,SR);
INSERT INTO province VALUES(20,Trapani,11,TP);
INSERT INTO province VALUES(21,Catanzaro,7,CZ);
INSERT INTO province VALUES(22,Cosenza,7,CS);
INSERT INTO province VALUES(23,Crotone,7,KR);
INSERT INTO province VALUES(24,Reggio Calabria,7,RC);
INSERT INTO province VALUES(25,Vibo Valentia,7,VV);
INSERT INTO province VALUES(27,Matera,3,MT);
INSERT INTO province VALUES(28,Potenza,3,PZ);
INSERT INTO province VALUES(29,Bari,6,BA);
INSERT INTO province VALUES(30,Brindisi,6,BR);
INSERT INTO province VALUES(31,Foggia,6,FG);
INSERT INTO province VALUES(32,Lecce,6,LE);
INSERT INTO province VALUES(33,Taranto,6,TA);
INSERT INTO province VALUES(34,Avellino,8,AV);
INSERT INTO province VALUES(35,Benevento,8,BN);
INSERT INTO province VALUES(36,Caserta,8,CE);
INSERT INTO province VALUES(37,Napoli,8,NA);
INSERT INTO province VALUES(38,Salerno,8,SA);
INSERT INTO province VALUES(39,Frosinone,9,FR);
INSERT INTO province VALUES(40,Latina,9,LT);
INSERT INTO province VALUES(41,Rieti,9,RI);
INSERT INTO province VALUES(42,Roma,9,RM);
INSERT INTO province VALUES(43,Viterbo,9,VT);
INSERT INTO province VALUES(44,Chieti,2,CH);
INSERT INTO province VALUES(45,L'Aquila,2,AQ);
INSERT INTO province VALUES(46,Pescara,2,PE);
INSERT INTO province VALUES(47,Teramo,2,TE);
INSERT INTO province VALUES(48,Arezzo,12,AR);
INSERT INTO province VALUES(49,Firenze,12,FI);
INSERT INTO province VALUES(50,Grosseto,12,GR);
INSERT INTO province VALUES(51,Livorno,12,LI);
INSERT INTO province VALUES(52,Lucca,12,LU);
INSERT INTO province VALUES(53,Massa Carrara,12,MS);
INSERT INTO province VALUES(54,Pisa,12,PI);
INSERT INTO province VALUES(55,Pistoia,12,PT);
INSERT INTO province VALUES(56,Siena,12,SI);
INSERT INTO province VALUES(57,Bologna,14,BO);
INSERT INTO province VALUES(58,Ferrara,14,FE);
INSERT INTO province VALUES(59,Forlì Cesena,14,FC);
INSERT INTO province VALUES(60,Modena,14,MO);
INSERT INTO province VALUES(61,Parma,14,PR);
INSERT INTO province VALUES(62,Piacenza,14,PC);
INSERT INTO province VALUES(63,Ravenna,14,RA);
INSERT INTO province VALUES(64,Reggio Emilia,14,RE);
INSERT INTO province VALUES(65,Rimini,14,RN);
INSERT INTO province VALUES(66,Belluno,17,BL);
INSERT INTO province VALUES(67,Padova,17,PD);
INSERT INTO province VALUES(68,Rovigo,17,RO);
INSERT INTO province VALUES(69,Treviso,17,TV);
INSERT INTO province VALUES(70,Venezia,17,VE);
INSERT INTO province VALUES(71,Verona,17,VR);
INSERT INTO province VALUES(72,Vicenza,17,VI);
INSERT INTO province VALUES(73,Gorizia,15,GO);
INSERT INTO province VALUES(74,Pordenone,15,PN);
INSERT INTO province VALUES(75,Udine,15,UD);
INSERT INTO province VALUES(76,Trieste,15,TS);
INSERT INTO province VALUES(77,Aosta,16,AO);
INSERT INTO province VALUES(78,Cagliari,10,CA);
INSERT INTO province VALUES(79,Nuoro,10,NU);
INSERT INTO province VALUES(80,Oristano,10,OR);
INSERT INTO province VALUES(81,Sassari,10,SS);
INSERT INTO province VALUES(82,Genova,18,GE);
INSERT INTO province VALUES(83,Imperia,18,IM);
INSERT INTO province VALUES(84,Savona,18,SV);
INSERT INTO province VALUES(85,La Spezia,18,SP);
INSERT INTO province VALUES(86,Isernia,4,IS);
INSERT INTO province VALUES(87,Campobasso,4,CB);
INSERT INTO province VALUES(88,Perugia,20,PG);
INSERT INTO province VALUES(89,Terni,20,TR);
INSERT INTO province VALUES(90,Bergamo,19,BG);
INSERT INTO province VALUES(91,Brescia,19,BS);
INSERT INTO province VALUES(92,Como,19,CO);
INSERT INTO province VALUES(93,Cremona,19,CR);
INSERT INTO province VALUES(94,Lecco,19,LC);
INSERT INTO province VALUES(95,Lodi,19,LO);
INSERT INTO province VALUES(96,Mantova,19,MN);
INSERT INTO province VALUES(97,Milano,19,MI);
INSERT INTO province VALUES(98,Pavia,19,PV);
INSERT INTO province VALUES(99,Sondrio,19,SO);
INSERT INTO province VALUES(100,Varese,19,VA);
INSERT INTO province VALUES(101,Trento,5,TN);
INSERT INTO province VALUES(102,Bolzano,5,BZ);
INSERT INTO province VALUES(103,Prato,12,PO);
INSERT INTO province VALUES(104,Verbania,13,VB);
INSERT INTO province VALUES(105,Carbonia Iglesias,10,CI);
INSERT INTO province VALUES(106,Medio Campidano,10,VS);
INSERT INTO province VALUES(107,Ogliastra,10,OG);
INSERT INTO province VALUES(108,Olbia Tempio,10,OT);



DROP TABLE IF EXISTS rating;

CREATE TABLE `rating` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `rating` int DEFAULT '10',
  `title` varchar(45) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `useful` int DEFAULT '0',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO rating VALUES(1,1002,33,20,Ottimo,la pizza e' stata ottima, buona la pasta, puntualita' nella consegna,0,2013-11-19 00:53:47);
INSERT INTO rating VALUES(2,1002,33,16,Ottimo,la pizza  stata ottima, buona la pasta, puntualit' nella consegna,0,2013-11-19 00:53:47);
INSERT INTO rating VALUES(3,1002,33,0,Pessimo,non mi e' piaciuto,0,2013-11-19 00:53:47);
INSERT INTO rating VALUES(4,1002,33,0,Pessimo,non mi e' piaciuto,0,2013-11-19 00:53:47);
INSERT INTO rating VALUES(5,1011,33,20,Ottimo,Ottimo,0,2020-05-24 20:43:59);



DROP TABLE IF EXISTS regioni;

CREATE TABLE `regioni` (
  `idregione` int NOT NULL AUTO_INCREMENT,
  `nomeregione` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`idregione`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

INSERT INTO regioni VALUES(1,Marche);
INSERT INTO regioni VALUES(2,Abruzzo);
INSERT INTO regioni VALUES(3,Basilicata);
INSERT INTO regioni VALUES(4,Molise);
INSERT INTO regioni VALUES(5,Trentino Alto Adige);
INSERT INTO regioni VALUES(6,Puglia);
INSERT INTO regioni VALUES(7,Calabria);
INSERT INTO regioni VALUES(8,Campania);
INSERT INTO regioni VALUES(9,Lazio);
INSERT INTO regioni VALUES(10,Sardegna);
INSERT INTO regioni VALUES(11,Sicilia);
INSERT INTO regioni VALUES(12,Toscana);
INSERT INTO regioni VALUES(13,Piemonte);
INSERT INTO regioni VALUES(14,Emilia Romagna);
INSERT INTO regioni VALUES(15,Friuli Venezia Giulia);
INSERT INTO regioni VALUES(16,Valle d'Aosta);
INSERT INTO regioni VALUES(17,Veneto);
INSERT INTO regioni VALUES(18,Liguria);
INSERT INTO regioni VALUES(19,Lombardia);
INSERT INTO regioni VALUES(20,Umbria);



DROP TABLE IF EXISTS requests;

CREATE TABLE `requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `r_type` varchar(45) NOT NULL,
  `r_table` varchar(45) NOT NULL,
  `r_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `escapee` int unsigned NOT NULL,
  `r_session` varchar(45) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `delivery` int DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;

INSERT INTO requests VALUES(131,1001,0,-1,2017-02-04 17:44:31,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO requests VALUES(132,1001,4,-1,2017-02-04 17:45:12,0,tb5a7g05mfstdt2ru82867h0o6,518,NULL,NULL,NULL);
INSERT INTO requests VALUES(133,1001,4,-1,2017-02-04 17:45:26,0,tb5a7g05mfstdt2ru82867h0o6,518,NULL,NULL,NULL);
INSERT INTO requests VALUES(134,1001,4,-1,2017-02-04 17:45:41,0,tb5a7g05mfstdt2ru82867h0o6,518,NULL,NULL,NULL);
INSERT INTO requests VALUES(135,1001,0,-1,2017-02-04 17:46:01,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO requests VALUES(136,1001,0,-1,2017-02-04 17:48:06,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO requests VALUES(137,1001,4,-1,2017-02-04 17:49:46,0,21cgd6qvg7brugrj16dkc47bo1,519,NULL,NULL,NULL);
INSERT INTO requests VALUES(138,1001,0,-1,2017-02-04 17:51:29,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO requests VALUES(139,1001,4,-1,2017-02-04 17:51:43,0,rdaa2o60ueap9hcvtoesn6gah4,520,NULL,NULL,NULL);
INSERT INTO requests VALUES(140,1001,4,-1,2017-02-04 17:52:13,0,5ddhl914a1kg7r442drupq6mq6,521,NULL,NULL,NULL);
INSERT INTO requests VALUES(141,1001,1,-1,2017-02-04 17:52:26,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO requests VALUES(142,1001,4,-1,2017-02-04 22:48:53,0,8m075tdkktr2rcgugn1a7uo1f7,522,NULL,NULL,NULL);
INSERT INTO requests VALUES(143,1001,4,-1,2017-02-04 22:59:56,0,6ladqhl6qri00cj3t3hbsrktk4,523,NULL,NULL,NULL);
INSERT INTO requests VALUES(144,1001,0,-1,2017-02-04 23:00:54,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO requests VALUES(145,1001,1,-1,2017-02-04 23:01:09,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO requests VALUES(146,1001,4,-1,2017-02-04 23:01:27,0,ks05ut61edka7vb6q843hbslm1,524,NULL,NULL,NULL);
INSERT INTO requests VALUES(147,1001,1,-1,2017-02-04 23:03:11,0,NULL,NULL,NULL,NULL,NULL);
INSERT INTO requests VALUES(148,1001,4,-1,2017-02-04 23:03:54,0,0gr0di1rt592haj1brb0k2j0h6,525,NULL,NULL,NULL);
INSERT INTO requests VALUES(149,1002,4,-1,2017-02-04 23:26:40,0,q6t96ruk129pklmd4cpu1mkmd7,526,37,NULL,NULL);
INSERT INTO requests VALUES(150,1002,4,-1,2017-02-05 18:57:12,0,4k2gl893ltopeqgjcj9oa9j4g5,527,37,NULL,NULL);



DROP TABLE IF EXISTS supplementgroup;

CREATE TABLE `supplementgroup` (
  `id` int NOT NULL,
  `client_id` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO supplementgroup VALUES(1,1002,Pizze);



DROP TABLE IF EXISTS supplementgroupc;

CREATE TABLE `supplementgroupc` (
  `id` int NOT NULL,
  `client_id` int DEFAULT NULL,
  `idSG` int DEFAULT NULL,
  `idC` int DEFAULT NULL,
  `max_supplements` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO supplementgroupc VALUES(1,1002,1,145,5);



DROP TABLE IF EXISTS supplements;

CREATE TABLE `supplements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `idSG` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `printdescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO supplements VALUES(1,1002,1,Alici,50,NULL,NULL);
INSERT INTO supplements VALUES(2,1002,1,Capperi,50,NULL,NULL);
INSERT INTO supplements VALUES(3,1002,1,Carciofi,50,NULL,NULL);
INSERT INTO supplements VALUES(4,1002,1,Funghi porcini,100,NULL,NULL);
INSERT INTO supplements VALUES(5,1002,1,Mozzarella,100,NULL,NULL);
INSERT INTO supplements VALUES(6,1002,1,Prosciutto crudo,100,NULL,NULL);
INSERT INTO supplements VALUES(7,1002,1,Salame piccante,100,NULL,NULL);



DROP TABLE IF EXISTS tables;

CREATE TABLE `tables` (
  `id` int NOT NULL,
  `client_id` int DEFAULT NULL,
  `extnumber` varchar(16) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO tables VALUES(1,1001,000009177,Tavolo 1);
INSERT INTO tables VALUES(2,1001,000036864,Tavolo 2);
INSERT INTO tables VALUES(3,1001,000083295,Tavolo 3);
INSERT INTO tables VALUES(4,1001,000148704,Tavolo 4);
INSERT INTO tables VALUES(5,1001,000233325,Tavolo 5);
INSERT INTO tables VALUES(6,1001,000337392,Tavolo 6);
INSERT INTO tables VALUES(7,1001,000461139,Tavolo 7);
INSERT INTO tables VALUES(8,1001,000604800,Tavolo 8);
INSERT INTO tables VALUES(9,1001,000768609,Tavolo 9);
INSERT INTO tables VALUES(10,1001,000952800,Tavolo 10);
INSERT INTO tables VALUES(11,1001,001157607,Tavolo 11);
INSERT INTO tables VALUES(12,1001,001383264,Tavolo 12);
INSERT INTO tables VALUES(13,1001,001630005,Tavolo 13);
INSERT INTO tables VALUES(14,1001,001898064,Tavolo 14);
INSERT INTO tables VALUES(15,1001,002187675,Tavolo 15);
INSERT INTO tables VALUES(16,1001,002499072,Tavolo 16);
INSERT INTO tables VALUES(17,1001,002832489,Tavolo 17);
INSERT INTO tables VALUES(18,1001,003188160,Tavolo 18);
INSERT INTO tables VALUES(19,1001,003566319,Tavolo 19);
INSERT INTO tables VALUES(20,1001,003967200,Tavolo 20);
INSERT INTO tables VALUES(21,1001,004391037,Tavolo 21);
INSERT INTO tables VALUES(22,1001,004838064,Tavolo 22);
INSERT INTO tables VALUES(23,1001,005308515,Tavolo 23);
INSERT INTO tables VALUES(24,1001,005802624,Tavolo 24);
INSERT INTO tables VALUES(25,1001,006320625,Tavolo 25);
INSERT INTO tables VALUES(26,1001,006862752,Tavolo 26);
INSERT INTO tables VALUES(27,1001,007429239,Tavolo 27);
INSERT INTO tables VALUES(28,1001,008020320,Tavolo 28);
INSERT INTO tables VALUES(29,1001,008636229,Tavolo 29);
INSERT INTO tables VALUES(30,1001,009277200,Tavolo 30);
INSERT INTO tables VALUES(31,1001,009943467,Tavolo 31);
INSERT INTO tables VALUES(32,1001,010635264,Tavolo 32);
INSERT INTO tables VALUES(33,1001,011352825,Tavolo 33);
INSERT INTO tables VALUES(34,1001,012096384,Tavolo 34);
INSERT INTO tables VALUES(35,1001,012866175,Tavolo 35);
INSERT INTO tables VALUES(36,1001,013662432,Tavolo 36);
INSERT INTO tables VALUES(37,1001,014485389,Tavolo 37);
INSERT INTO tables VALUES(38,1001,015335280,Tavolo 38);
INSERT INTO tables VALUES(39,1001,016212339,Tavolo 39);
INSERT INTO tables VALUES(40,1001,017116800,Tavolo 40);
INSERT INTO tables VALUES(41,1001,018048897,Tavolo 41);
INSERT INTO tables VALUES(42,1001,019008864,Tavolo 42);
INSERT INTO tables VALUES(43,1001,019996935,Tavolo 43);
INSERT INTO tables VALUES(44,1001,021013344,Tavolo 44);
INSERT INTO tables VALUES(45,1001,022058325,Tavolo 45);
INSERT INTO tables VALUES(46,1001,023132112,Tavolo 46);
INSERT INTO tables VALUES(47,1001,024234939,Tavolo 47);
INSERT INTO tables VALUES(48,1001,025367040,Tavolo 48);
INSERT INTO tables VALUES(49,1001,026528649,Tavolo 49);
INSERT INTO tables VALUES(50,1001,027720000,Tavolo 50);
INSERT INTO tables VALUES(51,1001,028941327,Tavolo 51);
INSERT INTO tables VALUES(52,1001,030192864,Tavolo 52);
INSERT INTO tables VALUES(53,1001,031474845,Tavolo 53);
INSERT INTO tables VALUES(54,1001,032787504,Tavolo 54);
INSERT INTO tables VALUES(55,1001,034131075,Tavolo 55);
INSERT INTO tables VALUES(56,1001,035505792,Tavolo 56);
INSERT INTO tables VALUES(57,1001,036911889,Tavolo 57);
INSERT INTO tables VALUES(58,1001,038349600,Tavolo 58);
INSERT INTO tables VALUES(59,1001,039819159,Tavolo 59);
INSERT INTO tables VALUES(60,1001,041320800,Tavolo 60);
INSERT INTO tables VALUES(61,1001,042854757,Tavolo 61);
INSERT INTO tables VALUES(62,1001,044421264,Tavolo 62);
INSERT INTO tables VALUES(63,1001,046020555,Tavolo 63);
INSERT INTO tables VALUES(64,1001,047652864,Tavolo 64);
INSERT INTO tables VALUES(65,1001,049318425,Tavolo 65);
INSERT INTO tables VALUES(66,1001,051017472,Tavolo 66);
INSERT INTO tables VALUES(67,1001,052750239,Tavolo 67);
INSERT INTO tables VALUES(68,1001,054516960,Tavolo 68);
INSERT INTO tables VALUES(69,1001,056317869,Tavolo 69);
INSERT INTO tables VALUES(70,1001,058153200,Tavolo 70);
INSERT INTO tables VALUES(71,1001,060023187,Tavolo 71);
INSERT INTO tables VALUES(72,1001,061928064,Tavolo 72);
INSERT INTO tables VALUES(73,1001,063868065,Tavolo 73);
INSERT INTO tables VALUES(74,1001,065843424,Tavolo 74);
INSERT INTO tables VALUES(75,1001,067854375,Tavolo 75);
INSERT INTO tables VALUES(76,1001,069901152,Tavolo 76);
INSERT INTO tables VALUES(77,1001,071983989,Tavolo 77);
INSERT INTO tables VALUES(78,1001,074103120,Tavolo 78);
INSERT INTO tables VALUES(79,1001,076258779,Tavolo 79);
INSERT INTO tables VALUES(80,1001,078451200,Tavolo 80);
INSERT INTO tables VALUES(81,1001,080680617,Tavolo 81);
INSERT INTO tables VALUES(82,1001,082947264,Tavolo 82);
INSERT INTO tables VALUES(83,1001,085251375,Tavolo 83);
INSERT INTO tables VALUES(84,1001,087593184,Tavolo 84);
INSERT INTO tables VALUES(85,1001,089972925,Tavolo 85);
INSERT INTO tables VALUES(86,1001,092390832,Tavolo 86);
INSERT INTO tables VALUES(87,1001,094847139,Tavolo 87);
INSERT INTO tables VALUES(88,1001,097342080,Tavolo 88);
INSERT INTO tables VALUES(89,1001,099875889,Tavolo 89);
INSERT INTO tables VALUES(90,1001,102448800,Tavolo 90);
INSERT INTO tables VALUES(91,1001,105061047,Tavolo 91);
INSERT INTO tables VALUES(92,1001,107712864,Tavolo 92);
INSERT INTO tables VALUES(93,1001,110404485,Tavolo 93);
INSERT INTO tables VALUES(94,1001,113136144,Tavolo 94);
INSERT INTO tables VALUES(95,1001,115908075,Tavolo 95);
INSERT INTO tables VALUES(96,1001,118720512,Tavolo 96);
INSERT INTO tables VALUES(97,1001,121573689,Tavolo 97);
INSERT INTO tables VALUES(98,1001,124467840,Tavolo 98);
INSERT INTO tables VALUES(99,1001,127403199,Tavolo 99);
INSERT INTO tables VALUES(100,1001,130380000,Tavolo 100);
INSERT INTO tables VALUES(101,1001,133398477,Tavolo 101);
INSERT INTO tables VALUES(102,1001,136458864,Tavolo 102);
INSERT INTO tables VALUES(103,1001,139561395,Tavolo 103);
INSERT INTO tables VALUES(104,1001,142706304,Tavolo 104);
INSERT INTO tables VALUES(105,1001,145893825,Tavolo 105);
INSERT INTO tables VALUES(106,1001,149124192,Tavolo 106);
INSERT INTO tables VALUES(107,1001,152397639,Tavolo 107);
INSERT INTO tables VALUES(108,1001,155714400,Tavolo 108);
INSERT INTO tables VALUES(109,1001,159074709,Tavolo 109);
INSERT INTO tables VALUES(110,1001,162478800,Tavolo 110);
INSERT INTO tables VALUES(111,1001,165926907,Tavolo 111);
INSERT INTO tables VALUES(112,1001,169419264,Tavolo 112);
INSERT INTO tables VALUES(113,1001,172956105,Tavolo 113);
INSERT INTO tables VALUES(114,1001,176537664,Tavolo 114);
INSERT INTO tables VALUES(115,1001,180164175,Tavolo 115);
INSERT INTO tables VALUES(116,1001,183835872,Tavolo 116);
INSERT INTO tables VALUES(117,1001,187552989,Tavolo 117);
INSERT INTO tables VALUES(118,1001,191315760,Tavolo 118);
INSERT INTO tables VALUES(119,1001,195124419,Tavolo 119);
INSERT INTO tables VALUES(120,1001,198979200,Tavolo 120);
INSERT INTO tables VALUES(121,1001,202880337,Tavolo 121);
INSERT INTO tables VALUES(122,1001,206828064,Tavolo 122);
INSERT INTO tables VALUES(123,1001,210822615,Tavolo 123);
INSERT INTO tables VALUES(124,1001,214864224,Tavolo 124);
INSERT INTO tables VALUES(125,1001,218953125,Tavolo 125);
INSERT INTO tables VALUES(126,1001,223089552,Tavolo 126);
INSERT INTO tables VALUES(127,1001,227273739,Tavolo 127);
INSERT INTO tables VALUES(128,1001,231505920,Tavolo 128);
INSERT INTO tables VALUES(129,1001,235786329,Tavolo 129);
INSERT INTO tables VALUES(130,1001,240115200,Tavolo 130);
INSERT INTO tables VALUES(131,1001,244492767,Tavolo 131);
INSERT INTO tables VALUES(132,1001,248919264,Tavolo 132);
INSERT INTO tables VALUES(133,1001,253394925,Tavolo 133);
INSERT INTO tables VALUES(134,1001,257919984,Tavolo 134);
INSERT INTO tables VALUES(135,1001,262494675,Tavolo 135);
INSERT INTO tables VALUES(136,1001,267119232,Tavolo 136);
INSERT INTO tables VALUES(137,1001,271793889,Tavolo 137);
INSERT INTO tables VALUES(138,1001,276518880,Tavolo 138);
INSERT INTO tables VALUES(139,1001,281294439,Tavolo 139);
INSERT INTO tables VALUES(140,1001,286120800,Tavolo 140);
INSERT INTO tables VALUES(141,1001,290998197,Tavolo 141);
INSERT INTO tables VALUES(142,1001,295926864,Tavolo 142);
INSERT INTO tables VALUES(143,1001,300907035,Tavolo 143);
INSERT INTO tables VALUES(144,1001,305938944,Tavolo 144);
INSERT INTO tables VALUES(145,1001,311022825,Tavolo 145);
INSERT INTO tables VALUES(146,1001,316158912,Tavolo 146);
INSERT INTO tables VALUES(147,1001,321347439,Tavolo 147);
INSERT INTO tables VALUES(148,1001,326588640,Tavolo 148);
INSERT INTO tables VALUES(149,1001,331882749,Tavolo 149);
INSERT INTO tables VALUES(150,1001,337230000,Tavolo 150);
INSERT INTO tables VALUES(151,1001,342630627,Tavolo 151);
INSERT INTO tables VALUES(152,1001,348084864,Tavolo 152);
INSERT INTO tables VALUES(153,1001,353592945,Tavolo 153);
INSERT INTO tables VALUES(154,1001,359155104,Tavolo 154);
INSERT INTO tables VALUES(155,1001,364771575,Tavolo 155);
INSERT INTO tables VALUES(156,1001,370442592,Tavolo 156);
INSERT INTO tables VALUES(157,1001,376168389,Tavolo 157);
INSERT INTO tables VALUES(158,1001,381949200,Tavolo 158);
INSERT INTO tables VALUES(159,1001,387785259,Tavolo 159);
INSERT INTO tables VALUES(160,1001,393676800,Tavolo 160);
INSERT INTO tables VALUES(161,1001,399624057,Tavolo 161);
INSERT INTO tables VALUES(162,1001,405627264,Tavolo 162);
INSERT INTO tables VALUES(163,1001,411686655,Tavolo 163);
INSERT INTO tables VALUES(164,1001,417802464,Tavolo 164);
INSERT INTO tables VALUES(165,1001,423974925,Tavolo 165);
INSERT INTO tables VALUES(166,1001,430204272,Tavolo 166);
INSERT INTO tables VALUES(167,1001,436490739,Tavolo 167);
INSERT INTO tables VALUES(168,1001,442834560,Tavolo 168);
INSERT INTO tables VALUES(169,1001,449235969,Tavolo 169);
INSERT INTO tables VALUES(170,1001,455695200,Tavolo 170);
INSERT INTO tables VALUES(171,1001,462212487,Tavolo 171);
INSERT INTO tables VALUES(172,1001,468788064,Tavolo 172);
INSERT INTO tables VALUES(173,1001,475422165,Tavolo 173);
INSERT INTO tables VALUES(174,1001,482115024,Tavolo 174);
INSERT INTO tables VALUES(175,1001,488866875,Tavolo 175);
INSERT INTO tables VALUES(176,1001,495677952,Tavolo 176);
INSERT INTO tables VALUES(177,1001,502548489,Tavolo 177);
INSERT INTO tables VALUES(178,1001,509478720,Tavolo 178);
INSERT INTO tables VALUES(179,1001,516468879,Tavolo 179);
INSERT INTO tables VALUES(180,1001,523519200,Tavolo 180);
INSERT INTO tables VALUES(181,1001,530629917,Tavolo 181);
INSERT INTO tables VALUES(182,1001,537801264,Tavolo 182);
INSERT INTO tables VALUES(183,1001,545033475,Tavolo 183);
INSERT INTO tables VALUES(184,1001,552326784,Tavolo 184);
INSERT INTO tables VALUES(185,1001,559681425,Tavolo 185);
INSERT INTO tables VALUES(186,1001,567097632,Tavolo 186);
INSERT INTO tables VALUES(187,1001,574575639,Tavolo 187);
INSERT INTO tables VALUES(188,1001,582115680,Tavolo 188);
INSERT INTO tables VALUES(189,1001,589717989,Tavolo 189);
INSERT INTO tables VALUES(190,1001,597382800,Tavolo 190);
INSERT INTO tables VALUES(191,1001,605110347,Tavolo 191);
INSERT INTO tables VALUES(192,1001,612900864,Tavolo 192);
INSERT INTO tables VALUES(193,1001,620754585,Tavolo 193);
INSERT INTO tables VALUES(194,1001,628671744,Tavolo 194);
INSERT INTO tables VALUES(195,1001,636652575,Tavolo 195);
INSERT INTO tables VALUES(196,1001,644697312,Tavolo 196);
INSERT INTO tables VALUES(197,1001,652806189,Tavolo 197);
INSERT INTO tables VALUES(198,1001,660979440,Tavolo 198);
INSERT INTO tables VALUES(199,1001,669217299,Tavolo 199);
INSERT INTO tables VALUES(200,1001,677520000,Tavolo 200);



DROP TABLE IF EXISTS tabs;

CREATE TABLE `tabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `visibility` int DEFAULT NULL,
  `position` int DEFAULT NULL,
  `tOrder` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `parent` int DEFAULT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

INSERT INTO tabs VALUES(1,1001,Menu,1,0,1,4,NULL,NULL);
INSERT INTO tabs VALUES(3,1001,Eventi,1,1,4,2,NULL,NULL);
INSERT INTO tabs VALUES(4,1001,Carrello,1,0,4,3,NULL,NULL);
INSERT INTO tabs VALUES(5,1001,Chiama,1,0,3,0,NULL,NULL);
INSERT INTO tabs VALUES(6,1001,Offerte,1,0,2,4,NULL,NULL);
INSERT INTO tabs VALUES(7,1001,Carta dei vini,1,1,1,4,NULL,NULL);
INSERT INTO tabs VALUES(8,1001,Gelati,0,1,4,1,NULL,NULL);
INSERT INTO tabs VALUES(9,1001,Ordini Effettuati,1,1,3,5,NULL,NULL);
INSERT INTO tabs VALUES(11,1001,Ordini evasi,0,0,2,5,NULL,NULL);
INSERT INTO tabs VALUES(12,1001,PizzeriaIncontro.it,1,1,7,6,NULL,http://www.pizzeriaincontro.it/);
INSERT INTO tabs VALUES(13,1001,Home 2,0,1,8,7,NULL,http://www.pizzeriaincontro.it/);
INSERT INTO tabs VALUES(15,1001,Pizza,0,0,0,4,NULL,NULL);
INSERT INTO tabs VALUES(16,1001,Bevande,0,0,1,4,NULL,NULL);
INSERT INTO tabs VALUES(17,1001,ServiziSmart,1,1,9999,8,NULL,NULL);
INSERT INTO tabs VALUES(18,1001,Offerte del giorno,1,1,0,1,NULL,NULL);
INSERT INTO tabs VALUES(19,1003,Tattoo,1,0,1,4,NULL,NULL);
INSERT INTO tabs VALUES(20,1003,Nail Art,1,0,2,4,NULL,NULL);
INSERT INTO tabs VALUES(21,1003,Wish List,1,0,3,3,NULL,NULL);
INSERT INTO tabs VALUES(22,1002,Bevande,1,0,2,4,NULL,NULL);
INSERT INTO tabs VALUES(23,1002,Pizze,1,0,1,4,NULL,NULL);
INSERT INTO tabs VALUES(24,1002,Carrello,1,0,3,3,NULL,NULL);
INSERT INTO tabs VALUES(25,1002,Ordini Effettuati,1,1,1,5,NULL,NULL);
INSERT INTO tabs VALUES(26,1002,PizzeriaIncontro.it,1,1,4,6,NULL,http://www.pizzeriaincontro.it/);
INSERT INTO tabs VALUES(27,1002,ServiziSmart,1,1,9999,8,NULL,NULL);
INSERT INTO tabs VALUES(28,1002,Prenota all'Incontro,1,1,2,0,NULL,NULL);
INSERT INTO tabs VALUES(29,1002,Consulta il menu,1,1,3,6,NULL,http://www.servizismart.com/demos/tapitap/?cid=1001);
INSERT INTO tabs VALUES(30,1004,Ordina,1,0,1,4,NULL,NULL);
INSERT INTO tabs VALUES(31,1004,Chiama,1,0,2,0,NULL,NULL);
INSERT INTO tabs VALUES(32,1004,Eventi,1,0,3,2,0,NULL);
INSERT INTO tabs VALUES(33,1004,Calyx.it,1,1,10,6,NULL,http://www.youtube.com/watch?v=wFow7MsgANo);
INSERT INTO tabs VALUES(34,1004,ServiziSmart,1,1,9999,8,NULL,NULL);
INSERT INTO tabs VALUES(35,1100,Birre e bevande,1,0,1,4,NULL,NULL);
INSERT INTO tabs VALUES(36,1100,Panini e salumi,1,0,2,4,NULL,NULL);
INSERT INTO tabs VALUES(37,1100,Piatti del giorno,1,0,3,1,NULL,NULL);
INSERT INTO tabs VALUES(38,1100,HeyMenu.it,1,1,9999,8,NULL,NULL);
INSERT INTO tabs VALUES(50,1011,Menu,1,0,1,4,NULL,NULL);
INSERT INTO tabs VALUES(51,1011,Carta dei vini,1,0,2,4,NULL,NULL);
INSERT INTO tabs VALUES(52,1011,WishList,0,0,3,3,NULL,NULL);
INSERT INTO tabs VALUES(53,1011,Info,1,1,1,2,NULL,NULL);
INSERT INTO tabs VALUES(54,1011,Servizi Smart,1,1,2,8,NULL,NULL);



DROP TABLE IF EXISTS useraddresses;

CREATE TABLE `useraddresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `address_number` varchar(45) NOT NULL,
  `doorbell` varchar(45) DEFAULT NULL,
  `apartment_number` varchar(45) DEFAULT NULL,
  `floor` varchar(45) DEFAULT NULL,
  `zip_code` int NOT NULL,
  `district_id` int NOT NULL,
  `time_stamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO useraddresses VALUES(1,37,Luca,Campisi,viale liberta',18/A,Campisi Romano,NULL,NULL,43044,1530,2013-12-04 23:27:00);
INSERT INTO useraddresses VALUES(2,37,Valeria,Romano,via pippo,20,Valeria Romano,NULL,NULL,43044,1530,2013-12-04 23:11:32);
INSERT INTO useraddresses VALUES(4,37,Luca,Campisi,Via Sella Nuova,6,Luca Campisi,,,55123,61,2014-02-01 22:30:51);
INSERT INTO useraddresses VALUES(7,37,aaaa,saaaa,aaaaa,aaaa,aaaaa,numero appartamento,piano,55446,61,2014-02-01 22:39:56);
INSERT INTO useraddresses VALUES(8,37,Ciccio,Ingrassia,via tua,numero,citofono,numero appartamento,piano,5521,61,2014-02-01 22:42:10);
INSERT INTO useraddresses VALUES(9,37,pippo,pippo,pippoa,a,pippo,,,33665,61,2014-02-01 22:53:52);
INSERT INTO useraddresses VALUES(10,37,Luca,Campisi,via libertÃ ,18/aa,Campisi-Romano,,,43044,61,2014-02-02 22:12:31);



DROP TABLE IF EXISTS users;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `pre_phone_number` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `confirmation_code` varchar(45) DEFAULT NULL,
  `activated` int DEFAULT '0',
  `image_path_low` varchar(100) DEFAULT 'image/user.png',
  `image_path_high` varchar(100) DEFAULT 'image/user_high.png',
  `activate_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

INSERT INTO users VALUES(14,1001,Fabio,0a1dd3b163a4f1191443d575a1aa5eb6,39,3351820075,fabio@servizismart.com,943530,0,userimage/1_low.jpeg,userimage/1_high.jpeg,2013-11-25 21:54:49);
INSERT INTO users VALUES(32,1001,Luca,f8dc68941c06f179f673c35274eaf233,39,33398564179,luca@servizismart.com,843197,1,image/user.png,image/user_high.png,2013-11-26 00:59:36);
INSERT INTO users VALUES(33,1001,luca,4a61df2efbaa659c0badc65c6febb2ac,39,32918444840,luca@servizismart.com,838665,1,userimage/170_low.jpeg,userimage/170_high.jpeg,2013-11-25 21:54:49);
INSERT INTO users VALUES(34,1001,pippo,d23b2af0115ed272b2459206d205e47b,39,32818444840,a,355075,1,image/user.png,image/user_high.png,2013-11-25 21:54:49);
INSERT INTO users VALUES(35,1001,aa,pippo,39,333,aa,999,0,image/user.png,image/user_high.png,2013-11-26 00:28:35);
INSERT INTO users VALUES(37,1002,lucacampisi@gmail.com,b018a91320b8398a40ca15fc44b8fe68,39,3291844484,,726577,1,image/user.png,image/user_high.png,2020-05-05 08:53:39);



