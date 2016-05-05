USE Hospital;

#Persona
INSERT INTO Persona VALUES (NULL,'F','1994-02-02','Samantha Elizabeth','Villarreal','Rodríguez','8181852408','Claude Monet','6402','64348','Monterrey','Nuevo León','México');
INSERT INTO Persona VALUES (NULL,'F','1967-10-07','Erika Illeana','DiazGonzales','Horak','83105046','Claude Monet','6428','64348','Monterrey','Nuevo León','México');
INSERT INTO Persona VALUES (NULL,'M','1966-05-02','Jose Mauricio','Garcia','Carpinteiro','83105046','Claude Monet','6428','64348','Monterrey','Nuevo León','México');
INSERT INTO Persona VALUES (NULL,'M','1971-10-12','Oscar Jaime','Garcia','Rangel','8117923154','Claude Monet','6410','64348','Monterrey','Nuevo León','México');
INSERT INTO Persona VALUES (NULL,'F','1972-09-10','Leticia Estrella','Aquino','Cárdenaz','8181620850','Claude Monet','6410','64348','Monterrey','Nuevo León','México');
INSERT INTO Persona VALUES (NULL,'M','1971-03-20','Raul','Mata','Gallardo','83687807','Frida Kalho','108','66269','Monterrey','Nuevo León','México');
INSERT INTO Persona VALUES (NULL,'F','1972-01-29','Maribel Lourdes','Maldonado','Alanís','83471471','Hidalgo','200','64060','Monterrey','Nuevo León','México');
INSERT INTO Persona VALUES (NULL,'F','1973-10-10','Sonia','Mejia','Gómez','83471471','Hidalgo','200','64060','Monterrey','Nuevo León','México');
INSERT INTO Persona VALUES (NULL,'M','1986-04-30','Antonio','Caro','Verdujo','10950612','Paseo de los leones','185','NULL','Monterrey','Nuevo León','México');
INSERT INTO Persona VALUES (NULL,'F','1961-08-06','Socorro Elizabeth','Rodríguez','Rívas','8116000785','Claude Monet','6402','64348','Monterrey','Nuevo León','México');
INSERT INTO Persona VALUES (NULL,'M','1960-03-25','Gerardo Valdemar','Villarreal','Cruz','8115316899','Claude Monet','6402','64348','Monterrey','Nuevo León','México');
INSERT INTO Persona VALUES (NULL,'M','1983-02-27','Luis Gerardo','Soto','Martínez','83471471','Hidalgo','200','64060','Monterrey','Nuevo León','México');
INSERT INTO Persona VALUES (NULL,'M','1959-05-15','Jose Ruben','Hinojosa','Ayala','10950612','Escobedo','1405','NULL','Monterrey','Nuevo León','México');
INSERT INTO Persona VALUES (NULL,'M','2000-10-20','Eugenio Valdemar','Villarreal','Rodríguez','14255922','Claude Monet','6402','64348','Monterrey','Nuevo León','México');

#Paciente
INSERT INTO Paciente VALUES (NULL,1);
INSERT INTO Paciente VALUES (NULL,2);
INSERT INTO Paciente VALUES (NULL,3);
INSERT INTO Paciente VALUES (NULL,10);
INSERT INTO Paciente VALUES (NULL,11);
INSERT INTO Paciente VALUES (NULL,14);

#Medico
INSERT INTO Medico VALUES (NULL,'Medico familiar',4);
INSERT INTO Medico VALUES (NULL,'Pediatria',5);
INSERT INTO Medico VALUES (NULL,'Ginecologo',6);
INSERT INTO Medico VALUES (NULL,'Alergología e Inmunología CI',7);
INSERT INTO Medico VALUES (NULL,'Internista',8);
INSERT INTO Medico VALUES (NULL,'Internista',9);
INSERT INTO Medico VALUES (NULL,'Medico familiar',12);
INSERT INTO Medico VALUES (NULL,'Dermatologo',13);

