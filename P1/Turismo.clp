
/*Variables globals*/
(defglobal ?*itinerari* = "") ;Aquesta variable acumula la string que conte el itinerari generat
(defglobal ?*temps* = "0")    
(defglobal ?*cost* = 0) 	  ;Aquesta vairable acumula el cost de les activitats
(defglobal ?*presupost* = 0)  ;Aquesta variable serveix per a controlar que no es sobrepassa el presupost del usuari

/*Plantilla per a modelar les activitats*/
(deftemplate plan
(slot nom(type string))
(slot descripcio(type string))
(multislot tipo (type string))
(slot duracio (type integer))
(slot preu (type integer))
(multislot moment(type string))
(multislot vehicle(type string))
)
;Plantilla per a definir els dies
(deftemplate dia
    (slot numero(type integer))
    (slot mati (type string))
    (slot tarde(type string)))


;Entre els fets inicials tenim les diverses activitats que recomana el sistema
(deffacts plans
(plan (nom "Visita al Castell del Papa Luna") 
	(descripcio 
"Sens dubte un dels monuments més importants i espectaculars de Peñiscola.
El castell està situat en una península i només s'hi pot accedir per un costat. Abans 
de la construcció del port, amb la pujada de la marea el castell quedaba totalment aillat
ja que el mar cobria el istme que el uneix amb la costa Aquest castell va ser seu del Papa Luna,
un home que va plantar cara al Vaticà i es va autoproclamar papa. Una visita obligatoria a un dels
castells millors conservats del baix maestrat. Disfruta de segles d'història i de una vista de 
Peñiscola espectacular!

")
(tipo familiar cultural parella oci) (duracio 90 )(preu 3)(moment "mati" "tarde")(vehicle "si" "no"))
;-------------------------------------------------------------------------------------------------------- 
(plan (nom "Caminata llarga Serra d'Irta ")
	(descripcio
"La serra d'irta es un paratge natural d'incalculabe valor. Gran part del parc natural
esta situat dins dels límits de Peñiscola. Un entorn de muntanya que contrasta amb les 
platges de la localitat. En aquest entorn podrás torbar gran diversitat de flora y fauna
, moltes especies de les quals són endemiques del mediterrani.

")
(tipo natural parella)(duracio 240)(preu 0)(moment "mati" )(vehicle "si" "no"))
;--------------------------------------------------------------------------------------------------------     
(plan (nom "Caminata curta Serra d'Irta ")
	(descripcio
"La serra d'irta es un paratge natural d'incalculabe valor. Gran part del parc natural
esta situat dins dels límits de Peñiscola. Un entorn de muntanya que contrasta amb les 
platges de la localitat. En aquest entorn podrás torbar gran diversitat de flora y fauna
, moltes especies de les quals són endemiques del mediterrani.

")
(tipo natural familiar oci parella)(duracio 120)(preu 0)(moment "tarde")(vehicle "si" "no"))
;-------------------------------------------------------------------------------------------------------- 
(plan (nom "Dia de platja a les cales de Irta")
	(descripcio
"La part de la serra d'Irta que dona la mar esta plena de cales fantastiques on pots
gaudir de tranquilitat en un entorn natural. Podrás descobrir nombroses especies marines
i multitud de zones diferents, desde cales de pedra fins a cales d'arena fina.

")(tipo natural familiar oci)(duracio 480)(preu 0)(moment "mati")(vehicle "si"))
;-------------------------------------------------------------------------------------------------------- 
(plan (nom "Matí a la platja Nord de Peñiscola")
	(descripcio
"La platja Nord de Peñiscola es la platja d'arena més gran i més important del municipi.
Conta amb una extensió de més de 8 Km i esta totalment adaptada. Esta vigilada per socorristes
i ha sigut guardonadad múltiples vegades mab reconeixements de qualitat. A més a més es ideal per a anar
amb els més petits ja que el desnivell es molt progressiu.

")(tipo oci familiar parella)(duracio 240)(preu 0)(moment "mati")(vehicle "si" "no"))
;-------------------------------------------------------------------------------------------------------- 
(plan (nom "Visita Casc antic Peñiscola")
	(descripcio
"El casc antic de peñiscola esta format per un gran conglomerat de vivendes antigües,
esglesies i fortificacions de tot tipus. Aqui podras viatjar en el temps i transladarte a epoques
pasades. Durant la visita trobaras multitud de comerços tradicionals i d'altres més innovadors
on podras descobrir les tradicions mes antigues.

")(tipo natural oci familiar parella)(duracio 240)(preu 0)(moment "tarde")(vehicle "si" "no"))
;-------------------------------------------------------------------------------------------------------- 
(plan (nom "Circuit de Spa al hotel Don Carlos")
	(descripcio
"Res millor per a desconectar que pasar per un circuit de Spa. L'hotel Don Carlos , situat al 
centre de la ciutat, ofereix un complet circuit per a renovar energies i aconseguir el benestar.

")(tipo parella)(duracio 240)(preu 30)(moment "tarde")(vehicle "si" "no"))
;-------------------------------------------------------------------------------------------------------- 
(plan (nom "Visita al mirador d'Atalayes")
	(descripcio
"Atalayes es el nom que rep la urbanització que hi ha en la montanya més alta de Peñiscola.
Gaudeix de una vista espectacular del litroal desde el punt més alt del municpi.
En condicions favorables es posible veure les illes Columbretes així com les localitats
veines Benicarló, Vinaroz i fins i tot  Alcanar. A mes a mes es una zona molt tranquila on 
evadir-te una estona del ritme de la ciutat.

")(tipo natural parella familiar oci)(duracio 60)(preu 0)(moment "mati" "tarde")(vehicle "si" ))
;-------------------------------------------------------------------------------------------------------- 
(plan (nom "Visita a Morella")
	(descripcio
"Morella es un municipi pertanyent a la comarca dels Ports. Esta situat a una hora i mitja 
aproximadament de Peñiscola. La localitat está construida en una montanya i rodejada de muralles.
al punt més alt de la ciutat s'hi troba el castell de Morella que protegia la ciutat en temps passats.
Tota una joia de la Comunitat Valenciana.             

")(tipo natural familiar parella cultural)(duracio 480)(preu 30)(moment "mati")(vehicle "si" ))
;-------------------------------------------------------------------------------------------------------- 
(plan (nom "Oci nocturn per el casc antic")
	(descripcio
"Arriba la nit i els carrers dels casc antic canvien el seu ambient turístic per un altre
una mica més festiu. Per tot el casc antic podrás trobar una gran varietat de locals
de tot tipus. Desde locals low-cost i premium a discoteques. Tot aixó amb un ambient
jove i alegre.

")(tipo oci parella)(duracio 480)(preu 20)(moment "tarde")(vehicle "si" "no"))
;-------------------------------------------------------------------------------------------------------- 
(plan(nom "Oci nocturn a sala Ébano (+18)")
	(descripcio
"Situada a un quilometre aproximadament dle centre de la ciutat, aquesta discoteca
s'ha convertit en molt poc temps en la més important de Peñiscola. 
trobarás un ambient animat amb gent de tot tipus d'edats. Es recomana vestimenta
adecuada.

")(tipo oci)(duracio 300)(preu 20)(moment "tarde")(vehicle "si" "no"))
;-------------------------------------------------------------------------------------------------------- 
(plan(nom "Caminata a la ermita de Sant Antoni")
	(descripcio
"La ermita de Sant Antoni está situada a uns 5 km del centre de la població.
Está situada a dalt d'una montanya que forma part de la serra d'Irta.
Una vegada a l'any se celebra una romeria en la que participa sempre una 
gran quantitat de gent del poble. A més a més conta amb unes vistes 
espectaculars i durant la resta del any s'hi poden veure alguns animals
salvatges com ara rabosses.

")(tipo natural)(duracio 300)(preu 0)(moment "tarde" "mati")(vehicle "si" "no"))
;-------------------------------------------------------------------------------------------------------- 
(plan(nom "Visita al parc acuatic Acualandia")
	(descripcio
"Acualandia es un parc acuatic situat a la zona de Peñismar. Disposa de 
instalacions adecuades per a que pugen gaudir tant els mes petits com aquells 
que no ho son tant. A mes a mes tambe disposa de bars per aquells que no vulguin 
mullar-se

")(tipo familiar oci)(duracio 300)(preu 5)(moment "tarde" "mati")(vehicle "si" "no"))
;-------------------------------------------------------------------------------------------------------- 
(plan(nom "Excursió a les illes Columbretes")
	(descripcio
"Les illes Columbretes son unes illes d'origen volcanic situades a uns 40 quilometres
de la costa de Peñiscola. Aquestes illes resulten ser de gran valor natural ja que son
una reserva natural protegida. Els seus fons marins estan plens de vida. 

")(tipo familiar oci natural)(duracio 250)(preu 45)(moment "mati")(vehicle "si" "no"))
;-------------------------------------------------------------------------------------------------------- 
(plan(nom "Activitats acuatiques")
	(descripcio
"A la platja nord de Peñiscola podras trobar un oferta variada de activitats.
Per a anar amb la familia recomanem alquilar un patinet i veure Peñiscola desde 
una altra perspectiva. Per als mes atrevits pot resultar interessant el alquiler 
de motos acuatiques o la 'banana'

")(tipo familiar oci )(duracio 120)(preu 15)(moment "mati" "tarde")(vehicle "si" "no"))
       
 )
 
/*Preguntar informació básica*/
(defrule pregunta0
    (declare(salience 5))
    =>
    (printout t "Has estat alguna vegada a Peñiscola?")
    (assert (visitat (read))))
(defrule pregunta1
    (declare(salience 4))
    =>
    (printout t "Quin tipus de turisme vols fer? (Familiar, oci, cultural, natural,parella)")
	(assert (tipo (read)))
     )
(defrule pregunta2
    (declare(salience 3))
    =>
    (printout t "Quants diners vols destinar a les teues vacançes? (en euros)")
    (assert(presupost (read))))
   
(defrule pregunta3
    (declare(salience 2))
    =>
    (printout t "Quant de temps estarás de vacançes? (Dies, SENSE INCLOURE el dia d'arribada i el dia de sortida)")
    (bind ?i (read))
     (while (> ?i 0)
         
          (assert (dia(numero ?i) (mati "") (tarde "") )) 
          (-- ?i)
        )
    )
(defrule pregunta4
(declare(salience 1))
    =>
    (printout t "Disposes de vehicle privat?")
    (assert (vehicle (readline) )))
    
    
    
*/Regles per a crear itinerari*/

(defrule itinerari
   (vehicle ?vehicle)
   (tipo ?tipo)
   
   ?dia <- (dia (numero ?n)(mati "")(tarde ""))
   ?activitatMati  <- (plan  (nom ?n1) (descripcio ?descr1)(tipo $? ?tipo $?) (duracio ?t1) (preu ?p1)(moment $? "mati" $?)(vehicle $? ?vehicle $? ))
   ?activitatTarde <- (plan  (nom ?n2) (descripcio ?descr2) (tipo $? ?tipo $?) (duracio ?t2)(preu ?p2)(moment $? "tarde" $?)(vehicle $? ?vehicle $? ))
  (presupost ?pres&:(> ?pres (+ ?p1 ?p2))) ;Comprovar que no se sobrepassa el presupost
    (test(<> ?n1 ?n2)) ;Cal asegurar-se de no repetir una activitat el mateix dia
    ;Comprovar que no se sobrepassa el presupost
    =>
    (bind ?cost (+ ?p1 ?p2))
     (bind ?*itinerari*  (str-cat ?*itinerari*  
"------------------------------- Dia " ?n "  matí: " ?n1 ". Temps aproximat: " ?t1 " minuts ---------------------------------------

" ?descr1 ))
    (bind ?*itinerari*  (str-cat ?*itinerari*   
"------------------------------- Dia " ?n " tarde: " ?n2 ". Temps aproximat: " ?t2 " minuts ---------------------------------------

" ?descr2 ))
    (assert (presupost (- ?pres (+ ?p1 ?p2))))
    (bind ?*cost* (+ ?*cost* ?cost));Acumular el cost total
    (retract ?activitatMati)
    (retract ?activitatTarde)
   
    (retract ?dia)
 
       
    
)

*/Regla per a emitir resposta*/

(defrule resposta
    
   
    =>(printout t "Aquest es el itinerari que hem preparat per a tu:" crlf ?*itinerari*)
       (printout t "Cost estimat de les activitats proposades : " ?*cost* " Euros per persona.")
   
    (halt))




(printout t "Benvingut al teu guía turístic per  Peñiscola!" crlf)
(printout t "Abans de començar necessitem un poc de informació." crlf)
(reset)
    (run)

    