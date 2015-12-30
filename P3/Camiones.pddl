; Dominio : Camiones
; Autor Axel Guzman Godia

(define (domain Camiones)
(:requirements :typing :durative-actions :fluents)
(:types camion conductor ciudad paquete) ; Especificamos nuestros objetos



(:predicates (at ?x - (either conductor camion paquete) ?c - ciudad)
	     (in ?x - (either paquete conductor) ?cam - camion)
	     (vacio ?camion - camion)
	     (conectado ?c1 - ciudad ?c2 - ciudad )
)

(:functions  (distancia  ?c1 - ciudad ?c2 - ciudad)  ;función numérica para conocer la distancia entre 2 ciudades
			 (costeViaje ?c1 - ciudad ?c2 - ciudad)  ;función numérica para conocer el coste de viajar entre 2 ciudades
			 (coste)								 ;función para calcular el coste total 
)								

(:durative-action subirCamion				;Función para modelar la acción de subir a un camion
 :parameters (?conductor - conductor ?ciudad - ciudad ?camion - camion)
 :duration (= ?duration 1)
 :condition (and (at start (at ?conductor ?ciudad))
			(at start (vacio ?camion)) 
			(at start ( at ?camion ?ciudad))
			(over all ( at ?camion ?ciudad)) )
			
 :effect 	(and (at start (not (at ?conductor ?ciudad))) 
			(at start (not (vacio ?camion)))
			(at end (in ?conductor ?camion))
			(at end (increase (coste) 1)))
)
              
 (:durative-action bajarCamion				;Función para modelar la acción de bajar de  un camion
 :parameters (?conductor - conductor ?ciudad - ciudad ?camion - camion)
 :duration (= ?duration 1)
 :condition (and   (at start ( at ?camion ?ciudad))
					(at start (in ?conductor ?camion))
			(over all ( at ?camion ?ciudad))) 
 :effect (and (at start(not (in ?conductor ?camion))) 
              (at end (at ?conductor ?ciudad)) (at end (vacio ?camion))(at end (increase (coste) 1))))
              
(:durative-action cargarCamion				;Función para modelar la acción de cargar en   un camion
 :parameters (?paquete - paquete ?ciudad - ciudad ?camion - camion)
 :duration (= ?duration 1)
 :condition (and   (at start ( at ?camion ?ciudad))(at start ( at ?paquete ?ciudad))
			(over all ( at ?camion ?ciudad)) ) 
 :effect (and (at start(not (at ?paquete ?ciudad))) 
              (at end (in ?paquete ?camion))(at end (increase (coste) 1)))
)
              
(:durative-action descargarCamion				;Función para modelar la acción de descargar de un  camion
 :parameters (?paquete - paquete ?ciudad - ciudad ?camion - camion)
 :duration (= ?duration 1)
 :condition (and   (at start ( at ?camion ?ciudad))
			(at start (in ?paquete ?camion))
			(over all ( at ?camion ?ciudad))) 
 :effect (and (at start(not (in ?paquete ?camion))) 
              (at end (at ?paquete ?ciudad)) (at end (increase (coste) 1)))
)
              
(:durative-action viajar 						;Función para modelar el desplazamiento entre ciudades
 :parameters (?camion - camion ?origen ?destino - ciudad ?conductor - conductor)
 :duration (= ?duration (distancia ?origen ?destino))
 :condition (and (at start(at ?camion ?origen))
				 (over all (in ?conductor ?camion))
				 (over all (conectado ?origen ?destino))
			)
 :effect (and (at start(not (at ?camion ?origen)))
			  (at end (at ?camion ?destino))(at end (increase (coste) (costeViaje ?origen ?destino))))
)

(:durative-action autobus						;Función para modelar el desplazamiento d eun conductor en autobus
 :parameters (?conductor - conductor ?origen ?destino - ciudad)
 :duration (= ?duration 10)
 :condition (and (at start (at ?conductor ?origen))
			     (over all (conectado ?origen ?destino)))
 :effect (and (at start (not (at ?conductor ?origen)))
			   (at end (at ?conductor ?destino)) (at end (increase (coste) 3)))
)

)


