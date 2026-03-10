/**********************************************************************************************************************					
Instituto Nacional de Estadística (INE) www.ine.es					
***********************************************************************************************************************					
					
DESCRIPCIÓN:					
Este programa genera un fichero SAS con formatos, partiendo de un fichero sin ellos.					
					
Consta de las siguientes partes:					
	* 1. Definir la librería de trabajo --> Libname				
	* 2. Definición de formatos --> PROC FORMAT				
	* 3. Vincular formatos a la base de datos --> PASO data				
					
 Entrada:                                                           					
     - Fichero SAS sin formatos: 	 EILU_GRAD_2019.sas7bdat				
 Salida:                                                           					
     - Fichero SAS con formatos: 	 EILU_GRAD_2019_conFormato.sas7bdat				
					
Donde:					
	* Operación: Encuesta de Inserción Laboral de Titulados Universitarios. Graduados universitarios (EILU_GRAD)				
	* Periodo: 2019				
					
************************************************************************************************************************/					
					
/*1) Definir la librería de trabajo: introducir el directorio que desee como librería					
(se da como ejemplo 'C:\Mis resultados'), y copiar en ese directorio el fichero sas "EILU_GRAD_2019.sas7bdat"*/					
					
libname ROutput 'C:\Mis resultados';					

options fmtsearch = (ROutput ROutput.cat1);

* 2) DEFINICIÓN DE FORMATOS;
PROC FORMAT LIBRARY=ROutput.cat1;
value $TSEXO

"1"="Hombre"
"2"="Mujer"
;
value $TEDAD

"1"="Menores de 30 años"
"2"="De 30 a 34 años"
"3"="De 35 y más años"
;
value $TNACIO

"1"="Española"
"2"="Española y otra"
"3"="Otra nacionalidad"
;
value $TNACIOP

"1"="Un país de la UE"
"2"="Un país fuera de la UE"
"9"="NS/NC"
" "="No aplicable"
;
value $TNACIP

"1"="España"
"2"="Otro país de la UE"
"3"="Otro país fuera de la UE"
"9"="NS/NC"
;
value $TRAMA

"1"="Artes y humanidades"
"2"="Ciencias"
"3"="Ciencias sociales y jurídicas"
"4"="Ingeniería y arquitectura"
"5"="Ciencias de la salud"
;
value $TAMBITO

"0112"="Formación de docentes de enseñanza infantil"
"0113"="Formación de docentes de enseñanza primaria"
"011"="Educación (Otros estudios)"
"0211"="Técnicas audiovisuales y medios de comunicación"
"021"="Artes (Otros estudios)"
"022"="Humanidades"
"023"="Lenguas"
"0311"="Economía"
"0313"="Psicología"
"031"="Ciencias sociales y del comportamiento (Otros estudios)"
"032"="Periodismo y documentación"
"0413"="Dirección y administración"
"041"="Negocios y administración (Otros estudios)"
"042"="Derecho"
"051"="Ciencias de la vida"
"052"="Medio ambiente"
"053"="Ciencias químicas, físicas y geológicas"
"054"="Matemáticas y estadística"
"061"="Informática"
"071"="Ingeniería y profesiones afines"
"072"="Industria manufacturera y producción"
"073"="Arquitectura y construcción"
"081"="Agricultura y ganadería"
"082"="Silvicultura"
"084"="Veterinaria"
"0912"="Medicina"
"0913"="Enfermería"
"091"="Salud (Otros estudios)"
"092"="Servicios sociales"
"1014"="Actividades físicas y deportivas"
"1015"="Viajes, turismo y ocio"
"109"="Servicios (Otros estudios)"
"9999"="NS/NC"
"    "="No aplicable"
;
value $TTPUNIV

"1"="Universidad Pública presencial"
"2"="Universidad Pública a distancia"
"3"="Universidad Privada presencial"
"4"="Universidad Privada a distancia"
;
value $T1SINO

"1"="Sí"
"2"="No"
;
value $TPROXY

"1"="Entrevista directa con la persona seleccionada"
"2"="Entrevista proxy"
;
value $T1PAIS

"01"="España"
"02"="Reino Unido"
"03"="Alemania"
"04"="Francia"
"05"="Otro país de la Unión Europea"
"06"="Otro país europeo (fuera de la UE)"
"07"="Un país de América del Norte"
"08"="Un país de América Central o América del Sur"
"09"="Un país de Asia"
"10"="Un país de África"
"11"="Un país de Oceanía"
"99"="NS/NC"
"  "="No aplicable"
;
value $TNFORMA

"1"="No sabe leer o escribir"
"2"="Educación primaria incompleta (ha asistido menos de 5 años a la escuela)"
"3"="Educación primaria completa"
"4"="Primera etapa de Enseñanza Secundaria, con o sin título (ESO, EGB, Bachillerato Elemental)"
"5"="Estudios de Bachillerato (Bachillerato LOGSE, BUP, COU, Preu)"
"6"="Enseñanzas profesionales de grado medio o equivalentes"
"7"="Enseñanzas profesionales de grado superior o equivalentes"
"8"="Estudios universitarios (Diplomatura, Licenciatura, Doctorado) o equivalentes"
"9"="NS/NC"
;
value $T2SINO

"1"="Sí"
"2"="No"
"9"="NS/NC"
" "="No aplicable"
;
value $T2ESTM

"1"="Programa Erasmus"
"2"="Otros programas o becas dentro de la UE"
"3"="Otros programas o becas fuera de la UE"
"9"="NS/NC"
" "="No aplicable"
;
value $T2PAIS

"01"="Reino Unido"
"02"="Alemania"
"03"="Francia"
"04"="Italia"
"05"="Portugal"
"06"="Países Nórdicos (Suecia, Noruega, Finlandia, Dinamarca e Islandia)"
"07"="Otro país de la Unión Europea"
"08"="Otro país europeo"
"11"="Un país de América del Norte"
"12"="Un país de América Central o América del Sur"
"21"="Un país de Asia"
"31"="Un país de África"
"41"="Un país de Oceanía"
"99"="NS/NC"
"  "="No aplicable"
;
value $T4ESTM

"1"="De 1 a 3 meses"
"2"="De 4 a 6 meses"
"3"="De 7 a 9 meses"
"4"="De 10 a 12 meses"
"5"="Más de un año"
"9"="NS/NC"
" "="No aplicable"
;
value $TMOTEST

"1"="Formarse pensando en su futuro laboral"
"2"="Ampliar conocimientos por satisfacción personal"
"3"="Otros motivos"
"9"="NS/NC"
;
value $TNUMEST

"1"="Uno"
"2"="Dos"
"3"="Tres o más"
" "="No aplicable"
;
value $TESTMMN

"1"="Antes de comenzar los estudios de la titulación que finalizó en 2014"
"2"="Durante la realización de los estudios de la titulación que finalizó en 2014"
"3"="Después de obtener la titulación que finalizó en 2014"
"9"="NS/NC"
" "="No aplicable"
;
value $TESTEXT

"1"="Completamente en España"
"2"="Una parte en España y otra parte en el extranjero"
"3"="Completamente en el extranjero"
"9"="NS/NC"
" "="No aplicable"
;
value $TFAMIGS

