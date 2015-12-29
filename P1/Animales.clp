(do-backward-chaining cubre)
(do-backward-chaining piel)
(do-backward-chaining leche)
(do-backward-chaining reproduce)
(do-backward-chaining pico)
(do-backward-chaining garras)
(do-backward-chaining comer)
(do-backward-chaining color)
(do-backward-chaining rayas)
(do-backward-chaining vuela)
(do-backward-chaining nada)
(do-backward-chaining tipo)




*/Deducciones*/
(defrule mamifero1
    (cubre pelo)
    =>
    (assert (tipo mamifero)))
(defrule mamifero2
    (leche si)
    =>
    (assert (tipo mamifero)))

(defrule ave
    (cubre plumas)
    (reproduce oviparo)
    =>
    (assert (tipo ave)))
(defrule ave1
    (pico si)
    (reproduce oviparo)
    =>
    (assert (tipo ave)))
(defrule carnivoro
    (tipo mamifero)
    (garras si)
    (comer carne)
    =>
    (assert (comer carnivoro)))
(defrule guepardo
    (comer carnivoro)
    (color pardo)
    (piel manchas)
    =>
     (printout t "El animal es el guepardo")
    (halt))
(defrule tigre
    (comer carnivoro)
    (color pardo)
    (rayas negras)
    =>
     (printout t "El animal es el tigre")
    (halt))
(defrule pinguino
    (tipo ave)
    (vuela mal)
    (nada bien)
    =>
     (printout t "El animal es el pingüino")
    (halt))
(defrule gaviota
    (tipo ave)
    (vuela muy_bien)
    =>
     (printout t "El animal es la gaviota")
    (halt))


*/Preguntas*/

(defrule preguntar-cubre
    (need-cubre ?)
    
    =>
    (printout t "Como se cubre el  animal? ")
    (assert (cubre (read))))
(defrule preguntar-piel
    (need-piel ?)
    
    =>
    (printout t "Como es la piel del animal? ")
    (assert (piel (read))))
(defrule preguntar-leche
    (need-leche ?)
    
    =>
    (printout t "Da leche el animal? ( si o no)")
    (assert (leche (read))))
(defrule preguntar-reproduce
    (need-reproduce ?)
    
    =>
    (printout t "Como se reproduce el animal? (mamifero,oviparo) ")
    (assert (reproduce (read))))
 (defrule preguntar-pico
    (need-pico ?)
    
    =>
    (printout t "Tiene pico el animal? (si o no) ")
    (assert (pico (read))))
(defrule preguntar-garras
    (need-garras ?)
    
    =>
    (printout t "Tiene garras el animal? (si o no) ")
    (assert (garras (read))))
   
(defrule preguntar-comer
    (need-comer ?)
    
    =>
    (printout t "Que dieta sigue el  animal? (carnivoro, omnivoro....) ")
    (assert (comer (read))))
   (defrule preguntar-color
    (need-color ?)
    
    =>
    (printout t "De que color es el animal? ")
    (assert (color (read))))
(defrule preguntar-rayas
    (need-rayas ?)
    
    =>
    (printout t "Tiene rayas el animal? en caso afirmativo de que color son?")
    (assert (rayas (read))))

(defrule preguntar-vuela
    (need-vuela ?)
    
    =>
    (printout t "Vuela el animal? Como vuela? (mal, bien, muy bien...)")
    (assert (vuela (read))))
   
(defrule preguntar-nada
    (need-nada ?)
    
    =>
    (printout t "Sabe nadar el animal? Como nada? (bien,mal....)")
    (assert (nada (read))))
   
   
   


 (printout t "Vamos a jugar a un juego" crlf)
(reset)
(run)