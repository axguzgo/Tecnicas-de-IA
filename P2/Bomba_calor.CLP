#######################################################################################################################
#              Modelado de un sistema de calefaccion (bomba de calor) con logica difusa (Fuzzy)                       # 
####################################################################################################################### 



### Plantillas variables difusas 

(deftemplate tmpActual 0 50 grados 			; definición de la variable fuzzy "temperatura actual" 
	( (baja (0 1) (13 1) (16 0) ) 
	(media (14 0) (19 1) (24 1) (29 0)) 
	(alta (27 0) (28 1))))

(deftemplate tmpAnterior 0 50 grados  			; definición de la variable fuzzy "temperatura anterior" 
	( (baja (0 1) (13 1) (16 0) ) 
	(media (14 0) (19 1) (24 1) (29 0)) 
	(alta (27 0) (28 1))))

(deftemplate tmpSalida 0 30 grados  			; definición de la variable fuzzy "temperatura de salida" 
	((off (0 0)(0 1)(0 0))
	(max_frio (13 0)(14 1) (15 1) (16 0)) 
	(frio (15 0) (16 1) (17 1) (19 0)) 
	(calor (19 0) (19 1) (22 1) (24 0))
	(max_calor(22 0)(24 1) )
	))
	
### Definicion plantilla para modelar el estado de la habitacion sin evaluar y el estado evaluado ##################
	
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

######################## Reglas #############################################

(defrule maxfrio
	?f<-(estado (hora ?h) (Actual alta) (Anterior ?ant) (evaluado no))
=>
	(assert (estado_eval (hora ?h) (Actual alta) (Anterior ?ant) (Salida max_frio) (evaluado si)))
	)


(defrule frio
	?f<-(estado (hora ?h) (Actual media) (Anterior alta) (evaluado no))
=>
	(assert (estado_eval  (hora ?h) (Actual media) (Anterior alta) (Salida frio) (evaluado si)))
	)
	

(defrule off
	
	?f<-(estado (hora ?h) (Actual media) (Anterior media) (evaluado no))
=>
	(assert (estado_eval  (hora ?h) (Actual media) (Anterior media) (Salida off) (evaluado si)))
	)
	
	

(defrule calor
	?f<-(estado (hora ?h) (Actual media) (Anterior baja) (evaluado no))
=>
	
	(assert (estado_eval  (hora ?h) (Actual media) (Anterior baja) (Salida calor) (evaluado si)))
	
	
	)
	

(defrule max_calor
	?f<-(estado (hora ?h) (Actual baja) (Anterior ?t) (evaluado no))
=>
	(assert (estado_eval  (hora ?h) (Actual baja) (Anterior ?t) (Salida max_calor) (evaluado si)))
	)



(defrule defusificar
	(declare (salience -2)) 
	
	?f<-(estado_eval  (hora ?h) (Actual ?t3) (Anterior ?t) (Salida ?l) (evaluado si))
	
=> 
	
	(bind ?e (maximum-defuzzify ?l)) 
	(if (!= ?e 0)
      	then
		(if (< ?e 14)
		then (bind ?e 14))
		(if (> ?e 30)
		then (bind ?e 30)))
	(printout t "Para la hora " ?h " , la bomba se ajusta a:" ?e   crlf)) 

##############      Definicion hechos     ##################################################

	
(deffacts hechos
	
	(estado (hora 12) (Actual  media)  (Anterior baja)   (evaluado no) ) 
        (estado (hora 13) (Actual  alta)  (Anterior media)   (evaluado no) ) 
	(estado (hora 14) (Actual  media)  (Anterior media)   (evaluado no) ) 
	(estado (hora 15) (Actual  media)  (Anterior baja)   (evaluado no) ) 
	(estado (hora 16) (Actual  media)  (Anterior alta)   (evaluado no) ) 
	(estado (hora 17) (Actual  baja)  (Anterior media)   (evaluado no) ) 
	(estado (hora 18) (Actual  alta)  (Anterior media)   (evaluado no) ) 
	
	
	
	)
