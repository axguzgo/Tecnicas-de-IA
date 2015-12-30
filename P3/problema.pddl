;Aqui se implementa el problema de transportes 

(define (problem transporte)

(:domain Camiones)

(:objects					;Objetos que forman parte del problema
	camion1 - camion
	camion2 - camion
	conductor1 - conductor
	conductor2 - conductor
	paquete1 - paquete
	paquete2 - paquete
	ciudadA - ciudad
	ciudadB - ciudad
	ciudadC - ciudad
	ciudadD - ciudad
	ciudadE - ciudad)

(:init						;Estado incial del problema 
	;Situacion inicial de los objetos
		(at camion1 ciudadA)
		(at camion2 ciudadA)
		(at conductor1 ciudadC)
		(at conductor2 ciudadD)
		(at paquete1 ciudadA)
		(at paquete2 ciudadD)
		
		(vacio camion1)
		(vacio camion2)
		
		;Conexion entre ciudades
		 (conectado ciudadA ciudadB) 
		 (conectado ciudadA ciudadC) 
		
		 (conectado ciudadB ciudadA) 
		 (conectado ciudadB ciudadC) 
		 (conectado ciudadB ciudadD) 
		 (conectado ciudadB ciudadE) 
		
		 (conectado ciudadC ciudadA) 
		 (conectado ciudadC ciudadB) 
		 (conectado ciudadC ciudadE) 
		
		 (conectado ciudadD ciudadB) 
		
		 (conectado ciudadE ciudadB) 
		 (conectado ciudadE ciudadC) 
		
	;Distancias entre ciudades
		(= (distancia ciudadA ciudadB) 5)
		(= (distancia ciudadA ciudadC) 3)
		
		(= (distancia ciudadB ciudadA) 5)
		(= (distancia ciudadB ciudadC) 3)
		(= (distancia ciudadB ciudadD) 2)
		(= (distancia ciudadB ciudadE) 4)
		
		(= (distancia ciudadC ciudadA) 3)
		(= (distancia ciudadC ciudadB) 3)
		(= (distancia ciudadC ciudadE) 8)
		
		(= (distancia ciudadD ciudadB) 2)
		
		(= (distancia ciudadE ciudadB) 4)
		(= (distancia ciudadE ciudadC) 8)
	
	;Coste de viajar entre cada ciudad
		(= (costeViaje ciudadA ciudadB) 2)
		(= (costeViaje ciudadA ciudadC) 1)
		
		(= (costeViaje ciudadB ciudadA) 2)
		(= (costeViaje ciudadB ciudadC) 1)
		(= (costeViaje ciudadB ciudadD) 2)
		(= (costeViaje ciudadB ciudadE) 3)
		
		(= (costeViaje ciudadC ciudadA) 1)
		(= (costeViaje ciudadC ciudadB) 1)
		(= (costeViaje ciudadC ciudadE) 5)
		
		(= (costeViaje ciudadD ciudadB) 2)
		
		(= (costeViaje ciudadE ciudadB) 3)
		(= (costeViaje ciudadE ciudadC) 5)
	
);fin declaración estado inicial
	
	

;Declaración de los objetivos dle problema
(:goal (and
	(at paquete1 ciudadE)
	(at paquete2 ciudadC)
	(at camion2 ciudadA)
	(at conductor1 ciudadB)))

;Metrica para medir la calidad del plan 
 (:metric minimize (+ (* 0.1 (total-time)) (* 0.2 (coste))))
 ) 