"01"="Agraria"
"02"="Marítimo-pesquera"
"03"="Industrias alimentarias"
"04"="Química"
"05"="Imagen personal"
"06"="Sanidad"
"07"="Seguridad y medio ambiente"
"08"="Fabricación mecánica"
"09"="Instalación y mantenimiento"
"10"="Electricidad y electrónica"
"11"="Energía y agua"
"12"="Transporte y mantenimiento de vehículos"
"14"="Edificación y obra civil"
"15"="Vidrio y cerámica"
"16"="Madera, mueble y corcho"
"17"="Textil, confección y piel"
"18"="Artes gráficas"
"19"="Imagen y sonido"
"20"="Informática y comunicaciones"
"21"="Administración y gestión"
"22"="Comercio y marketing"
"23"="Servicios socioculturales y a la comunidad"
"24"="Hostelería y turismo"
"25"="Actividades físicas y deportivas (incluidas enseñanzas deportivas de grado superior)"
"26"="Artes y artesanías"
"88"="Estudios artísticos superiores (artes plásticas, diseño, música y danza, arte dramático o conservación y restauración de bienes culturales)"
"99"="NS/NC"
"  "="No aplicable"
;
value $TFAMIGM

"01"="Agraria"
"02"="Marítimo-pesquera"
"03"="Industrias alimentarias"
"04"="Química"
"05"="Imagen personal"
"06"="Sanidad"
"07"="Seguridad y medio ambiente"
"08"="Fabricación mecánica"
"09"="Instalación y mantenimiento"
"10"="Electricidad y electrónica"
"11"="Energía y agua"
"12"="Transporte y mantenimiento de vehículos"
"13"="Industrias extractivas"
"14"="Edificación y obra civil"
"15"="Vidrio y cerámica"
"16"="Madera, mueble y corcho"
"17"="Textil, confección y piel"
"18"="Artes gráficas"
"19"="Imagen y sonido"
"20"="Informática y comunicaciones"
"21"="Administración y gestión"
"22"="Comercio y marketing"
"23"="Servicios socioculturales y a la comunidad"
"24"="Hostelería y turismo"
"25"="Actividades físicas y deportivas (incluidas enseñanzas deportivas de grado medio)"
"88"="Enseñanzas artísticas profesionales"
"99"="NS/NC"
"  "="No aplicable"
;
value $TESTSNT

"1"="Sí, ya ha completado esa formación"
"2"="Sí, esta realizando el MIR o EIR o FIR o PIR, … etc"
"3"="No, pero está preparando el examen de acceso"
"4"="No"
"9"="NS/NC"
" "="No aplicable (Titulación no sanitaria)"
;
value $TESTCRS

"01"="Grado universitario de 180 créditos (3 años)"
"02"="Grado universitario de 240 créditos (4 años)"
"03"="Grado universitario de más de 240 créditos (5 años o más)"
"04"="Máster universitario"
"05"="Doctorado universitario"
"06"="Estudios artísticos superiores (artes plásticas, diseño, música y danza, arte dramático o conservación y restauración de bienes culturales)"
"07"="Ciclos Formativos de grado superior (formación profesional, artes plásticas y diseño) o Enseñanzas Deportivas de Grado Superior"
"08"="Ciclos Formativos de grado medio (formación profesional, artes plásticas y diseño) o Enseñanzas Deportivas de Grado Medio"
"09"="No estoy cursando ninguno de los estudios anteriores"
"99"="NS/NC"
;
value $Tidioma

"01"="Español"
"02"="Catalán"
"03"="Euskera"
"04"="Gallego"
"05"="Valenciano"
"06"="Inglés"
"07"="Francés"
"08"="Alemán"
"09"="Italiano"
"10"="Portugués"
"11"="Rumano"
"12"="Árabe"
"13"="Chino"
"14"="Ruso"
"15"="Otros idiomas"
"99"="NS/NC"
"  "="No aplicable"
;
value $TNUMIDI

"0"="Ninguno"
"1"="1"
"2"="2"
"3"="3"
"4"="4"
"5"="5 o más"
"9"="NS/NC"
;
value $TNivIdi

"1"="Nivel alto (Entiende una gran variedad de textos complicados y usa el idioma con flexibilidad)"
"2"="Nivel medio (Entiende lo esencial en el lenguaje común y redacta textos sencillos)"
"3"="Nivel bajo (Entiende y usa las expresiones más comunes )"
"9"="NS/NC"
" "="No aplicable"
;
value $TIPACRE

"1"="A1 (DELF A1, Fit in Deutsch 1, ….)"
"2"="A2 (DELF A2, Fit in Deutsch 2, …)"
"3"="B1 (PET, DELF B1, ZD, …)"
"4"="B2 (FCE, DELF B2, ZDfB, …)"
"5"="C1 (CAE, DALF C1, PWD, …)"
"6"="C2 (CPE, DALF C2, ZOP, …)"
"9"="NS/NC"
" "="No aplicable"
;
value $TTIC

"1"="Usuario de nivel básico (navegar por internet, enviar correos electrónicos, copiar o mover archivos o carpetas, escribir un texto usando un procesador de textos, usar fórmulas simples en hojas de cálculo)"
"2"="Usuario de nivel intermedio (dar formato a textos, usar fórmulas más avanzadas y crear gráficos en hojas de cálculo, instalar dispositivos y/o programas, usar bases de datos)"
"3"="Usuario de nivel avanzado (escribir macros, programar, resolver problemas de software y hardware cuando el ordenador no funciona adecuadamente)"
"9"="NS/NC"
;
value $TPAIMOV

"01"="Reino Unido"
"02"="Alemania"
"03"="Francia"
"07"="Otro país de la Unión Europea"
"08"="Otro país europeo"
"11"="Un país de América del Norte"
"12"="Un país de América Central o América del Sur"
"21"="Un país de Asia"
"31"="Un país de África"
"41"="Un país de Oceanía"
"88"="No ha residido en ningún otro país"
"99"="NS/NC"
"  "="No aplicable"
;
value $TVIVIRF

"1"="Sí, ya lo ha decidido y se va a ir en los próximos meses"
"2"="Sí, se lo ha planteado y se iría a vivir fuera de España"
"3"="Sí, se lo ha planteado pero ha decidido quedarse a vivir en España"
"4"="No, no se lo ha planteado"
"9"="NS/NC"
" "="No aplicable"
;
value $T1TRBPN

"1"="Trabajando"
"2"="En desempleo"
"3"="Inactivo"
;
value $T2TRBPN

"1"="Estudiante (estudiante o preparando oposiciones)"
"2"="Jubilado"
"3"="Incapacitado para trabajar"
"4"="Dedicado a las labores del hogar"
"5"="Otra situación"
"9"="NS/NC"
" "="No aplicable"
;
value $T1MOBUT

"1"="Antes de acabar los estudios de la titulación que finalizó en 2014"
"2"="Después de acabar los estudios de la titulación que finalizó en 2014"
"9"="NS/NC"
" "="No aplicable"
;
value $T1TIEMP

"1"="Menos de tres meses"
"2"="De 3 a 6 meses"
"3"="De 6 meses a 1 año"
"4"="De 1 año a año y medio"
"5"="De 1 año y medio a 2 años"
"6"="2 ó más años"
"9"="NS/NC"
" "="No aplicable"
;
value $TIMPORT

"1"="Nada importante"
"2"="Poco importante"
"3"="Bastante importante"
"4"="Muy importante"
"9"="NS/NC"
" "="No aplicable"
;
value $TStProf

"1"="Trabajador en prácticas, formación (incluido MIR, EIR, FIR,…) o becario"
"2"="Asalariado con trabajo permanente o contrato de trabajo de duración indefinida"
"3"="Asalariado con trabajo temporal o contrato de trabajo de duración determinada"
"4"="Empresario con asalariados"
"5"="Trabajador independiente o empresario sin asalariados"
"6"="Ayuda en la empresa o negocio familiar"
" "="No aplicable"
;
value $TJornad