#Cita
INSERT INTO Cita VALUES (NULL,1.55,'m',70,'Kg','2006-03-25','11:30:00','Se le mandan hacer estudios de esterilidad','Consulta medica',2,3);
INSERT INTO Cita VALUES (NULL,1.66,'m',42,'Kg','2015-01-05','18:47:34','NULL','J31.0 Rinitis Cronica',1,4);
INSERT INTO Cita VALUES (NULL,1.65,'m',44,'Kg','2015-01-19','18:43:20','NULL','J30.1 Rinitis Alergica Debida al polen',1,4);
INSERT INTO Cita VALUES (NULL,1.65,'m',45,'Kg','2015-02-23','18:00:00','Se le manda a hacer perfil tiroideo',"'Presion baja, desmayos, baja de peso'",1,5);
INSERT INTO Cita VALUES (NULL,1.55,'m',70,'Kg','2015-05-26','10:00:00',"'Examenes generales : Mamografia , Ultrasonido, Perfil Hormonal'",'Consulta medica',2,3);
INSERT INTO Cita VALUES (NULL,1.56,'m',46,'Kg','2015-10-10','20:00:15','NULL','Colits',1,6);
INSERT INTO Cita VALUES (NULL,1.75,'m',85,'Kg','2008-06-18','11:00:00','Se le manda a hacer exámen de antidoping de 5 drogas','Consulta médica ',3,6);
INSERT INTO Cita VALUES (NULL,1.70,'m',80,'Kg','2011-02-14','8:00:00','NULL','I10 Hipertensión esencia',5,7);
INSERT INTO Cita VALUES (NULL,1.50,'m',70,'Kg','2014-10-07','9:52:45','NULL',"'E78.2 Hiperlipdermia Mixta , M72.5 Fascitis no clasificada en otra parte, M54.5 Lumbago no especificado M17. Gonartosis [Artrosis de la rodilla]'",4,5);
INSERT INTO Cita VALUES (NULL,1.73,'m',56,'Kg','2016-03-09','10:00:00','NULL','Acne',6,8);
INSERT INTO Cita VALUES (NULL,1.74,'m',57,'Kg','2010-03-10','4:00:00','Se le mandan a ahcer analisis de sangre Hemograma','Consulta médica ',6,4);
INSERT INTO Cita VALUES (NULL,1.50,'m',70,'Kg','2009-02-07','9:52:45','se le manda a hacer analiss de sangre de quimica sanguinea','Consulta médica ',4,4);

#LTipo
INSERT INTO LTipo VALUES (NULL,'Cariotipo');
INSERT INTO LTipo VALUES (NULL,'Ultrasonido');
INSERT INTO LTipo VALUES (NULL,'Radiografia');
INSERT INTO LTipo VALUES (NULL,'Hormonas');
INSERT INTO LTipo VALUES (NULL,'Toxicologico');
INSERT INTO LTipo VALUES (NULL,'Sanguínea');

#LTCatalogo
INSERT INTO LTCatalogo VALUES (NULL,'Sangre Periferica',1);
INSERT INTO LTCatalogo VALUES (NULL,' Mamarío Bilateral',2);
INSERT INTO LTCatalogo VALUES (NULL,'Mamografía',3);
INSERT INTO LTCatalogo VALUES (NULL,'Perfil Hormonal',4);
INSERT INTO LTCatalogo VALUES (NULL,'Perfil Tiroideo',4);
INSERT INTO LTCatalogo VALUES (NULL,'Anitdoping',5);
INSERT INTO LTCatalogo VALUES (NULL,'Hemograma',6);
INSERT INTO LTCatalogo VALUES (NULL,'Quimica Sanguínea',6);

#LabTest
INSERT INTO LabTest VALUES (NULL,'2006-03-30','NULL','Especimen : Sangre periferica',1,1);
INSERT INTO LabTest VALUES (NULL,'2015-05-26','NULL','Mamografía',5,2);
INSERT INTO LabTest VALUES (NULL,'2014-06-13','NULL','Mamografía',5,3);
INSERT INTO LabTest VALUES (NULL,'2015-05-30','07:30:00','Perfil Hormonal',5,4);
INSERT INTO LabTest VALUES (NULL,'2015-02-25','09:48:00','Perfil Tiroideo',4,5);
INSERT INTO LabTest VALUES (NULL,'2008-06-18','NULL','Anitdopin 5 Drogas',7,6);
INSERT INTO LabTest VALUES (NULL,'2010-03-29','01:19:00 PM','Hemograma',11,7);
INSERT INTO LabTest VALUES (NULL,'2009-02-14','07:00:00 AM','Quimica Sanguínea',12,8);

