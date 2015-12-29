#######################################################################################################################
#              Modelado de un sistema de calefaccion (bomba de calor) con logica difusa (Fuzzy)                       # 
####################################################################################################################### 



### Plantillas variables difusas 

(deftemplate tmpActual 0 50 grados 			; definición de la variable fuzzy "temperatura actual" 
	( (baja (0 1) (13 1) (17 0) ) 
	(media (15 0) (19 1) (24 1) (27 0)) 
	(alta (23 0) (28 1))))

(deftemplate tmpAnterior 0 50 grados  			; definición de la variable fuzzy "temperatura anterior" 
	( (baja (0 1) (13 1) (17 0) ) 
	(media (16 0) (19 1) (24 1) (26 0)) 
	(alta (24 0) (28 1))))

(deftemplate tmpSalida 0 30 grados  			; definición de la variable fuzzy "temperatura de salida" 
	((off (0 0)(0 1)(0 0))
	(max_frio (13 0)(14 1) (15 1) (16 0)) 
	(frio (15 0) (16 1) (17 1) (18 0)) 
	(calor (17 0) (19 1) (22 1) (23 0))
	(max_calor(22 0)(24 1) )
	))
	
### Definicion plantilla para modelar el estado de la habitacion sin evaluar y el estado evaluado
	
(deftemplate estado
	(slot hora ) 
	(slot Actual (type FUZZY-VALUE tmpActual)) 
	(slot Anterior (type FUZZY-VALUE tmpAnterior)) 
	(slot evaluado )) 

(deftemplate estado_eval
	(slot hora ) 
	(slot Actual (type FUZZY-VALUE tmpActual)) 
	(slot Anterior (type FUZZY-VALUE tmpAnterior)) 
	(slot Salida (type FUZZY-VALUE tmpSalida) ) 
	(slot evaluado )) 

### Reglas 

(defrule maxfrio
	?f<-(estado (hora ?h) (Actual alta) (Anterior ?ant) (evaluado no))
=>
	(retract ?f) 
	(assert (estado_eval (hora ?h) (Actual alta) (Anterior ?ant) (Salida max_frio) (evaluado si)))
	)

(defrule frio
	?f<-(estado (hora ?h) (Actual media) (Anterior alta) (evaluado no))
=>
	(retract ?f) 
	(assert (estado_eval  (hora ?h) (Actual media) (Anterior alta) (Salida frio) (evaluado si)))
	)
	
(defrule off
	?f<-(estado (hora ?h) (Actual media) (Anterior media) (evaluado no))
=>
	(retract ?f) 
	(assert (estado_eval  (hora ?h) (Actual media) (Anterior media) (Salida off) (evaluado si)))
	)
	
	
(defrule calor
	?f<-(estado (hora ?h) (Actual media) (Anterior baja) (evaluado no))
=>
	(retract ?f) 
	(assert (estado_eval  (hora ?h) (Actual media) (Anterior baja) (Salida calor) (evaluado si)))
	)
	
(defrule max_calor
	?f<-(estado (hora ?h) (Actual baja) (Anterior ?t) (evaluado no))
=>
	(retract ?f) 
	(assert (estado_eval  (hora ?h) (Actual baja) (Anterior ?t) (Salida max_calor) (evaluado si)))
	)




(defrule defusificar 
	
	?f<-(estado_eval  (hora ?h) (Actual ?t3) (Anterior ?t) (Salida ?l) (evaluado si))
	
=> 
	(bind ?e (moment-defuzzify ?l)) 
	(printout t "Para la hora " ?h " , la bomba se ajusta a:" ?e  crlf)) 
	
(deffacts hechos
	(estado (hora 11) (Actual media)  (Anterior alta)   (evaluado no))
	(estado (hora 12) (Actual media)  (Anterior baja)   (evaluado no))
	(estado (hora 15) (Actual alta)  (Anterior alta)   (evaluado no))
	(estado (hora 18) (Actual media) (Anterior media)  (evaluado no))
	(estado (hora 21) (Actual baja)  (Anterior media) (evaluado no)) )



 

################## ################## ################## ################## ################## ################## 
 
(plot-fuzzy-value t "*+#" 0 50   ;Solo en consola! 
(create-fuzzy-value tmpActual baja) 
(create-fuzzy-value tmpActual media) 
(create-fuzzy-value tmpActual alta)) 

(plot-fuzzy-value t "OFfcC" 0 30   ;Solo en consola! 
(create-fuzzy-value tmpSalida off) 
(create-fuzzy-value tmpSalida max_frio) 
(create-fuzzy-value tmpSalida frio)
(create-fuzzy-value tmpSalida calor) 
(create-fuzzy-value tmpSalida max_calor) ) 


(defrule defusificar
	(declare (salience -2)) 
	
	?f<-(estado_eval  (hora ?h) (Actual ?t3) (Anterior ?t) (Salida ?l) (evaluado si))
	?f2<-(estado (hora ?h) (Actual ?tac) (Anterior ?tant)  (evaluado no))
	
=> 
	(printout t "Hora: " ?h " Como te sientes? (poco_calor, calor , poco_frio o frio)" crlf)
	(bind ?sent (read))
	(interaction ?sent)
	(assert-string(fromat nil "(estado_eval  (hora %d) (Actual %s) (Anterior %s) (Salida %s) (evaluado si))" ?h ?tac ?tant ?sent))
	
	
	(bind ?e (maximum-defuzzify ?l)) 
	(printout t "Para la hora " ?h " , la bomba se ajusta a:" ?e   crlf)) 

(deffunction interaction (?sent)
(switch ?sent
  	(case poco_calor  then (assert-string (format nil "(tmpSalida frio)")))
	)
)
 