"1"="A tiempo parcial"
"2"="A tiempo completo"
"9"="NS/NC"
" "="No aplicable"
;
value $TTamano

"0"="Trabajadores independientes o autónomos sin asalariados"
"1"="De 1 a 9 personas"
"2"="Entre 10 y 19 personas"
"3"="Entre 20 y 49 personas"
"4"="Entre 50 y 249 personas"
"5"="250 o más personas"
"9"="NS/NC"
" "="No aplicable"
;
value $TAnio

"9999"="NS/NC"
"    "="No aplicable"
;
value $TSUELDO

"1"="Menos de 700 euros"
"2"="De 700 a 999 euros"
"3"="De 1.000 a 1.499 euros"
"4"="De 1.500 a 1.999 euros"
"5"="De 2.000 a 2.499 euros"
"6"="De 2.500 a 2.999 euros"
"7"="De 3.000 euros en adelante"
"9"="NS/NC"
" "="No aplicable"
;
value $TNivEst

"1"="Doctorado"
"2"="Máster"
"3"="Título universitario (excepto doctorado o máster)"
"4"="Formación profesional de grado superior"
"5"="Formación profesional de grado medio/ bachillerato"
"6"="Formación profesional básica"
"7"="ESO, EGB, etc."
"9"="NS/NC"
" "="No aplicable"
;
value $TAreEst

"1"="Exclusivamente su propia área de estudios"
"2"="Su propia área o alguna relacionada"
"3"="Un área totalmente diferente"
"4"="Ningún área en particular"
"9"="NS/NC"
" "="No aplicable"
;
value $TFacTrb

"1"="Nada"
"2"="Poco"
"3"="Algo"
"4"="Bastante"
"5"="Mucho"
"9"="NS/NC"
" "="No aplicable"
;
value $T3SiNo

"1"="Sí"
"2"="No, pero está esperando respuesta a solicitudes anteriores de empleo o los resultados de una oposición"
"3"="No"
"9"="NS/NC"
" "="No aplicable"
;
value $TPRAC

"1"="Sí, como parte del plan de estudios"
"2"="Sí, fuera del plan de estudios"
"3"="Sí, ambos tipos de prácticas"
"4"="No"
;
value $T2TIEMP

"0"="Continuó al menos 6 meses más en el trabajo que tenía mientras estudiaba"
"1"="Menos de tres meses"
"2"="De 3 a 6 meses"
"3"="De 6 meses a 1 año"
"4"="De 1 año a año y medio"
"5"="De 1 año y medio a 2 años"
"6"="2 ó más años"
"9"="NS/NC"
" "="No aplicable"
;
value $T2MOBUT

"0"="Continuó al menos 6 meses más en el trabajo que tenía mientras estudiaba"
"1"="Antes de terminar los estudios de la titulación que finalizó en 2014"
"2"="Después de terminar los estudios de la titulación que finalizó en 2014"
"9"="NS/NC"
" "="No aplicable"
;
value $T3TIEMP

"1"="Menos de 6 meses"
"2"="De 6 meses a 1 año"
"3"="De 1 año a año y medio"
"4"="De 1 año y medio a 2 años"
"5"="2 o más años"
"9"="NS/NC"
" "="No aplicable"
;
value $TNmEmpl

"11"="11 o más"
"99"="NS/NC"
"  "="No aplicable"
;
value $TESTCIV

"1"="Soltero"
"2"="Casado"
"3"="Viudo"
"4"="Separado"
"5"="Divorciado"
"9"="NS/NC"
;
value $TNPER

"6"="6 o más"
"9"="NS/NC"
" "="No aplicable"
;
value $TTIPO

"1"="Hogar unipersonal"
"2"="Padre o madre solo/a que convive con algún hijo menor de 25 años"
"3"="Padre o madre solo/a que convive con todos sus hijos de 25 años o más"
"4"="Pareja sin hijos que convivan en el hogar"
"5"="Pareja con algún hijo menor de 25 años y que conviven en el hogar"
"6"="Pareja con algún hijo menor pero todos de 25 años ó más y que conviven en el hogar"
"7"="Pareja, o un padre/madre, que conviven con hijos menores de 25 años, y otras personas"
"8"="Otro tipo de hogar"
"9"="NS/NC"
;
value $TCOTIZ

"1"="Por cuenta propia"
"2"="Por cuenta ajena"
"3"="Por cuenta propia y ajena"
" "="No aplicable"
;
value $TQuintl

"1"="Primer quintil"
"2"="Segundo quintil"
"3"="Tercer quintil"
"4"="Cuarto quintil"
"5"="Quinto quintil"
"9"="NS/NC"
" "="No aplicable"
;
value $TNuCurs

"0"="No ha realizado ningún curso de formación del SEPE"
"1"="Un curso de formación del SEPE"
"2"="Dos cursos de formación del SEPE"
"3"="Tres cursos de formación del SEPE"
"4"="Cuatro cursos de formación del SEPE"
"5"="Cinco cursos de formación del SEPE"
"6"="Seis cursos de formación del SEPE"
;
value $TDsCurs

"01"="Administración y gestión"
"02"="Actividades físicas y deportivas"
"03"="Agraria"
"04"="Artes gráficas"
"05"="Artes y artesanías"
"06"="Comercio y marketing"
"07"="Electricidad y electrónica"
"08"="Energía y agua"
"09"="Edificación y obra civil"
"10"="Formación complementaria"
"11"="Fabricación mecánica"
"12"="Hostelería y turismo"
"13"="Industrias extractivas"
"14"="Informática y comunicaciones"
"15"="Instalación y mantenimiento"
"16"="Imagen personal"
"17"="Imagen y sonido"
"18"="Industrias alimentarias"
"19"="Madera, mueble y corcho"
"20"="Marítimo pesquera"
"21"="Química"
"22"="Sanidad"
"23"="Seguridad y medioambiente"
"24"="Servicios socioculturales y a la comunidad"
"25"="Textil, confección y piel"
"26"="Transporte y mantenimiento de vehículos"
"27"="Vidrio y cerámica"
"99"="NS/NC"
" "="No aplicable"
;
value $TDrCurs

"1"="200 horas o menos"
"2"="De 201 a 300 horas"
"3"="De 301 a 500 horas"
"4"="Más de 500 horas"
" "="No aplicable"
;
value $TReCurs

"1"="Abandona por colocación"
"2"="Abandona por otras causas"
"3"="Termina con evaluación positiva"
"4"="Termina con evaluación negativa"
" "="No aplicable"
;
value $TAnCurs

" "="No aplicable"
;
value $TTITULA