#LTCatalogoRes
INSERT INTO LTCatalogoRes VALUES (NULL,'Carotipo','46','46','chromosomas','NULL','NULL','NULL','F','NULL',1);
INSERT INTO LTCatalogoRes VALUES (NULL,'Hormona Foliculo Estimulante','23.0','116.3','mUI/ml','NULL','NULL','NULL','F','NULL',4);
INSERT INTO LTCatalogoRes VALUES (NULL,'Hormona Luteinzante','15.9','54.0','mUI/ml','NULL','NULL','NULL','F','NULL',4);
INSERT INTO LTCatalogoRes VALUES (NULL,'Estradiol','0','32.2','pg/ml','NULL','NULL','NULL','F','NULL',4);
INSERT INTO LTCatalogoRes VALUES (NULL,'T3 Total','0.58','1.58','ng/ml','NULL','NULL','NULL','F','NULL',5);
INSERT INTO LTCatalogoRes VALUES (NULL,'T4 (TIROXINA TOTAL)','4.87','11.72','ug/dl','NULL','NULL','NULL','F','NULL',5);
INSERT INTO LTCatalogoRes VALUES (NULL,'T4 LIBRE ( TIROXINA LIBRE)','0.7','1.48','ng/ml','NULL','NULL','NULL','F','NULL',5);
INSERT INTO LTCatalogoRes VALUES (NULL,'Hormona Estimulante de Tiroides','0.53','4.94','uUI/ml','NULL','NULL','NULL','F','NULL',5);
INSERT INTO LTCatalogoRes VALUES (NULL,'Mamario Bilateral','BIRADS0','BIRADS6','NULL','NULL','NULL','NULL','F',
"BI-RADS 0: Evaluación adicional
BI-RADS 1: Negativa
BI-RADS 2: Benigna
BI-RADS 3: Probablemente benigna
BI-RADS 4: Anormalidad sospechosa
BI-RADS 5: Altamente sugestiva de malignidad
BI-RADS 6: Malignidad conocida",2);
INSERT INTO LTCatalogoRes VALUES (NULL,'Marihuana','Negativo','Positivo','NULL','NULL','NULL','NULL','NULL','NULL',6);
INSERT INTO LTCatalogoRes VALUES (NULL,'Cocaina','Negativo','Positivo','NULL','NULL','NULL','NULL','NULL','NULL',6);
INSERT INTO LTCatalogoRes VALUES (NULL,'Anfetaminas','Negativo','Positivo','NULL','NULL','NULL','NULL','NULL','NULL',6);
INSERT INTO LTCatalogoRes VALUES (NULL,'Metanfetaminas','Negativo','Positivo','NULL','NULL','NULL','NULL','NULL','NULL',6);
INSERT INTO LTCatalogoRes VALUES (NULL,'Opiaceos','Negativo','Positivo','NULL','NULL','NULL','NULL','NULL','NULL',6);
INSERT INTO LTCatalogoRes VALUES (NULL,'Muestra','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',6);
INSERT INTO LTCatalogoRes VALUES (NULL,'PH','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',6);
INSERT INTO LTCatalogoRes VALUES (NULL,'Densidad Urinario','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',6);
INSERT INTO LTCatalogoRes VALUES (NULL,'Metodo','NULL','NULL','NULL','NULL','NULL','NULL','NULL','NULL',6);
INSERT INTO LTCatalogoRes VALUES (NULL,'Globulos Blancos','4.80','10.80','K/uL','NULL','NULL','NULL','NULL','NULL',7);
INSERT INTO LTCatalogoRes VALUES (NULL,'Globulos Roos','4.70','6.00','M/uL','NULL','NULL','NULL','NULL','NULL',7);
INSERT INTO LTCatalogoRes VALUES (NULL,'Hemoglobia','14.00','18.00','g/dL','NULL','NULL','NULL','NULL','NULL',7);
INSERT INTO LTCatalogoRes VALUES (NULL,'Hematocrito','42.00','52.00','%','NULL','NULL','NULL','NULL','NULL',7);
INSERT INTO LTCatalogoRes VALUES (NULL,'VCM','80.00','96.00','fL','NULL','NULL','NULL','NULL','NULL',7);
INSERT INTO LTCatalogoRes VALUES (NULL,'Fosfata Alcalina','38','126','U/L','NULL','NULL','NULL','NULL','NULL',8);
INSERT INTO LTCatalogoRes VALUES (NULL,'GGT','9','64','U/L','NULL','NULL','NULL','NULL','NULL',8);
INSERT INTO LTCatalogoRes VALUES (NULL,'SGOT(AST)','17','59','U/L','NULL','NULL','NULL','NULL','NULL',8);
INSERT INTO LTCatalogoRes VALUES (NULL,'SGPOT(ALT)','21','72','U/L','NULL','NULL','NULL','NULL','NULL',8);

#LTResult
INSERT INTO LTResult VALUES (NULL,'46','Normal','NULL',1,1);
INSERT INTO LTResult VALUES (NULL,'BIRADS2','Normal','Se muestran regiones quisticas que varian entre 3 y 8 mili',2,9);
INSERT INTO LTResult VALUES (NULL,'BIRADS3','Normal',"'Aspecto Benigno, Categoria BI-RADS 2. Se recomienda control anual de mamografía'",3,9);
INSERT INTO LTResult VALUES (NULL,'3.2','Normal','NULL',4,2);
INSERT INTO LTResult VALUES (NULL,'7.36','Normal','NULL',4,3);
INSERT INTO LTResult VALUES (NULL,'128.4','Normal','NULL',4,4);
INSERT INTO LTResult VALUES (NULL,'1.38','Normal','NULL',5,5);
INSERT INTO LTResult VALUES (NULL,'7.89','Normal','NULL',5,6);
INSERT INTO LTResult VALUES (NULL,'1.09','Normal','NULL',5,7);
INSERT INTO LTResult VALUES (NULL,'1.53','Normal','NULL',5,8);
INSERT INTO LTResult VALUES (NULL,'Negativo','Normal','NULL',6,10);
INSERT INTO LTResult VALUES (NULL,'Negativo','Normal','NULL',6,11);
INSERT INTO LTResult VALUES (NULL,'Negativo','Normal','NULL',6,12);
INSERT INTO LTResult VALUES (NULL,'Negativo','Normal','NULL',6,13);
INSERT INTO LTResult VALUES (NULL,'Negativo','Normal','NULL',6,14);
INSERT INTO LTResult VALUES (NULL,'Orina','NULL','NULL',6,15);
INSERT INTO LTResult VALUES (NULL,'5.0','NULL','NULL',6,16);
INSERT INTO LTResult VALUES (NULL,'1.03','NULL','NULL',6,17);
INSERT INTO LTResult VALUES (NULL,'Inmunocramotografia','NULL','NULL',6,18);
INSERT INTO LTResult VALUES (NULL,'10.82','Anormal','fuera del rango del normal',7,19);
INSERT INTO LTResult VALUES (NULL,'3.35','Anormal','fuera del rango del normal',7,20);
INSERT INTO LTResult VALUES (NULL,'9.10','Anormal','fuera del rango del normal',7,21);
INSERT INTO LTResult VALUES (NULL,'27.40','Anormal','fuera del rango del normal',7,22);
INSERT INTO LTResult VALUES (NULL,'81.90','Normal','NULL',7,23);
INSERT INTO LTResult VALUES (NULL,'207','Anormal','fuera del rango del normal',8,24);
INSERT INTO LTResult VALUES (NULL,'291','Anormal','fuera del rango del normal',8,25);
INSERT INTO LTResult VALUES (NULL,'154','Anormal','fuera del rango del normal',8,26);
INSERT INTO LTResult VALUES (NULL,'77','Anormal','fuera del rango del normal',8,27);

#Receta
INSERT INTO Receta VALUES (NULL,'2015-01-05',2);
INSERT INTO Receta VALUES (NULL,'2015-01-19',3);
INSERT INTO Receta VALUES (NULL,'2015-10-10',6);
INSERT INTO Receta VALUES (NULL,'2014-02-11',8);
INSERT INTO Receta VALUES (NULL,'2014-10-07',9);
INSERT INTO Receta VALUES (NULL,'2016-03-09',10);

#LabMedico
INSERT INTO LabMedico VALUES (NULL,'GlaxoSmithKline');
INSERT INTO LabMedico VALUES (NULL,'MSD');
INSERT INTO LabMedico VALUES (NULL,'Laboratorios Serral');
INSERT INTO LabMedico VALUES (NULL,'Sanofi');
INSERT INTO LabMedico VALUES (NULL,'Armstrong');
INSERT INTO LabMedico VALUES (NULL,'Liomont');
INSERT INTO LabMedico VALUES (NULL,'Takeda');
INSERT INTO LabMedico VALUES (NULL,'Carnot ');
INSERT INTO LabMedico VALUES (NULL,'Apotex');
INSERT INTO LabMedico VALUES (NULL,'Silanes');
INSERT INTO LabMedico VALUES (NULL,'Merck');
INSERT INTO LabMedico VALUES (NULL,'ISDIN');
INSERT INTO LabMedico VALUES (NULL,'Ziaja');
INSERT INTO LabMedico VALUES (NULL,'Pierre Fabre');

#CatalogoMedicinas
INSERT INTO CatalogoMedicinas VALUES (NULL,'Aerosol','Avamys2A','Fluticasona','27.5','MCG',1,1);
INSERT INTO CatalogoMedicinas VALUES (NULL,'Tabletas','Singulair','Monteslukast','10','MG',30,2);
INSERT INTO CatalogoMedicinas VALUES (NULL,'Tabletas','Tamex','Loradataina/ Betamentasona','5.0/0.25','MG',10,3);
INSERT INTO CatalogoMedicinas VALUES (NULL,'Tabletas','Calcort','Deflazacort','30','MG',10,4);
INSERT INTO CatalogoMedicinas VALUES (NULL,'Jarabe','Zyplo','Levodropropizins','120','ML',1,5);
INSERT INTO CatalogoMedicinas VALUES (NULL,'Tabletas','Macrozit','Aritromicina','500','MG',3,6);
INSERT INTO CatalogoMedicinas VALUES (NULL,'Comprimidos','Libertrim SII','Trimebutina / Simeticona','100/37.5','MG',20,8);
INSERT INTO CatalogoMedicinas VALUES (NULL,'Sobres','Riopan','Magaldrato/Dimeticona','200','ML',10,7);
INSERT INTO CatalogoMedicinas VALUES (NULL,'Tabletas','SupraDol','Ketorolaco','120','MG',4,6);
INSERT INTO CatalogoMedicinas VALUES (NULL,'Tabletas','Clortalidona','Clortalidona','50','MG',20,9);
INSERT INTO CatalogoMedicinas VALUES (NULL,'Tabletas','Dorsal','Meloxicam / Carisoprodol ','15/200','MG',7,10);
INSERT INTO CatalogoMedicinas VALUES (NULL,'Tabletas','Gavindo','Gabapentina/ Cianocobalmina / Tiamina','300/0.2/100','MG',60,11);
INSERT INTO CatalogoMedicinas VALUES (NULL,'Crema','Ciclopirox-Olamina','Ciclopirox-Olamina','80','MG/ML',1,12);
INSERT INTO CatalogoMedicinas VALUES (NULL,'Crema','Terbinafina','Terbinafina','10','MG',1,13);
INSERT INTO CatalogoMedicinas VALUES (NULL,'Crema','Icorsan','Hidrocortisona','30','GR',1,6);
INSERT INTO CatalogoMedicinas VALUES (NULL,'Crema','Derexyl','Derexyl','250','GR',1,14);

#MedRecetado
INSERT INTO MedRecetado VALUES (NULL,1,12,'Hr',1,'meses','2 disparos en cada nariz',1,1);
INSERT INTO MedRecetado VALUES (NULL,1,24,'Hr',1,'meses','NULL',1,2);
INSERT INTO MedRecetado VALUES (NULL,1,12,'Hr',5,'días','NULL',1,3);
INSERT INTO MedRecetado VALUES (NULL,0.5,12,'Hr',5,'días','NULL',2,4);
INSERT INTO MedRecetado VALUES (NULL,5,8,'Hr',3,'días','5ml',2,5);
INSERT INTO MedRecetado VALUES (NULL,1,24,'Hr',3,'días','NULL',2,6);
INSERT INTO MedRecetado VALUES (NULL,1,12,'Hr',5-7,'días','Antes de comer',3,7);
INSERT INTO MedRecetado VALUES (NULL,1,5,'Hr',3-5,'días','Despues de comer',3,8);
INSERT INTO MedRecetado VALUES (NULL,1,8-12,'Hr',NULL,NULL,'cuando presente dolor',3,9);
INSERT INTO MedRecetado VALUES (NULL,1,24,'Hr',1,'meses','NULL',4,10);
INSERT INTO MedRecetado VALUES (NULL,1,24,'Hr',1,'meses','NULL',4,10);
INSERT INTO MedRecetado VALUES (NULL,1,NULL,'NULL',NULL,NULL,'tomar una díaria despues de la comida',5,11);
INSERT INTO MedRecetado VALUES (NULL,1,NULL,'NULL',NULL,NULL,'tomar por las noches',5,12);
INSERT INTO MedRecetado VALUES (NULL,1,NULL,'NULL',NULL,NULL,'aplicar en uña lesionada',5,13);
INSERT INTO MedRecetado VALUES (NULL,1,NULL,'NULL',NULL,NULL,'Aplicar en la planda del pie e interdigital',5,14);
INSERT INTO MedRecetado VALUES (NULL,1,12,'Hr',10,'días','2 veces al día en áreas afectadas',6,15);
INSERT INTO MedRecetado VALUES (NULL,2,12,'Hr',5,'días','NULL',6,4);
INSERT INTO MedRecetado VALUES (NULL,1,12,'Hr',5,'días','uso diario para piel seca',6,16);