"011101"="Pedagogía"
"011201"="Educación infantil"
"011301"="Educación primaria"
"011401"="Otros maestros"
"011901"="Educación social"
"021101"="Audiovisual, imagen y multimedia"
"021201"="Diseño"
"021301"="Bellas artes"
"021302"="Historia del arte"
"021401"="Conservación y restauración"
"021502"="Música y Artes escénicas"
"022201"="Arqueología"
"022202"="Historia"
"022301"="Filosofía"
"022901"="Humanidades"
"023101"="Lengua inglesa"
"023102"="Lenguas clásicas"
"023103"="Otras lenguas extranjeras"
"023104"="Traducción e interpretación"
"023201"="Lenguas y dialectos españoles"
"023202"="Literatura"
"023901"="Lenguas modernas y aplicadas"
"031101"="Economía"
"031201"="Política y gestión pública"
"031202"="Relaciones internacionales"
"031301"="Psicología"
"031401"="Antropología social y cultural y Estudios y gestión de la cultura"
"031402"="Criminología"
"031404"="Geografía"
"031406"="Sociología e Igualdad de género"
"032101"="Comunicación"
"032102"="Periodismo"
"032201"="Información y documentación"
"041201"="Financiera y actuarial"
"041202"="Finanzas y contabilidad"
"041301"="Administración y empresa"
"041302"="Ciencias del trabajo"
"041303"="Gestión y administración pública"
"041401"="Marketing"
"041402"="Protocolo y eventos"
"041403"="Publicidad y relaciones públicas"
"041601"="Comercio"
"042101"="Derecho"
"051101"="Biología"
"051201"="Bioquímica"
"051202"="Biotecnología"
"051901"="Biomedicina"
"052101"="Ciencias ambientales"
"053101"="Química"
"053201"="Ciencias del mar"
"053202"="Geografía y ordenación del territorio"
"053203"="Geología"
"053301"="Física"
"054101"="Matemáticas"
"054201"="Estadística"
"061301"="Desarrollo de software y de aplicaciones e Ingeniería multimedia"
"061901"="Informática"
"071101"="Ingeniería química industrial e Ingeniería medioambiental"
"071301"="Ingeniería de la energía"
"071302"="Ingeniería eléctrica"
"071401"="Ingeniería de computadores"
"071402"="Ingeniería de sonido e imagen"
"071403"="Ingeniería de telecomunicación"
"071404"="Ingeniería electrónica industrial y automática"
"071405"="Ingeniería en electrónica"
"071501"="Ingeniería en diseño industrial y desarrollo del producto"
"071502"="Ingeniería en tecnologías industriales"
"071503"="Ingeniería mecánica"
"071601"="Ingeniería aeronáutica"
"071603"="Ingeniería naval y oceánica"
"071901"="Ingeniería de organización industrial y Nanotecnología"
"072101"="Ciencia y tecnología de los alimentos e Ingeniería alimentaria"
"072102"="Enología"
"072201"="Ingeniería de materiales e Ingeniería textil"
"072401"="Ingeniería de minas y energía"
"073101"="Arquitectura y Urbanismo y paisajismo"
"073102"="Ingeniería geomática, topografía y cartografía"
"073201"="Arquitectura técnica"
"073202"="Ingeniería civil"
"081102"="Ingeniería agraria y agroalimentaria"
"081103"="Ingeniería agrícola, agropecuaria y medio rural"
"081201"="Ingeniería horticultura y jardinería"
"082101"="Ingeniería forestal y montes"
"084101"="Veterinaria"
"091101"="Odontología"
"091201"="Medicina"
"091301"="Enfermería"
"091401"="Ingeniería biomédica y de la salud"
"091402"="Óptica y optometría"
"091501"="Fisioterapia"
"091502"="Logopedia"
"091503"="Nutrición humana y dietética"
"091504"="Podología"
"091505"="Terapia ocupacional"
"091601"="Farmacia"
"092301"="Trabajo social"
"101401"="Actividad física y del deporte"
"101501"="Turismo"
"104101"="Náutica y transporte marítimo"
"104103"="Servicio de transporte terrestre y Servicio de transporte aéreo"
"109999"="Servicios (otros estudios)"
;
value $TOcupac

"11"="Miembros del poder ejecutivo y de los cuerpos legislativos; directivos de la Administración Pública y organizaciones de interés social; directores ejecutivos"
"12"="Directores de departamentos administrativos y comerciales (directores financieros, directores de recursos humanos, directores comerciales, directores de publicidad, directores de desarrollo,…)"
"13"="Directores de producción y operaciones: Directores de producción de explotaciones agropecuarias, forestales y pesqueras, y de industrias manufactureras, de minería, construcción,…; Directores de servicios de TIC y de empresas de servicios profesionales"
"14"="Directores y gerentes de empresas de alojamiento, restauración y comercio"
"15"="Directores y gerentes de otras empresas de servicios no clasificados bajo otros epígrafes: Directores y gerentes de empresas de actividades recreativas, culturales y deportivas; Directores y gerentes de empresas de gestión de residuos y de otros servicios no clasificados bajo otros epígrafes"
"21"="Profesionales de la salud: Médicos; Profesionales de enfermería y partería; Veterinarios; Farmacéuticos; Otros profesionales de la salud (odontólogos, fisioterapeutas, dietistas, logopedas,…)"
"22"="Profesionales de la enseñanza infantil, primaria, secundaria y postsecundaria: Profesores de universidades y otra enseñanza superior; Profesores de formación profesional; Profesores de enseñanza secundaria; Profesores de enseñanza primaria; Maestros y educadores de enseñanza infantil"
"23"="Otros profesionales de la enseñanza: Profesores y técnicos de educación especial; Otros profesores y profesionales de la enseñanza (profesores de enseñanza no reglada de idiomas, música y danza, artes…, profesionales de la educación ambiental, …)"
"24"="Profesionales de la ciencias físicas, químicas, matemáticas y de las ingenierías: Físicos, químicos, matemáticos y afines; Profesionales en ciencias naturales (biólogos, ingenieros agrónomos, de montes, técnicos agrícolas, …); Ingenieros; Arquitectos, urbanistas e ingenieros geógrafos; Ingenieros técnicos; Arquitectos técnicos, topógrafos y diseñadores"
"25"="Profesionales en derecho: Jueces, magistrados, abogados y fiscales; Otros profesionales del derecho (notarios y registradores, procuradores, …)"
"26"="Especialistas en organización de la Administración Pública y de las empresas y en la comercialización: Especialistas en finanzas; Especialistas en organización y administración; Técnicos de empresas y actividades turísticas; Profesionales de ventas técnicas y médicas (excepto las TIC); Otros profesionales de las ventas, la comercialización, la publicidad y las relaciones públicas"
"27"="Profesionales de las tecnologías de la información: Analistas y diseñadores de software y multimedia; Especialistas en bases de datos y en redes informáticas"
"28"="Profesionales en ciencias sociales: Economistas; Sociólogos, historiadores, psicólogos y otros profesionales en ciencias sociales (geógrafos, antropólogos, arqueólogos, filósofos, profesionales en ciencias políticas…); Sacerdotes de las distintas religiones"
"29"="Profesionales de la cultura y el espectáculo: Archivistas, bibliotecarios, conservadores y afines; Escritores, periodistas y lingüistas (filólogos, intérpretes y traductores); Artistas creativos e interpretativos (compositores, músicos, cantantes, coreógrafos, bailarines, directores de cine, de teatro y afines, actores, locutores de radio, televisión, profesionales de espectáculos taurinos, ...)"
"31"="Técnicos de las ciencias y de las ingenierías: Delineantes y dibujantes técnicos; Técnicos de las ciencias físicas, químicas, medioambientales y de las ingenierías; Técnicos en control de procesos (técnicos en instalaciones de producción de energía, en instalaciones de tratamiento de residuos, aguas, técnicos de refinerías de petróleo y gas natural,...); Técnicos de las ciencias naturales y profesionales auxiliares afines; Profesionales en navegación marítima y aeronáutica; Técnicos de control de calidad de las ciencias físicas, químicas y de las ingenierías"
"32"="Supervisores en ingeniería de minas, de industrias manufactureras y de la construcción"
"33"="Técnicos sanitarios y profesionales de las terapias alternativas: Técnicos sanitarios de laboratorio, pruebas diagnósticas y prótesis; Otros técnicos sanitarios (técnicos superiores en higiene bucodentasl en documentación sanitaria, en dietética, ayudantes de veterinaria, ...); Profesionales de las terapias alternativas (profesionales de la acupuntura, la naturopatía, la homeopatía, ...)"
"34"="Profesionales de apoyo en finanzas y matemáticas (Profesionales de apoyo e intermediarios de cambio, bolsa y finanzas; Comerciales de préstamos y créditos; Tenedores de libros; Profesionales de apoyo en servicios estadísticos, matemáticos y afines; Tasadores)"
"35"="Representantes, agentes comerciales y afines (Mediadores y agentes de seguros; Consignatarios; Representantes de aduanas; Organizadores de conferencias y eventos; Agentes o intermediarios en la contratación de la mano de obra; Portavoces y agentes de relaciones públicas)"
"36"="Profesionales de apoyo a la gestión administrativa; técnicos de las fuerzas y cuerpos de seguridad: Asistentes administrativos y especializados (Supervisores de secretaría, secretarios de centros médicos o clínicas,...); Agentes de aduanas, tributos y afines que trabajan en tareas propias de la Administración Pública; Técnicos de las fuerzas y cuerpos de seguridad (técnicos de la policía nacional, autonómica y local, suboficiales de la guardia civil)"
"37"="Profesionales de apoyo de servicios jurídicos, sociales, culturales, deportivos y afines: Profesionales de apoyo de servicios jurídicos y sociales (detectives privados, animadores comunitarios, auxiliares laicos de las religiones,…); Deportistas, entrenadores, instructores de actividades deportivas; monitores de actividades recreativas; Técnicos y profesionales de apoyo de actividades culturales, artísticas y culinarias (fotógrafos, diseñadores y decoradores de interior, chefs,...)"
"38"="Técnicos de las tecnologías de la información y las comunicaciones (TIC): Técnicos en operaciones de tecnologías de la información y asistencia al usuario; Programadores informáticos; Técnicos en grabación audiovisual, radiodifusión y telecomunicaciones"
"41"="Empleados en servicios contables, financieros, y de servicios de apoyo a la producción y al transporte (Empleados de contabilidad, de control de personal y nóminas, de oficina de servicios estadísticos, financieros y bancarios, de control de abastecimientos e inventario, de logística y transporte de pasajeros y mercancías, ...)"
"42"="Empleados de bibliotecas, servicios de correos y afines"
"43"="Otros empleados administrativos sin tareas de atención al público (grabadores de datos, empleados administrativos sin tareas de atención al público no clasificados bajo otros epígrafes)"
"44"="Empleados de agencias de viajes, recepcionistas y telefonistas; empleados de ventanilla y afines (excepto taquilleros): Empleados de información y recepcionistas (excepto de hoteles); Empleados de agencias de viajes, recepcionistas de hoteles y telefonistas; Agentes de encuestas; Empleados de ventanilla y afines (excepto taquilleros) (cajeros de bancos, empleados de sala de juegos, empleados de mostrador de correos,...)"
"45"="Empleados administrativos con tareas de atención al público no clasificados bajo otros epígrafes"
"50"="Camareros y cocineros propietarios"
"51"="Trabajadores asalariados de los servicios de restauración: Cocineros asalariados; Camareros asalariados"
"52"="Dependientes en tiendas y almacenes: Jefes de sección de tiendas y almacenes; Vendedores en tiendas y almacenes"
"53"="Comerciantes propietarios de tiendas"
"54"="Vendedores (excepto en tiendas y almacenes): Vendedores en quioscos o en mercadillos; Operadores de telemarketing; Expendedores de gasolineras; Otros vendedores (vendedores a domicilio, promotores de venta, modelos de moda, arte y publicidad,…)"
"55"="Cajeros y taquilleros (excepto bancos)"
"56"="Trabajadores de los cuidados a las personas en servicios de salud: Auxiliares de enfermería; Técnicos auxiliares de farmacia y emergencias sanitarias y otros trabajadores de los cuidados a las personas en servicios de salud"
"57"="Otros trabajadores de los cuidados a las personas: Trabajadores de los cuidados personales a domicilio; Cuidadores de niños (en guarderías y centros educativos, en domicilios)"
"58"="Trabajadores de los servicios personales: Peluqueros y especialistas en tratamientos de estética, bienestar y afines; Trabajadores que atienden a viajeros, guías turísticos y afines (auxiliares de vuelo y camareros de avión, barco y tren, revisores y cobradores de transporte terrestre, acompañantes turísticos, azafatos de tierra,...); Supervisores de mantenimiento y limpieza de edificios, conserjes y mayordomos domésticos; Trabajadores propietarios de pequeños alojamientos; Otros trabajadores de servicios personales (empleados de pompas fúnebres y embalsamadores, cuidadores de animales y adiestradores, instructores de autoescuela, astrólogos, adivinadores,...)"
"59"="Trabajadores de los servicios de protección y seguridad: Guardias civiles; Policías (nacionales, autonómicos y locales); Bomberos; Personal de seguridad privado; Otros trabajadores de los servicios de protección y seguridad (vigilantes de prisiones, bañistas-socorristas, agentes forestales y medioambientales,...)"
"61"="Trabajadores cualificados en actividades agrícolas"
"62"="Trabajadores cualificados en actividades ganaderas, (incluidas avícolas, apícolas y similares)"
"63"="Trabajadores cualificados en actividades agropecuarias mixtas"
"64"="Trabajadores cualificados en actividades forestales, pesqueras y cinegéticas"
"71"="Trabajadores en obras estructurales de construcción y afines: Trabajadores en hormigón, encofradores, ferrallistas y afines; Albañiles, canteros, tronzadores, labrantes y grabadores de piedras; Carpinteros (excepto ebanistas y montadores de estructuras metálicas); Otros trabajadores de las obras estructurales de construcción (mantenedores de edificios, instaladores de fachadas técnicas, instaladores de sistemas de impermeabilización en edificios,...)"
"72"="Trabajadores de acabado de construcciones e instalaciones (excepto electricistas), pintores y afines: Escayolistas y aplicadores de revestimientos de pasta y mortero; Fontaneros e instaladores de tuberías; Pintores, empapeladores y afines; Soladores, colocadores de parquet y afines; Mecánicos-instaladores de refrigeración y climatización; Otros trabajadores de acabado en la construcción, instalaciones (excepto electricistas) y afines (montadores de cubiertas, cristaleros, montadores-instaladores de placas de energía solar, personal de limpieza de fachadas de edificios y chimeneas,...)"
"73"="Soldadores, chapistas, montadores de estructuras metálicas, herreros, elaboradores de herramientas y afines: Moldeadores, soldadores, chapistas, montadores de estructuras metálicas y trabajadores afines; Herreros y trabajadores de la fabricación de herramientas y afines"
"74"="Mecánicos y ajustadores de maquinaria (vehículos de motor, motores de avión, maquinaria agrícola e industrial, maquinaria naval y ferroviaria, reparadores de bicicletas,…)"
"75"="Trabajadores especializados en electricidad y electrotecnología: Electricistas de la construcción y afines; Otros instaladores y reparadores de equipos eléctricos; Instaladores y reparadores de equipos electrónicos y de telecomunicaciones"
"76"="Mecánicos de precisión en metales, ceramistas, vidrieros, artesanos y trabajadores de artes gráficas: Mecánicos de precisión en metales, ceramistas, vidrieros y artesanos (relojeros, afinadores de instrumentos musicales, joyeros, alfareros, sopladores de vidrio, rotulistas, artesanos en madera, cesteros, artesanos en tejidos, cueros y materiales similares,...); Oficiales y operarios de las artes gráficas (trabajadores de procesos de preimpresión, impresión, encuadernación)"
"77"="Trabajadores de la industria de la alimentación, bebidas y tabaco (matarifes, trabajadores de las industrias del pescado, panaderos, pasteleros, trabajadores del tratamiento de la leche, trabajadores de la elaboración de bebidas, catadores, …)"
"78"="Trabajadores de la madera, textil, confección, piel, cuero, calzado y otros operarios en oficios: Trabajadores que tratan la madera y afines; Ebanistas y trabajadores afines; Trabajadores del textil, confección, piel, cuero y calzado; Pegadores, buceadores, probadores de productos y otros operarios y artesanos diversos"
"81"="Operadores de instalaciones y maquinaria fijas: Operadores en instalaciones de la extracción y explotación de minerales; Operadores en instalaciones para el tratamiento de metales; Operadores de instalaciones y máquinas de productos químicos, farmacéuticos y materiales fotosensibles; Operadores en instalaciones para el tratamiento y transformación de la madera, la fabricación de papel, productos de papel y caucho o materias plásticas; Operadores de máquinas para fabricar productos textiles y artículos de piel y de cuero; Operadores de máquinas para elaborar productos alimenticios, bebidas y tabaco; Operadores de máquinas de lavandería y tintorería; Otros operadores de instalaciones y maquinaria fijas"
"82"="Montadores y ensambladores en fábricas (de maquinaria mecánica, de equipos eléctricos y electróncios,…)"
"83"="Maquinistas de locomotoras, operadores de maquinaria agrícola y de equipos pesados móviles, y marineros: Maquinistas de locomotoras y afines; Operadores de maquinaria agrícola y forestal móvil; Operadores de otras máquinas móviles (maquinaria de movimientos de tierras, grúas, montacargas, carretillas elevadoras,...); Marineros de puente, marineros de máquinas y afines"
"84"="Conductores de vehículos para el transporte urbano o por carretera: Conductores de automóviles, taxis y furgonetas; Conductores de autobuses y tranvías; Conductores de camiones; Conductores de motocicletas y ciclomotores"
"91"="Empleados domésticos"
"92"="Otro personal de limpieza: Personal de limpieza de oficinas, hoteles y otros establecimientos similares; Limpiadores de vehículos, ventanas y personal de limpieza a mano"
"93"="Ayudantes de preparación de alimentos: Ayudantes de cocina; Preparadores de comidas rápidas"
"94"="Recogedores de residuos urbanos, vendedores callejeros y otras ocupaciones elementales en servicios: Vendedores callejeros; Repartidores de publicidad, limpiabotas y otros trabajadores de oficios callejeros; Ordenanzas, mozos de equipaje, repartidores a pie y afines; Recogedores de residuos, clasificadores de desechos, barrenderos y afines; Otras ocupaciones elementales"
"95"="Peones agrarios, forestales y de la pesca: Peones agrícolas; Peones ganaderos; Peones agropecuarios; Peones de la pesca, la acuicultura, forestales y de la caza"
"96"="Peones de la construcción y de la minería"
"97"="Peones de las industrias manufactureras"
"98"="Peones del transporte, descargadores y reponedores"
"00"="Ocupaciones militares: Oficiales y suboficiales de las fuerzas armadas; Tropa y marinería de las fuerzas armadas"
"99"="NS/NC"
"  "="No aplicable"
;
value $TCNAE

"AA"="Agricultura, ganadería, silvicultura y pesca"
"BB"="Industrias extractivas"
"CC"="Industria manufacturera"
"DD"="Suministro de energía eléctrica, gas, vapor y aire acondicionado"
"EE"="Suministro de agua, actividades de saneamiento, gestión de residuos y descontaminación"
"FF"="Construcción e ingeniería civil"
"GG"="Comercio al por mayor y al por menor; reparación de vehículos de motor y motocicletas"
"HH"="Transporte, almacenamiento, actividades postales y de correos"
"II"="Hostelería"
"JJ"="Información y comunicaciones (actividades de edición, cinematográficas, de vídeo, de sonido, programas de televisión, telecomunicaciones, programación informática y servicios de información)"
"KK"="Actividades financieras y de seguros"
"LL"="Actividades inmobiliarias"
"M1"="Actividades profesionales, científicas y técnicas"
"M2"="Actividades de fotografía"
"M3"="Actividades veterinarias"
"N1"="Actividades de alquiler"
"N2"="Actividades relacionadas con el empleo"
"N3"="Actividades de agencias de viajes, operadores turísticos, servicios de reservas y actividades relacionadas con los mismos"
"N4"="Actividades de seguridad e investigación"
"N5"="Servicios a edificios y actividades de jardinería"
"N6"="Actividades administrativas de oficina y otras actividades auxiliares a las empresas"
"OO"="Administración Pública y defensa; Seguridad Social obligatoria"
"PP"="Educación"
"QQ"="Actividades sanitarias y de servicios sociales"
"RR"="Actividades artísticas, culturales, recreativas, deportivas y de entrenimiento"
"S1"="Actividades asociativas y sindicales"
"S2"="Reparación de ordenadores"
"S3"="Efectos personales y artículos de uso doméstico y otros servicios personales (lavado y limpieza de prendas, peluquería y otros tratamientos de belleza, pompas fúnebres y actividades relacionadas)"
"S4"="Actividades de mantenimiento físico"
"TT"="Particulares como empleadores de personal doméstico; particulares como productores de bienes y servicios para uso propio"
"UU"="Actividades de organizaciones y organismos extraterritoriales"
"99"="NS/NC"
"  "="No aplicable"
;

* 3) VINCULAR FORMATOS A LA BASE DE DATOS;
data ROutput.EILU_GRAD_2019_ConFormato;
	set ROutput.EILU_GRAD_2019;

FORMAT SEXO $TSEXO.;
FORMAT EDAD $TEDAD.;
FORMAT NACIO $TNACIO.;
FORMAT NACIO1 $TNACIOP.;
FORMAT NACIO2 $TNACIOP.;
FORMAT PAIS_NACI $TNACIP.;
FORMAT TITU $TTITULA.;
FORMAT RAMA $TRAMA.;
FORMAT AMBITO $TAMBITO.;
FORMAT T_UNIV $TTPUNIV.;
FORMAT DISCA $T1SINO.;
FORMAT PROXY $TPROXY.;
FORMAT LUG_RES_PAIS $T1PAIS.;
FORMAT PAIS_NAC_PADRE $TNACIP.;
FORMAT ESTUDIOS_PADRE $TNFORMA.;
FORMAT PAIS_NAC_MADRE $TNACIP.;
FORMAT ESTUDIOS_MADRE $TNFORMA.;
FORMAT EST_B1 $T2SINO.;
FORMAT EST_B2_1 $T2SINO.;
FORMAT EST_B2_2 $T2SINO.;
FORMAT EST_B2_3 $T2SINO.;
FORMAT EST_B2_4 $T2SINO.;
FORMAT EST_B2_5 $T2SINO.;
FORMAT EST_M1 $T2SINO.;
FORMAT EST_M2 $T2ESTM.;
FORMAT EST_M3 $T2PAIS.;
FORMAT EST_M4 $T4ESTM.;
FORMAT EST_MES $T2SINO.;
FORMAT EST_B8 $TMOTEST.;
FORMAT SAT1 $T2SINO.;
FORMAT SAT2 $T2SINO.;
FORMAT EST_B11_1 $T1SINO.;
FORMAT EST_B11_2 $T1SINO.;
FORMAT EST_B11_3 $T1SINO.;
FORMAT EST_B11_4 $T1SINO.;
FORMAT EST_B11_5 $T1SINO.;
FORMAT EST_B11_6 $T1SINO.;
FORMAT EST_B11_7 $T1SINO.;
FORMAT EST_B12 $TNUMEST.;
FORMAT EST_B13_AMB1 $TAMBITO.;
FORMAT EST_B14_1 $TESTMMN.;
FORMAT EST_B15_1 $TESTEXT.;
FORMAT EST_B13_AMB2 $TAMBITO.;
FORMAT EST_B14_2 $TESTMMN.;
FORMAT EST_B15_2 $TESTEXT.;
FORMAT EST_B13_AMB3 $TAMBITO.;
FORMAT EST_B14_3 $TESTMMN.;
FORMAT EST_B15_3 $TESTEXT.;
FORMAT EST_B16 $TNUMEST.;
FORMAT EST_B17_M1 $TRAMA.;
FORMAT EST_B18_1 $TESTMMN.;
FORMAT EST_B19_1 $TESTEXT.;
FORMAT EST_B17_M2 $TRAMA.;
FORMAT EST_B18_2 $TESTMMN.;
FORMAT EST_B19_2 $TESTEXT.;
FORMAT EST_B17_M3 $TRAMA.;
FORMAT EST_B18_3 $TESTMMN.;
FORMAT EST_B19_3 $TESTEXT.;
FORMAT EST_B21 $TRAMA.;
FORMAT EST_B22 $TESTMMN.;
FORMAT EST_B23 $TESTEXT.;
FORMAT EST_B24 $TNUMEST.;
FORMAT EST_B25_FA1 $TFAMIGS.;
FORMAT EST_B26_1 $TESTMMN.;
FORMAT EST_B27_1 $TESTEXT.;
FORMAT EST_B25_FA2 $TFAMIGS.;
FORMAT EST_B26_2 $TESTMMN.;
FORMAT EST_B27_2 $TESTEXT.;
FORMAT EST_B25_FA3 $TFAMIGS.;
FORMAT EST_B26_3 $TESTMMN.;
FORMAT EST_B27_3 $TESTEXT.;
FORMAT EST_B28 $TNUMEST.;
FORMAT EST_B29_FA1 $TFAMIGM.;
FORMAT EST_B30_1 $TESTMMN.;
FORMAT EST_B31_1 $TESTEXT.;
FORMAT EST_B29_FA2 $TFAMIGM.;
FORMAT EST_B30_2 $TESTMMN.;
FORMAT EST_B31_2 $TESTEXT.;
FORMAT EST_B29_FA3 $TFAMIGM.;
FORMAT EST_B30_3 $TESTMMN.;
FORMAT EST_B31_3 $TESTEXT.;
FORMAT EST2_SA $TESTSNT.;
FORMAT EST2_NC $TESTCRS.;
FORMAT IDI_MT1 $Tidioma.;
FORMAT IDI_MT2 $Tidioma.;
FORMAT IDIOMAS $TNUMIDI.;
FORMAT IDIOMA1 $Tidioma.;
FORMAT NIV_ID1 $TNivIdi.;
FORMAT ACREIDI1 $T2SINO.;
FORMAT TIPOACREIDI1 $TIPACRE.;
FORMAT IDIOMA2 $Tidioma.;
FORMAT NIV_ID2 $TNivIdi.;
FORMAT ACREIDI2 $T2SINO.;
FORMAT TIPOACREIDI2 $TIPACRE.;
FORMAT IDIOMA3 $Tidioma.;
FORMAT NIV_ID3 $TNivIdi.;
FORMAT ACREIDI3 $T2SINO.;
FORMAT TIPOACREIDI3 $TIPACRE.;
FORMAT IDIOMA4 $Tidioma.;
FORMAT NIV_ID4 $TNivIdi.;
FORMAT ACREIDI4 $T2SINO.;
FORMAT TIPOACREIDI4 $TIPACRE.;
FORMAT TITIDI $T2SINO.;
FORMAT TIC $TTIC.;
FORMAT EST_B38_1 $T1SINO.;
FORMAT EST_B39_1 $T2SINO.;
FORMAT EST_B38_2 $T1SINO.;
FORMAT EST_B39_2 $T2SINO.;
FORMAT EST_B38_3 $T1SINO.;
FORMAT EST_B39_3 $T2SINO.;
FORMAT EST_B38_4 $T1SINO.;
FORMAT EST_B39_4 $T2SINO.;
FORMAT EST_B38_5 $T1SINO.;
FORMAT EST_B39_5 $T2SINO.;
FORMAT EST_B38_6 $T1SINO.;
FORMAT EST_B39_6 $T2SINO.;
FORMAT EST_B38_7 $T1SINO.;
FORMAT EST_B39_7 $T2SINO.;
FORMAT MOV_IN $T2SINO.;
FORMAT MOVRAZ1 $T2SINO.;
FORMAT MOVRAZ2 $T2SINO.;
FORMAT MOVRAZ3 $T2SINO.;
FORMAT MOVRAZ4 $T2SINO.;
FORMAT MOVRAZ5 $T2SINO.;
FORMAT MVFUERA $T2SINO.;
FORMAT MOVPAI1 $TPAIMOV.;
FORMAT MOVPAI2 $TPAIMOV.;
FORMAT MOVPAI3 $TPAIMOV.;
FORMAT MOVRA21 $T2SINO.;
FORMAT MOVRA22 $T2SINO.;
FORMAT MOVRA23 $T2SINO.;
FORMAT MOVRA24 $T2SINO.;
FORMAT MOVRA25 $T2SINO.;
FORMAT MOVRA26 $T2SINO.;
FORMAT MOV_C7 $TVIVIRF.;
FORMAT MOV_C8_1 $T2SINO.;
FORMAT MOV_C8_2 $T2SINO.;
FORMAT MOV_C8_3 $T2SINO.;
FORMAT MOV_C8_4 $T2SINO.;
FORMAT MOV_C8_5 $T2SINO.;
FORMAT MOV_C8_6 $T2SINO.;
FORMAT MOV_C9 $TPAIMOV.;
FORMAT RETORNO $T2SINO.;
FORMAT TRBPRN1 $T1TRBPN.;
FORMAT TRBPRN2 $T2TRBPN.;
FORMAT TRINAC_D4 $T2SINO.;
FORMAT TRINAC_D5 $T1MOBUT.;
FORMAT TRINAC_D6 $T1TIEMP.;
FORMAT TRPARA_D5 $T1MOBUT.;
FORMAT TRPARA_D6 $T1TIEMP.;
FORMAT TRPARA_D7_1 $T2SINO.;
FORMAT TRPARA_D7_2 $T2SINO.;
FORMAT TRPARA_D7_3 $T2SINO.;
FORMAT TRPARA_D7_4 $T2SINO.;
FORMAT TRPARA_D7_5 $T2SINO.;
FORMAT TRPARA_D7_6 $T2SINO.;
FORMAT TRPARA_D7_7 $T2SINO.;
FORMAT TRPARA_D7_8 $T2SINO.;
FORMAT TRPARA_D7_9 $T2SINO.;
FORMAT TRPARA_D7_10 $T2SINO.;
FORMAT TRPARA_D8_1 $TIMPORT.;
FORMAT TRPARA_D8_2 $TIMPORT.;
FORMAT TRPARA_D8_3 $TIMPORT.;
FORMAT TRPARA_D8_4 $TIMPORT.;
FORMAT TRPARA_D8_5 $TIMPORT.;
FORMAT TRPARA_D8_6 $TIMPORT.;
FORMAT TRAC_D9 $T2SINO.;
FORMAT LUG_TRAB_PAIS $T1PAIS.;
FORMAT SIT_PRO $TStProf.;
FORMAT JORNADA $TJornad.;
FORMAT TRABOC $TOcupac.;
FORMAT TR_CNAE $TCNAE.;
FORMAT TR_TAM $TTamano.;
FORMAT TR_ANIO $TAnio.;
FORMAT TR_SUELDO $TSUELDO.;
FORMAT TR_D19 $TNivEst.;
FORMAT TR_D20 $TAreEst.;
FORMAT TR_D21 $T2SINO.;
FORMAT TR_D22_1 $TFacTrb.;
FORMAT TR_D22_2 $TFacTrb.;
FORMAT TR_D22_3 $TFacTrb.;
FORMAT TR_D22_4 $TFacTrb.;
FORMAT TR_D22_5 $TFacTrb.;
FORMAT TR_D22_6 $TFacTrb.;
FORMAT TR_D23 $T3SiNo.;
FORMAT HL_E1 $TPRAC.;
FORMAT HL_E2 $T4ESTM.;
FORMAT HL_E3 $T1SINO.;
FORMAT HL_E5 $T2SINO.;
FORMAT HL_JOR $TJornad.;
FORMAT HL_E7 $T2SINO.;
FORMAT HL_E8 $T2SINO.;
FORMAT HA_TRAB $T1SINO.;
FORMAT HATR_E11 $T2TIEMP.;
FORMAT HATR_E12 $T2MOBUT.;
FORMAT HATR_BSQ1 $T2SINO.;
FORMAT HATR_BSQ2 $T2SINO.;
FORMAT HATR_BSQ3 $T2SINO.;
FORMAT HATR_BSQ4 $T2SINO.;
FORMAT HATR_BSQ5 $T2SINO.;
FORMAT HATR_BSQ6 $T2SINO.;
FORMAT HATR_BSQ7 $T2SINO.;
FORMAT HATR_BSQ8 $T2SINO.;
FORMAT HATR_BSQ9 $T2SINO.;
FORMAT HATR_BSQ10 $T2SINO.;
FORMAT HATR_BSQ11 $T2SINO.;
FORMAT P_CONTI $T2SINO.;
FORMAT PR_PAIS $T1PAIS.;
FORMAT PR_OCU $TOcupac.;
FORMAT PR_SIT_PR $TStProf.;
FORMAT PR_JOR $TJornad.;
FORMAT PR_NIVEL $TNivEst.;
FORMAT PR_AREA $TAreEst.;
FORMAT PR_CONOC $T2SINO.;
FORMAT PR_SUELDO $TSUELDO.;
FORMAT HATR_TIEMP $T3TIEMP.;
FORMAT HATR_NUM $TNmEmpl.;
FORMAT HATR_E27 $T2SINO.;
FORMAT NOTRAB_BUS $T2SINO.;
FORMAT NOTRAB_BUSM $T1MOBUT.;
FORMAT NOTRAB_BUST $T1TIEMP.;
FORMAT NOTRAB_BSQ1 $T2SINO.;
FORMAT NOTRAB_BSQ2 $T2SINO.;
FORMAT NOTRAB_BSQ3 $T2SINO.;
FORMAT NOTRAB_BSQ4 $T2SINO.;
FORMAT NOTRAB_BSQ5 $T2SINO.;
FORMAT NOTRAB_BSQ6 $T2SINO.;
FORMAT NOTRAB_BSQ7 $T2SINO.;
FORMAT NOTRAB_BSQ8 $T2SINO.;
FORMAT NOTRAB_BSQ9 $T2SINO.;
FORMAT NOTRAB_BSQ10 $T2SINO.;
FORMAT NOTRAB_DIF1 $TIMPORT.;
FORMAT NOTRAB_DIF2 $TIMPORT.;
FORMAT NOTRAB_DIF3 $TIMPORT.;
FORMAT NOTRAB_DIF4 $TIMPORT.;
FORMAT NOTRAB_DIF5 $TIMPORT.;
FORMAT NOTRAB_DIF6 $TIMPORT.;
FORMAT RECHA_TR $T2SINO.;
FORMAT RECHA_M1 $T2SINO.;
FORMAT RECHA_M2 $T2SINO.;
FORMAT RECHA_M3 $T2SINO.;
FORMAT RECHA_M4 $T2SINO.;
FORMAT RECHA_M5 $T2SINO.;
FORMAT RECHA_M6 $T2SINO.;
FORMAT RECHA_M7 $T2SINO.;
FORMAT RECHA_M8 $T2SINO.;
FORMAT RECHA_M9 $T2SINO.;
FORMAT HO_F1 $TESTCIV.;
FORMAT HO_PAREJ $T2SINO.;
FORMAT HO_NPER $TNPER.;
FORMAT HO_NPER_TR $TNPER.;
FORMAT HO_TIPO $TTIPO.;
FORMAT ALSSM15 $T1SINO.;
FORMAT COTIZ15 $TCOTIZ.;
FORMAT BCOTC15 $TQuintl.;
FORMAT ALSSM16 $T1SINO.;
FORMAT COTIZ16 $TCOTIZ.;
FORMAT BCOTC16 $TQuintl.;
FORMAT ALSSM17 $T1SINO.;
FORMAT COTIZ17 $TCOTIZ.;
FORMAT BCOTC17 $TQuintl.;
FORMAT ALSSM18 $T1SINO.;
FORMAT COTIZ18 $TCOTIZ.;
FORMAT BCOTC18 $TQuintl.;
FORMAT ALSSM19 $T1SINO.;
FORMAT COTIZ19 $TCOTIZ.;
FORMAT BCOTC19 $TQuintl.;
FORMAT N_CURS $TNuCurs.;
FORMAT DENCUR1 $TDsCurs.;
FORMAT DURCUR1 $TDrCurs.;
FORMAT RESCUR1 $TReCurs.;
FORMAT ANHCUR1 $TAnCurs.;
FORMAT DENCUR2 $TDsCurs.;
FORMAT DURCUR2 $TDrCurs.;
FORMAT RESCUR2 $TReCurs.;
FORMAT ANHCUR2 $TAnCurs.;
FORMAT DENCUR3 $TDsCurs.;
FORMAT DURCUR3 $TDrCurs.;
FORMAT RESCUR3 $TReCurs.;
FORMAT ANHCUR3 $TAnCurs.;
FORMAT DENCUR4 $TDsCurs.;
FORMAT DURCUR4 $TDrCurs.;
FORMAT RESCUR4 $TReCurs.;
FORMAT ANHCUR4 $TAnCurs.;
FORMAT DENCUR5 $TDsCurs.;
FORMAT DURCUR5 $TDrCurs.;
FORMAT RESCUR5 $TReCurs.;
FORMAT ANHCUR5 $TAnCurs.;
FORMAT DENCUR6 $TDsCurs.;
FORMAT DURCUR6 $TDrCurs.;
FORMAT RESCUR6 $TReCurs.;
FORMAT ANHCUR6 $TAnCurs.;


RUN;
/* FIN PROGRAMA: Microdatos en SAS: EILU_GRAD_2019.sas*/
