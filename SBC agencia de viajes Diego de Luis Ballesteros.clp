
;;;;;;;SISTEMA DE LA AGENCIA DE VIAJES;;;;;;;

;; DIEGO DE LUIS BALLESTEROS, GRUPO 3 ;;

;;; ======== PROPIEDADES QUE VOY A USAR ======= ;;;


;El sistema utilizará el tiempo que va a hacer, tomando como valores posibles 
;bueno, malo o normal.  Se representa  (tiempo  bueno|malo)
;Este hecho se implementará posteriormente para ser calculado de forma 
;automática, pero en este prototipo se pregunta para ser introducido manualmente

;El sistema utilizará el presupuesto del usuario, tomando como valores posibles 
;alto o bajo.  Se representa  (presupuesto  alto|bajo)
;En este prototipo se pregunta para ser introducido manualmente

;El sistema utilizará el transporte preferido del usuario, tomando como valores posibles 
;avion, tren, bus, otro, ns (significa no sé).  Se representa  (transporte avion|tren|bus|otro|ns)
;En este prototipo se pregunta para ser introducido manualmente

;El sistema utilizará la localización preferida del usuario, tomando como valores posibles 
;costa, montaña, otro, ns.  Se representa  (transporte costa|montaña|otro|ns)
;En este prototipo se pregunta para ser introducido manualmente

;El sistema utilizará la preferencia de turismo del usuario, tomando como valores posibles 
;si, no, ns.  Se representa  (turistico si|no|ns)
;En este prototipo se pregunta para ser introducido manualmente


;; ===== VIAJES ==== ;;

(deftemplate viaje
    (slot codigo)
    (slot destino )
    (slot dia_salida)
    (slot transporte)
    (slot duracion)
    (slot precio)
    (slot beneficio_agencia)
)

;; ===== INFORMACIÓN DESTINOS ==== ;;
;Se representará mediante un deffacts los diferentes 
;destinos de tal manera que esté el destino, el código
;el precio(por dia de estancia), el precio del transporte y el beneficio de la agencia


;ademas se añade las caracteristicas de como qué opciones escoja cada persona
;en este orden después de lo que se lleva la agencia: tiempo, presupuesto, transporte
;localizacion y turismo
(deffacts Destinos
    (lugar LOND londres 350 70 30 MALO ALTO AVION NS SI)
    (lugar LOND londres 350 70 30 MALO ALTO AVION OTRO SI)
    (lugar SN sierranevada 150 10 30 MALO BAJO BUS MONTANIA SI)
    (lugar SN sierranevada 150 10 30 MALO BAJO OTRO MONTANIA SI)
    (lugar SN sierranevada 150 10 30 MALO BAJO NS MONTANIA SI)
    (lugar SN sierranevada 150 10 30 MALO BAJO BUS MONTANIA NS)
    (lugar SN sierranevada 150 10 30 MALO BAJO OTRO MONTANIA NS)
    (lugar SN sierranevada 150 10 30 MALO BAJO NS MONTANIA NS)
    (lugar AC lacorunia 200 60 30 MALO BAJO NS COSTA NS)
    (lugar AC lacorunia 200 60 30 MALO BAJO NS COSTA SI)
    (lugar AC lacorunia 200 60 30 MALO BAJO TREN COSTA NS)
    (lugar AC lacorunia 200 60 30 MALO BAJO TREN COSTA SI)
    (lugar AC lacorunia 200 60 30 MALO BAJO OTRO COSTA NS)
    (lugar AC lacorunia 200 60 30 MALO BAJO OTRO COSTA SI)
    (lugar AC lacorunia 200 60 30 MALO BAJO BUS COSTA NS)
    (lugar AC lacorunia 200 60 30 MALO BAJO BUS COSTA SI)
    (lugar SAN santander 250 60 30 MALO ALTO AVION COSTA NS)
    (lugar SAN santander 250 60 30 MALO ALTO BUS COSTA NS)
    (lugar SAN santander 250 60 30 MALO ALTO OTRO COSTA NS)
    (lugar SAN santander 250 60 30 MALO ALTO NS COSTA NS)
    (lugar BAR barcelona 300 70 30 BUENO ALTO BUS COSTA SI)
    (lugar BAR barcelona 300 70 30 BUENO ALTO OTRO COSTA SI)
    (lugar BAR barcelona 300 70 30 BUENO ALTO TREN COSTA SI)
    (lugar BAR barcelona 300 70 30 BUENO ALTO NS COSTA SI)
    (lugar MAD madrid 340 35 30 BUENO ALTO TREN OTRO SI)
    (lugar MAD madrid 340 35 30 BUENO ALTO BUS OTRO SI)
    (lugar MAD madrid 340 35 30 BUENO ALTO OTRO OTRO SI)
    (lugar MAD madrid 340 35 30 BUENO ALTO AVION OTRO SI)
    (lugar MAD madrid 340 35 30 BUENO ALTO NS OTRO SI)
    (lugar MALL mallorca 300 80 30 BUENO ALTO AVION COSTA SI)
    (lugar AL almeria 100 30 30 BUENO BAJO BUS COSTA NO)
    (lugar AL almeria 100 30 30 BUENO BAJO TREN COSTA NO)
    (lugar AL almeria 100 30 30 BUENO BAJO NS COSTA NO)
    (lugar AL almeria 100 30 30 BUENO BAJO BUS COSTA NS)
    (lugar AL almeria 100 30 30 BUENO BAJO TREN COSTA NS)
    (lugar AL almeria 100 30 30 BUENO BAJO NS COSTA NS)
    (lugar MM marmenor 150 30 30 BUENO ALTO OTRO COSTA NO)
    (lugar MM marmenor 150 30 30 BUENO ALTO NS COSTA NO)
    (lugar MM marmenor 150 30 30 BUENO BAJO OTRO COSTA NO)
    (lugar MM marmenor 150 30 30 BUENO BAJO NS COSTA NO)
    (lugar COR cordoba 150 20 30 BUENO BAJO BUS OTRO SI)
    (lugar COR cordoba 150 20 30 BUENO BAJO OTRO OTRO SI)
    (lugar COR cordoba 150 20 30 BUENO BAJO NS OTRO SI)
    (lugar COR cordoba 150 20 30 BUENO BAJO BUS MONTANIA SI)
    (lugar COR cordoba 150 20 30 BUENO BAJO OTRO MONTANIA SI)
    (lugar COR cordoba 150 20 30 BUENO BAJO NS MONTANIA SI)
)
;;========= MOTIVOS PARA CADA DESTINO ============;;

;crear un motivo para cada destino y poder recomendarlo
(deffacts Motivos 
    (motivo LON "tiene un tiempo lluvioso/frio, el presupuesto para ir allí suele ser alto, el transporte más fácil, cómodo y barato es el avión, está ubicado en un lugar llano y es bastante turístico")
    (motivo SAN "tiene un tiempo lluvioso/frio, el presupuesto para ir allí suele ser medio/alto, el transporte que se puede elegir es variado, está ubicado en un lugar costero y es algo turístico")
    (motivo SN "tiene un tiempo nevado/frio, el presupuesto para ir allí suele ser medio/bajo, el transporte que se puede elegir es variado, está ubicado en un lugar muy montañoso y es algo turístico")
    (motivo BAR "tiene un tiempo soleado/calido y a veces algo lluvioso, el presupuesto para ir allí suele ser medio/alto, el transporte que se puede elegir es variado, está ubicado en un lugar costero y es muy turístico")
    (motivo MM "tiene un tiempo soleado/templado, el presupuesto para ir allí suele ser medio/bajo, está ubicado en un lugar costero y es algo/poco turístico")
    (motivo MALL "tiene un tiempo soleado/nublado/templado, el presupuesto para ir allí suele ser medio/alto, el transporte que se puede elegir es avion, está ubicado en un lugar costero y es muy turístico")
    (motivo COR "tiene un tiempo soleado/calido, el presupuesto para ir allí suele ser bajo, el transporte que se puede elegir es variado, está ubicado en un lugar llano/con lomas y es muy turístico")
    (motivo AL "tiene un tiempo soleado/calido, el presupuesto para ir allí suele ser bajo, el transporte que se puede elegir es variado, está ubicado en un lugar costero y es algo turístico")
    (motivo MAD "tiene un tiempo lluvioso/soleado/templado, el presupuesto para ir allí suele ser medio/alto, el transporte que se puede elegir es variado, está ubicado en un lugar llano y es muy turístico")
    (motivo AC "tiene un tiempo lluvioso/frio, el presupuesto para ir allí suele ser medio/bajo, el transporte que se puede elegir es variado, está ubicado en un lugar costero y es un poco turístico")
)

;;; ========= INICIO DEL PROGRAMA ========== ;;; 

(defrule inicio_programa
    (declare (salience 9999))    
    =>    
    (printout t "Hola, bienvenido a la agencia de viajes de Granada, mi funcion es aconsejarte que viaje escoger." crlf)
    (printout t "Para ello, voy a realizarte una serie de preguntas y en base a tus respuestas deducire cual es el destino mas apropiado para ti." crlf)
    (printout t "Si en algun momento no te apetece seguir respondiendo a mis preguntas, escribe PARAR." crlf crlf)
    (printout t crlf crlf)
    (printout t "¿Tiene claro que cosas busca en un viaje? Respuesta posibles SI|NO" crlf crlf)
    (assert (conocido (lowcase (read))))
    ;(focus ModuloPreguntas)
)
;comprobamos que la respuesta introducida es correcta
(defrule respuesta_preguntas_viaje_conocido_correcta
    (declare (salience 9999))
    ?f <- (conocido ?respuesta)
    (test
        (and
            (neq ?respuesta si)
            (neq ?respuesta no)  
        )
    )
    =>
    (printout t "Debe introducir una respuesta valida: SI | NO : " crlf)
    (retract ?f)
    (assert (conocido (lowcase (read))))
)
;en caso de que el usuario no sepa que viaje hacer pasamos al modulo de incertidumbre
(defrule modulo_incertidumbre
    (declare (salience 9998)) 
    (conocido no)   
    =>    
    (assert  (Modulo Incertidumbre))
)
;si el usuario tiene claro que tipo de destino quiere le hacemos una preguntas
(defrule modulo_preguntas
    (declare (salience 9998)) 
    (conocido si)   
    =>    
    (assert  (Modulo ModPreg))
)

;;;;; PARA EL APARTADO A: cuando el usuario tiene claro qué tipo de destino esta buscando

;;; ========= MODULO PREGUNTAS ============ ;;;

;(defmodule ModuloPreguntas (export ?ALL))

; PREGUNTAS
(deffacts Preguntas
   
    (pregunta TIEMPO)
    (pregunta PRESUPUESTO)
    (pregunta TRANSPORTE)
    (pregunta LOCALIZACION)
    (pregunta TURISMO)
    (pregunta fechas)
    (preguntar gusta)
    (turno fech)
)



;aquí añadiré todas las preguntas

;pregunta sobre turismo
(defrule preg_turismo
    (declare (salience 5))
    (Modulo ModPreg)
    ?f <- (pregunta TURISMO)
    =>
    (retract ?f)
    (printout t "¿Quieres un lugar turístico? RESPUESTAS POSIBLES: (SI | NO | NS)" crlf)
    (assert (respuesta TURISMO (upcase (read))))
)
;preguntas acerca de las fechas y la duracion de la
;estancia del viaje


;declaro turnos para que vaya preguntando por turnos las cosas
(defrule preg_fechas
    (declare (salience 10))
    (Modulo ModPreg)
    (pregunta fechas)
    ?f<- (turno fech)
    =>
    (retract ?f)
    (printout t "¿Cuánto tiempo quieres estar y a partir de qué día?" crlf " FORMATO RESPUESTA: (escribir cada campo con dos cifras)" crlf "nota: no debe parar mientras escribe la duracion y las fechas" crlf", es la minima informacion necesaria" crlf)
    (assert (turno dur))
    
)
 
;duracion del viaje
(defrule preg_fechas_dur
    (declare (salience 10))
    (Modulo ModPreg)
    (pregunta fechas)
    ?f<- (turno dur)
    =>
    (retract ?f)
    (printout t "DURACION: " crlf)
    (assert (respuesta duracion (read)))
    (assert (turno a))
)

;año que comienza el viaje

(defrule preg_fechas_anio
    (declare (salience 10))
    (Modulo ModPreg)
    (pregunta fechas)
    ?f<- (turno a)
    =>
    (retract ?f)
    (printout t "ANIO: " crlf)
    (assert (respuesta anio (read)))
    (assert (turno m))
)

;mes que comienza el viaje

(defrule preg_fechas_mes    
    (declare (salience 10))
    (Modulo ModPreg)
    (pregunta fechas)
    ?f <- (turno m)
    =>
    (retract ?f)
    (printout t "MES: " crlf)
    (assert (respuesta mes (read)))
    (assert (turno d))
)

;dia que comienza el viaje

(defrule preg_fechas_dia
    (declare (salience 10))
    (Modulo ModPreg)
    ?f <- (pregunta fechas)
    ?f1 <- (turno d)
    =>
    (retract ?f)
    (retract ?f1)
    (printout t "DIA: " crlf)
    (assert (respuesta dia (read)))
)

;pregunta sobre tiempo

(defrule preg_tiempo
    (declare (salience 9))
    (Modulo ModPreg)
    ?f <- (pregunta TIEMPO)
    =>
    (retract ?f)
    (printout t "¿Que clima quieres? RESPUESTAS POSIBLES: (BUENO | MALO) ENTIENDASE MALO POR LLUEVIOSO/NIEVE/FRIO" crlf)
    (assert (respuesta TIEMPO (upcase (read))))
)

;pregunta sobre transporte

(defrule preg_transporte
    (declare (salience 7))
    (Modulo ModPreg)
    ?f <- (pregunta TRANSPORTE)
    =>
    (retract ?f)
    (printout t "¿Que transporte prefieres? RESPUESTAS POSIBLES: (AVION | TREN | BUS | OTRO | NS)" crlf)
    (assert (respuesta TRANSPORTE (upcase (read))))
)

;pregunta sore presupuesto

(defrule preg_presupuesto
    (declare (salience 8))
    (Modulo ModPreg)
    ?f <- (pregunta PRESUPUESTO)
    =>
    (retract ?f)
    (printout t "¿Que presupuesto tienes? RESPUESTAS POSIBLES: (ALTO | BAJO )" crlf)
    (assert (respuesta PRESUPUESTO (upcase (read))))
)

;pregunta sobre localización

(defrule preg_localizacion
    (declare (salience 6))
    (Modulo ModPreg)
    ?f <- (pregunta LOCALIZACION)
    =>
    (retract ?f)
    (printout t "¿Que localización te gusta? RESPUESTAS POSIBLES: (COSTA | MONTANIA | OTRO | NS)" crlf)
    (assert (respuesta LOCALIZACION (upcase (read))))
)

;Mediante esta regla comprobaremos que las preguntas que tienen como respuesta
;SI | NO | NS, reciben una respuesta válida. En caso contrario, se le indica al
;usuario que introduzca de nuevo la respuesta. 

;en nuestro caso solo hay una que es la de turismo

(defrule respuesta_preguntas_SiNoNS
    (declare (salience 999))
    (Modulo ModPreg)
    ?f <- (respuesta TURISMO ?respuesta)
    (test
        (and
            (neq ?respuesta SI)
            (and
                (neq ?respuesta NO)
                (neq ?respuesta NS) 
            )
        )
    )
    =>
    (printout t "Debe introducir una respuesta valida: SI | NO | NS: " crlf)
    (retract ?f)
    (assert (pregunta TURISMO))
)

;si la respuesta al presupuesto no es ALTO | BAJO

(defrule respuesta_pregunta_presupuesto
    (declare (salience 999))
    (Modulo ModPreg)
    ?f <- (respuesta PRESUPUESTO ?respuesta)
    (test
        (and
            (neq ?respuesta ALTO)
            (neq ?respuesta BAJO)
        )
    )
    =>
    (printout t "Debe introducir una respuesta valida: ALTO | BAJO: " crlf)
    (retract ?f)
    (assert (pregunta PRESUPUESTO))
)

;si la respuesta al transporte no es AVION | TREN | BUS | OTRO | NS

(defrule respuesta_pregunta_transporte
    (declare (salience 999))
    (Modulo ModPreg)
    ?f <- (respuesta TRANSPORTE ?respuesta)
    (test
        (and
            (neq ?respuesta AVION)
            (and
                (neq ?respuesta TREN)
                (and
                    (neq ?respuesta BUS)
                    (and
                        (neq ?respuesta OTRO)
                        (neq ?respuesta NS)
                    )
                )
            )
        )
    )
    =>
    (retract ?f)
    (printout t "Debe introducir una respuesta valida: (AVION | TREN | BUS | OTRO | NS): " crlf)
    (assert (pregunta TRANSPORTE))
)

;si la respuesta a la localización no es COSTA | MONTANIA | OTRO | NS

(defrule respuesta_pregunta_localizacion
    (declare (salience 999))
    (Modulo ModPreg)
    ?f <- (respuesta LOCALIZACION ?respuesta)
    (test
        (and
            (neq ?respuesta COSTA)
            (and
                (neq ?respuesta MONTANIA)
                (and
                    (neq ?respuesta OTRO)
                    (neq ?respuesta NS)
                )
            )
        )
    )
    =>
    (retract ?f)
    (printout t "Debe introducir una respuesta valida: (COSTA | MONTANIA | OTRO | NS): " crlf)
    (assert (pregunta LOCALIZACION))
)

;si la respuesta al tiempo no es BUENO | MALO

(defrule respuesta_pregunta_tiempo
    (declare (salience 999))
    (Modulo ModPreg)
    ?f <- (respuesta TIEMPO ?respuesta)
    (test
        (and
            (neq ?respuesta BUENO)
            (neq ?respuesta MALO)
        )
    )
    =>
    (printout t "Debe introducir una respuesta valida: BUENO | MALO: " crlf)
    (retract ?f)
    (assert (pregunta TIEMPO))
)
;si la respuesta al formato de la fecha es incorrecta
;tenemos que definir varias reglas. una para la duración
;otra para el dia y asi

(defrule respuesta_pregunta_duracion
    (declare (salience 999))
    (Modulo ModPreg)
    ?f <- (respuesta duracion ?respuesta)
    ?f1 <- (turno a)
    (test
        (or
            (> ?respuesta 45)
            (< ?respuesta 1)
        )
    )
    =>
    (printout t "Debe introducir una duracion valida: entre 1 y 45 días: " crlf)
    (retract ?f)
    (retract ?f1)
    (assert (turno dur))
)


;si el año introducido no está entre 2023 y 2099
(defrule respuesta_pregunta_anio
    (declare (salience 999))
    (Modulo ModPreg)
    ?f <- (respuesta anio ?respuesta)
    ?f1 <- (turno m)
    (test
        (or
            (> ?respuesta 99)
            (< ?respuesta 23)
        )
    )
    =>
    (printout t "Debe introducir un anio valido: entre 00 y 99 (2000 - 2099) : " crlf)
    (retract ?f)
    (retract ?f1)
    (assert (turno a))
)

;si el dia es incorrecto para cada mes

(defrule respuesta_pregunta_dia
    (declare (salience 999))
    (Modulo ModPreg)
    ?f <- (respuesta dia ?respuesta)
    (respuesta mes ?mes)
    (test
        (or
            (and ;enero
                (eq ?mes 1)  
                (> ?respuesta 31)
            )
            (or
            (and ;febrero
                (eq ?mes 2)  
                (> ?respuesta 28)
            )
            (or
            (and ;marzo
                (eq ?mes 3)  
                (> ?respuesta 31)
            )
            (or
            (and ;abril
                (eq ?mes 4)  
                (> ?respuesta 30)
            )
            (or
            (and ;mayo
                (eq ?mes 5)  
                (> ?respuesta 31)
            )
            (or
            (and ;junio
                (eq ?mes 6)  
                (> ?respuesta 30)
            )
            (or
            (and ;julio
                (eq ?mes 7)  
                (> ?respuesta 31)
            )
            (or
            (and ;agosto
                (eq ?mes 8)  
                (> ?respuesta 31)
            )
            (or
            (and ;septiembre
                (eq ?mes 9)  
                (> ?respuesta 30)
            )
            (or
            (and ;octubre
                (eq ?mes 10)  
                (> ?respuesta 31)
            )
            (or
            (and ;noviembre
                (eq ?mes 11)  
                (> ?respuesta 30)
            )
            (or
            (and ;dicciembre
                (eq ?mes 12)  
                (> ?respuesta 31)
            )
            (< ?respuesta 1) ;dia menor que 1
                
            ))))))))))))
    )  
    =>
    (printout t "Debe introducir un dia valido: entre 1 y 31 para meses impares excepto febrero que es hasta 28 y entre 1 y 30 para meses pares " crlf)
    (retract ?f)
    (assert (turno d))
    (assert (pregunta fechas))
)

;si el mes es incorrecto

(defrule respuesta_pregunta_mes
    (declare (salience 999))
    (Modulo ModPreg)
    ?f <- (respuesta mes ?respuesta)
    ?f1 <- (turno d)
    (test
        (or
            (> ?respuesta 12)
            (< ?respuesta 1)
        )
    )
    =>
    (printout t "Debe introducir un mes valido: entre 1 y 12 : " crlf)
    (retract ?f)
    (retract ?f1)
    (assert (turno m))
)

;;; ================ TERMINA DE PREGUNTAR ============== ;;; 

;Con esta regla, comprobaremos si el usuario decide parar las preguntas. 

(defrule parar_preguntas
    (declare (salience 9999))
    (Modulo ModPreg)
    ?f <- (respuesta ?pregunta ?respuesta)
    (respuesta duracion ?dur)
    (respuesta dia ?di)
    (respuesta mes ?me)
    (respuesta anio ?an)
    (test (eq ?respuesta PARAR))
    =>
    (retract ?f)
    (printout t "Vale, no hare mas preguntas. " crlf)
    (assert (rParar SI))
)

;empieza a recalcular el destino si el destino ofertado no es del gusto del cliente
(defrule recalcular_destino
    (declare (salience -100))
    ?f1 <- (Modulo ModPreg)
    ?f <- (recalcular si)
    =>
    (retract ?f)
    (retract ?f1)
    (assert (Modulo MCalcular))
)

;Mediante esta regla comprobaremos si no quedan mas
;preguntas por responder. 
;tambien asertaremos el dia el mes y el año en un solo hecho con un campo

(defrule no_quedan_pregs
    (declare (salience 100))
    ?f <- (Modulo ModPreg)
    (respuesta TIEMPO ?r1)
    (respuesta PRESUPUESTO ?r2)
    (respuesta TRANSPORTE ?r3)
    (respuesta LOCALIZACION ?r4)
    (respuesta TURISMO ?r5)
    (respuesta duracion ?dur)
    ?p1 <-(respuesta dia ?di)
    ?p2 <-(respuesta mes ?me)
    ?p3 <-(respuesta anio ?an)
    
    =>

    (assert (diasalida (str-cat ?di "/" ?me "/" ?an)))
    (assert (Modulo MCalcular))
    (retract ?f)
    (retract ?p1)
    (retract ?p2)
    (retract ?p3)
    ;(focus ModuloCalcular)
)


;en caso que se quiera para de hacer preguntas 
;debemos calcular aún así el día de salida ya que es obligatorio responderlo
(defrule preg_parar
    (declare (salience 5000))
    ?f <- (Modulo ModPreg)
    (rParar SI)
    ?p1 <-(respuesta dia ?di)
    ?p2 <-(respuesta mes ?me)
    ?p3 <-(respuesta anio ?an)
    =>
    (retract ?f)
    (assert (diasalida (str-cat ?di "/" ?me "/" ?an)))
    (assert (Modulo MCalcular))
    (retract ?p1)
    (retract ?p2)
    (retract ?p3)
    ;(focus ModuloCalcular)
)




;;; ========= CALCULO DEL VIAJE MAS ACONSEJABLE ============ ;;;

;(defmodule ModuloCalcular (export ?ALL) (import ModuloPreguntas ?ALL))

;Ahora voy a calcular una vez que tengo el conocimiento
;Experto los viajes para los usuarios que respondan TODAS LAS PREGUNTAS


;eliminamos preguntas sobrantes antes de nada
(defrule eliminar_preguntas
    (declare (salience 9999))
    (Modulo MCalcular)
    ?f1 <- (pregunta ?p)
=>
    (retract ?f1)
)

;;;ALGUNA DEDUCCION ;;;


;CONCEPTO: vamos a deducir que si el presupuesto de la persona es alto y 
;no nos ha dicho que transporte prefiere, este será el avión

(defrule cambiar_respuesta_transporte
    (declare (salience 7000))
    (Modulo MCalcular)
    (respuesta PRESUPUESTO ALTO)
    ?f <- (respuesta TRANSPORTE NS)
=>
    (retract ?f)
    (assert(modificar TRANSPORTE AVION))
)
;no respondio
(defrule cambiar_respuesta_transporte1
    (declare (salience 6000))
    (Modulo MCalcular)
    (respuesta PRESUPUESTO ALTO)
    (rParar SI)
=>
    (assert(respuesta TRANSPORTE AVION))
)
;respondio ns
(defrule cambiar_respuesta_transporte2
    (declare (salience 6500))
    (Modulo MCalcular)
    (respuesta TRANSPORTE ?tras)
    ;testeamos que no haya respuesta a transporte
    (test
        (and
            (eq ?tras AVION)
        (and
            (eq ?tras BUS)
        (and
            (eq ?tras OTRO)
            (eq ?tras TREN)
            )))
    )
    ?f <- (modificar TRANSPORTE AVION)
=>
    (retract ?f)
    (assert(respuesta TRANSPORTE AVION))
)


;CONCEPTO: vamos a deducir que si el presupuesto de la persona es bajo y 
;no nos ha dicho que transporte prefiere, este será el bus

(defrule deduccion_presupuesto_bajo
    (declare (salience 7000))
    (Modulo MCalcular)
    (respuesta PRESUPUESTO BAJO)
    ?f <- (respuesta TRANSPORTE NS)
=>
    (retract ?f)
    (assert(modificar TRANSPORTE BUS))
)
;no respondio
(defrule deduccion_presupuesto_bajo1
    (declare (salience 6000))
    (Modulo MCalcular)
    (respuesta PRESUPUESTO BAJO)
    (respuesta TRANSPORTE ?tras)
    ;testeamos que no haya respuesta a transporte
    (test
        (and
            (eq ?tras AVION)
        (and
            (eq ?tras BUS)
        (and
            (eq ?tras OTRO)
            (eq ?tras TREN)
            )))
    )
    (rParar SI)
=>
    (assert(respuesta TRANSPORTE BUS))
)
;respondio ns
(defrule deduccion_presupuesto_bajo2
    (declare (salience 6500))
    (Modulo MCalcular)
    ?f <- (modificar TRANSPORTE BUS)
=>
    (retract ?f)
    (assert(respuesta TRANSPORTE BUS))
)

;CONCEPTO: vamos a deducir que si la localizacion  de la persona es costa y 
;no nos ha dicho si prefiere turismo, esta será que si prefiere turismo
;ya que en la costa normalmente siempre hay turismo.
(defrule deduccion_localizacion_costa
    (declare (salience 7000))
    (Modulo MCalcular)
    (respuesta LOCALIZACION COSTA)
    ?f <- (respuesta TURISMO NS)
=>
    (retract ?f)
    (assert (modificar TURISMO SI))
)
;no respondido
(defrule deduccion_localizacion_costa1
    (declare (salience 6000))
    (Modulo MCalcular)
    (respuesta LOCALIZACION COSTA)
    (respuesta TURISMO ?tur)
    ;testeamos que no haya respuesta a localizacion
    (test
        (and
            (eq ?tur SI)
            (eq ?tur NO)
        )
    )
    (rParar SI)
=>
    (assert (respuesta TURISMO SI))
)
;respondido ns
(defrule deduccion_localizacion_costa2
    (declare (salience 6500))
    (Modulo MCalcular)
    ?f <- (modificar TURISMO SI)
=>
    (retract ?f)
    (assert (respueta TURISMO SI))
)

;para todas las reglas se buscará el lugar que tenga
;como código "COD". también se suarán los campos ?p y ?t
;que es la suma del precio del hotel (con comida y tal) con el transporte
;?p habrá que multiplicarlo por la duracion


;; REGLAS DE CINCO PREGUNTAS  ;;

;con estas reglas vamos a recomendar destinos de manera más específica

;recomienda londres
(defrule 5_pregs_recomienda_londres
    (declare (salience 100))
    (Modulo MCalcular)
    (respuesta duracion ?dur)
    (diasalida ?fecha)
    (respuesta TIEMPO MALO)
    (respuesta PRESUPUESTO ALTO)
    (respuesta TRANSPORTE AVION)
    (respuesta LOCALIZACION ?loc)
    (test (or
            (eq ?loc NS)
            (eq ?loc OTRO)
        )
    )
    (respuesta TURISMO SI)
    (lugar LOND ?n ?p ?t ?a $?)
=>
    ;multiplicamos el precio de cada dia por la duracion
    (assert (viaje (codigo LOND) (destino ?n) (dia_salida ?fecha) (transporte AVION) (duracion ?dur) (precio (+ (* ?p ?dur) ?t)) (beneficio_agencia ?a)))
    (assert (adecuado LOND "El viaje ofertado será londres ya que tiene un buen presupuesto, le gustaría viajar en avión y puede encontrar vuelos directos muy fácilmente y prefiere un clima lluvioso"))

)

;a sierra nevada
(defrule 5_pregs_recomienda_SN
    (declare (salience 100))
    (Modulo MCalcular)
    (respuesta TIEMPO MALO)
    (respuesta PRESUPUESTO BAJO)
    (respuesta TRANSPORTE ?tra)
    (test (or
            (eq ?tra BUS)
            (or
                (eq ?tra OTRO)
                (eq ?tra NS)
            )
        )
    )
    (respuesta LOCALIZACION MONTANIA)

    (respuesta TURISMO ?tur)
    (test (or
            (eq ?tur SI)
            (eq ?tur NS)
        )
    )
    (respuesta duracion ?dur)
    (diasalida ?fecha)
    (lugar SN ?n ?p ?t ?a $?)

=>
    ;multiplicamos el precio de cada dia por la duracion
    (assert (viaje (codigo SN) (destino ?n) (dia_salida ?fecha) (transporte ?tra) (duracion ?dur) (precio (+ (* ?p ?dur) ?t)) (beneficio_agencia ?a)))
    (assert (adecuado SN "El viaje ofertado será sierra nevada ya que tiene un presupuesto bajo,  le gustaría viajar en un transporte barato, le gusta la montaña, puede encontrar buses directos muy fácilmente y prefiere un clima frio/nieve"))

)

;a santander
(defrule 5_pregs_recomienda_santander
    (declare (salience 100))
    (Modulo MCalcular)
    (respuesta TIEMPO MALO)
    (respuesta PRESUPUESTO ALTO)
    (respuesta TRANSPORTE ?tra)
    (respuesta LOCALIZACION COSTA)

    (respuesta TURISMO ?tur)
    (test (or
            (eq ?tur SI)
            (eq ?tur NS)
        )
    )
    (respuesta duracion ?dur)
    (diasalida ?fecha)
    (lugar SAN ?n ?p ?t ?a $?)

=>
    ;multiplicamos el precio de cada dia por la duracion
    (assert (viaje (codigo SAN) (destino ?n) (dia_salida ?fecha) (transporte ?tra) (duracion ?dur) (precio (+ (* ?p ?dur) ?t)) (beneficio_agencia ?a)))
    (assert (adecuado SAN " tiene un presupuesto alto le gustaría viajar en cualquier transporte , puede encontrar buses y aviones directos muy fácilmente y prefiere un clima frio/lluvia"))

)
;con esta regla vamos a recoger los datos generales para buscar un destino de todos los posibles

(defrule 5_pregs_recomienda_BUSCAR
    (declare (salience 100))
    (Modulo MCalcular)
    (respuesta TIEMPO ?ti)
    (respuesta PRESUPUESTO ?pre)
    (respuesta TRANSPORTE ?tra)
    (respuesta LOCALIZACION ?loc)
    (respuesta TURISMO ?tur)
    (respuesta duracion ?dur)
    (lugar ?cod ?n ?p ?t ?a ?ti ?pre ?tra ?loc ?tur)
    (diasalida ?fecha)

=>
    (assert (calcular adecuado))
    ;multiplicamos el precio de cada dia por la duracion
    (assert (viaje (codigo ?cod) (destino ?n) (dia_salida ?fecha) (transporte ?tra) (duracion ?dur) (precio (+ (* ?p ?dur) ?t)) (beneficio_agencia ?a)))
    (assert (ofertar ?cod))
)

;; REGLAS ALTERNATIVAS  ;;
;estas reglas se activarán en caso de que no se encuentre respuesta a las cinco características o el
;usuario no responda a todas las preguntas


;si solo se responden 4 preguntas

(defrule 4_pregs_recomienda_BUSCAR
    (declare (salience -96))
    (Modulo MCalcular)
    (respuesta ?preg ?ti)
    (respuesta ?preg1 ?pre)
    (respuesta ?preg2 ?tra)
    (respuesta ?preg3 ?loc)
    (respuesta duracion ?dur)
    (lugar ?cod ?n ?p ?t ?a ?ti ?pre ?tra ?loc ?tur)
    (diasalida ?fecha)

=>
    (assert (calcular adecuado))
    ;multiplicamos el precio de cada dia por la duracion
    (assert (viaje (codigo ?cod) (destino ?n) (dia_salida ?fecha) (transporte ?tra) (duracion ?dur) (precio (+ (* ?p ?dur) ?t)) (beneficio_agencia ?a)))
    (assert (ofertar ?cod))
)

;para tres preguntas respondidas
(defrule 3_pregs_recomienda_BUSCAR
    (declare (salience -99))
    (Modulo MCalcular)
    (respuesta ?preg ?ti)
    (respuesta ?preg1 ?pre)
    (respuesta ?preg2 ?tra)
    (respuesta duracion ?dur)
    (lugar ?cod ?n ?p ?t ?a ?ti ?pre ?tra ?loc ?tur)
    (diasalida ?fecha)

=>
    (assert (calcular adecuado))
    ;multiplicamos el precio de cada dia por la duracion
    (assert (viaje (codigo ?cod) (destino ?n) (dia_salida ?fecha) (transporte ?tra) (duracion ?dur) (precio (+ (* ?p ?dur) ?t)) (beneficio_agencia ?a)))
    (assert (ofertar ?cod))
)

;para dos preguntas respondidas
(defrule 2_pregs_recomienda_BUSCAR
    (declare (salience -105))
    (Modulo MCalcular)
    (respuesta ?preg ?ti)
    (respuesta ?preg1 ?pre)
    (respuesta duracion ?dur)
    (lugar ?cod ?n ?p ?t ?a ?ti ?pre ?tra ?loc ?tur)
    (diasalida ?fecha)

=>
    (assert (calcular adecuado))
    ;multiplicamos el precio de cada dia por la duracion
    (assert (viaje (codigo ?cod) (destino ?n) (dia_salida ?fecha) (transporte ?tra) (duracion ?dur) (precio (+ (* ?p ?dur) ?t)) (beneficio_agencia ?a)))
    (assert (ofertar ?cod))
)

;para una pregunta respondida
(defrule 1_pregs_recomienda_BUSCAR
    (declare (salience -110))
    (Modulo MCalcular)
    (respuesta ?preg ?ti)
    (respuesta duracion ?dur)
    (lugar ?cod ?n ?p ?t ?a ?ti ?pre ?tra ?loc ?tur)
    (diasalida ?fecha)

=>
    (assert (calcular adecuado))
    ;multiplicamos el precio de cada dia por la duracion
    (assert (viaje (codigo ?cod) (destino ?n) (dia_salida ?fecha) (transporte ?tra) (duracion ?dur) (precio (+ (* ?p ?dur) ?t)) (beneficio_agencia ?a)))
    (assert (ofertar ?cod))
)

;para 0 preguntas respondidas
(defrule 0_pregs_recomienda_BUSCAR
    (declare (salience -200))
    (Modulo MCalcular)
    (respuesta duracion ?dur)
    (lugar ?cod ?n ?p ?t ?a ?ti ?pre ?tra ?loc ?tur)
    (diasalida ?fecha)

=>
    (assert (calcular adecuado))
    ;multiplicamos el precio de cada dia por la duracion
    (assert (viaje (codigo ?cod) (destino ?n) (dia_salida ?fecha) (transporte ?tra) (duracion ?dur) (precio (+ (* ?p ?dur) ?t)) (beneficio_agencia ?a)))
    (assert (ofertar ?cod))
)

; Terminar si ya se ha aconsejado
(defrule noHayMasCalculos
    (declare (salience 200))
    ?m <- (Modulo MCalcular)
    (adecuado ?codigo ?motivo)
    =>
    (retract ?m)
    ;(focus ModuloConsejo)
    (assert (Modulo MConsejo))
)

; por qué un destino es adecuado
(defrule destinoAdecuado
    (declare (salience 200))
    (Modulo MCalcular)
    (calcular adecuado)
    (ofertar ?cod)
    (motivo ?cod ?motivo)
    =>
    (assert (adecuado ?cod ?motivo))
)

;(defmodule ModuloConsejo (import ModuloCalcular ?ALL))

; Mostrar el consejo final
(defrule realizar_oferta
    (declare (salience 9999))
    (Modulo MConsejo)
    (adecuado ?codigo ?motivo)
    (viaje (codigo ?codigo) (destino ?destino))
    ?f <- (preguntar gusta)
    =>
    (retract ?f)
    (assert (ofertar ?codigo))
    (printout t "El consejo es  que deberias escoger el viaje a " crlf ?destino " porque " ?motivo crlf crlf)
    (printout t "¿Aceptas el viaje? escribe SI|NO" crlf)
    (assert (gusta (upcase (read))))
)

;en caso de que se acepte un viaje!!!!!
(defrule realizar_oferta_aceptada
    (declare (salience 9999))
    (Modulo MConsejo)
    (Aceptado ?codigo)
    (viaje (codigo ?cod) (destino ?n) (dia_salida ?fecha) (transporte ?tra) (duracion ?dur) (precio ?pre) (beneficio_agencia ?a))
    =>

    (printout t "EL VIAJE ACEPTADO ES: "?n " CON CODIGO " ?cod ", FECHA " ?fecha", TRANSPORTE "?tra ", DURACION " ?dur " DIAS "" Y PRECIO " (+ ?pre ?a) "$" crlf)

)


;;comprobar si el usuario ha introducido respuesta correcta a si le gusta el viaje
(defrule respuesta_pregunta_aceptado_rechazado
    (declare (salience 999))
    (Modulo MConsejo)
    ?f <- (gusta ?respuesta)
    (test
        (and
            (neq ?respuesta SI)
            (neq ?respuesta NO)
        )
    )
    =>
    (printout t "Debe introducir una respuesta valida: SI | NO: " crlf)
    (retract ?f)
    (assert (preguntar gusta))
)

;le gusta el viaje
(defrule le_gusta_el_viaje
    (declare (salience 100))
    (Modulo MConsejo)
    (gusta SI)
    (viaje (codigo ?codigo))
=>
    (assert (Aceptado ?codigo))
)

;en caso de que no le guste el viaje
(defrule no_gusta_el_viaje
    (declare (salience 100))
    (Modulo MConsejo)
    (gusta NO)
    (viaje (codigo ?codigo))
=>
    (assert (Rechazado ?codigo))
)

;;REGLAS PARA VER POR QUÉ AL USUARIO NO LE HA GUSTADO EL VIAJE
;con estas reglas iremos pidiendo al usuario que nos diga qué quiere modificar
;o añadir en función de lo que necesite con total libertad de parar cuando
;quiera

;dar distintas opciones en caso de que al usuario no le guste el viaje ofertado

(defrule viaje_rechazado
    (declare (salience 999))
    (Modulo MConsejo)
    (Rechazado ?codigo)
=>
    (printout t "¿qué es lo que no te gusta del viaje? tiempo|presupuesto|transporte|localización|turismo" crlf)
    (printout t "Vaya escribiendo uno a uno y pulse enter. En caso que desee parar escriba PARAR, en caso de que desee salir escriba SALIR" crlf)
    (printout t "Si quiere cambiar su respuesta sobre el una pregunta escriba: tiempo|presupuesto|transporte|localizacion|turismo" crlf)
    (assert (empezar escribir datos))
)

;introducir el dato de por qué no le gusta el viaje
(defrule introducir_datos_cualquiera
    (declare (salience 999))
    (Modulo MConsejo)
    (Rechazado ?codigo)
    ?f <- (empezar escribir datos)
=>
    (printout t "cuando termine escriba parar" crlf)
    (assert (pregunta (upcase (read))))
    (retract ?f)
    
)

;elimina hechos duplicados en caso de que el usuario escriba dos veces lo que quiere
(defrule quitar_hechos_duplicados
    (declare (salience 999))
    (Modulo MConsejo)
    (Rechazado ?codigo)
    ?p <-(pregunta ?pre)
    (duplicatep ?p)
=>
    (retract ?p)
)

;borrar respuestas que hayan sido respondidas anteriormente y el usuario quiera cambiar
(defrule borrar_respuestas
    (declare (salience 7000))
    (Modulo MConsejo)
    (Rechazado ?codigo)
    (pregunta ?pre)
    ?f <- (respuesta ?pre ?loq)
=>
    (retract ?f)
)

;si el usuario quiere parar de escribir lo que necesita añadir o cambiar de lo que le gusta
(defrule comprobar_datos_parar
    (declare (salience 9900))
    ?f2 <- (Modulo MConsejo)
    ?f3 <-(Rechazado ?codigo)
    ?f <- (pregunta PARAR)
    ?f4 <- (adecuado ?codigo ?ra)
    ?f5 <- (ofertar ?codigo)
    ?f6 <- (gusta ?gus)
    ?f7 <- (viaje (codigo ?cod) (destino ?n) (dia_salida ?fecha) (transporte ?tra) (duracion ?dur) (precio ?p) (beneficio_agencia ?a))

=>
    (retract ?f)
    (retract ?f2)
    (retract ?f3)
    (retract ?f4)
    (retract ?f5)
    (retract ?f6)
    (retract ?f7)
    (printout t "Ahora va a cambiar lo que quiere cambiar" crlf)
    (assert (recalcular si)) ;con este hecho podemos recalcular otra vez el viaje tras escribir las cosas nuevas
    (assert (preguntar gusta)) ;tambien debemos volver a crear el hecho para preguntar si le gusta el nuevo destino al usuario
    (assert(Modulo ModPreg))
)

;en caso de que el usuario no escriba nada que quiere cambiar, salir del sistema
(defrule el_usuario_quiere_salir_del_sistema
     (declare (salience 9999))
     ?f2 <- (Modulo MConsejo)
    ?f3 <-(Rechazado ?codigo)
    ?f <- (pregunta SALIR)
    ?f4 <- (adecuado ?codigo ?ra)
    ?f5 <- (ofertar ?codigo)
    ?f6 <- (gusta ?gus)
    ?f7 <- (viaje (codigo ?cod) (destino ?n) (dia_salida ?fecha) (transporte ?tra) (duracion ?dur) (precio ?p) (beneficio_agencia ?a))
=>
    (retract ?f)
    (retract ?f2)
    (retract ?f3)
    (retract ?f4)
    (retract ?f5)
    (retract ?f6)
    (retract ?f7)
    (printout t "Saliendo del sistema. Gracias por su buen trato con nosotros!" crlf)
)

;si el usuario escribe algo que no se encuentra en la base de datos
(defrule comprobar_datos_cualquiera
    (declare (salience 8000))
    (Modulo MConsejo)
    (Rechazado ?codigo)
    ?f <- (pregunta ?p)
    (test (and
                (neq ?p TIEMPO)
            (and
                (neq ?p PRESUPUESTO)
            (and
                (neq ?p TRANSPORTE)
            (and
                (neq ?p LOCALIZACION)
                (neq ?p TURISMO)
            ))))
    )

=>
     (printout t "Debe introducir una respuesta valida" crlf)
    (retract ?f)
    (assert (empezar escribir datos))
)

;regla para volver a preguntar otra vez al usuario por una nueva cosa
;en caso de que no se quiera parar

(defrule introducir_nueva_pregunta
    (declare (salience 100))
    (Modulo MConsejo)
    (Rechazado ?codigo)
    (pregunta ?p)
=>
    (assert (empezar escribir datos))
)


;;;;; AQUI ENTRAMOS EN EL MODULO DE INCERTIDUMBRE ;;;;;

;;APARTADO B CUANDO SE QUIERE ASESORAR AL USUARIO SOBRE DISTINTOS TIPOS DE DESTINOS O VIAJES USANDO INCERTIDUMBRE;;;

;=========== Modulo incertimdumbre ==========;


;vamos a representar otra lista de destinos mas representativa para la incertidumbre
(deffacts defactsDeDestinosIn
    (lugarin lacorunia norte)
    (lugarin madrid centro)
    (lugarin barcelona centro)
    (lugarin santander norte)
    (lugarin mallorca fuera)
    (lugarin almeria sur)
    (lugarin marmenor sur)
    (lugarin sierranevada sur)
    (lugarin londres fuera)
    (lugarin cordoba sur)
    (lugarin marrakesh fuera)
    (lugarin jaca norte)
    
)

; En primer lugar, añadimos la regla que le permitira al usuario escoger 3 destinos
(defrule preguntar_destinos_IN
    (declare (salience 9999))
    (Modulo Incertidumbre)
    (not (destino_1 ?x))
    (not (destino_2 ?y))
    (not (destino_3 ?z))
    =>
    (printout t crlf)
    (printout t crlf)
    (printout t "Elige dos zonas de las que hay a continuacion ofertadas en nuestra agencia." crlf)
    (printout t "Una vez elegidas le haremos diferentes preguntas" crlf)
    (printout t "Sur (peninsula iberica)" crlf)
    (printout t "Norte (peninsula iberica)" crlf)
    (printout t "fuera (fuera de la peninsula iberica: baleares, reino unido y marruecos)" crlf)
    (printout t "Centro (peninsula iberica)" crlf)
    (printout t "Debe escribir los nombres exactamente como aparecen arriba" crlf)
     (printout t "Nota: solo escriba lo que no aparece entre parentesis" crlf)
    (printout t "pulse la tecla enter cada vez que introduzca un destino" crlf) 

    (assert (destino_1 (lowcase (read))))
    (assert (destino_2 (lowcase (read))))

)

; A continuación, añadimos una regla para comprobar 
;que se han introducido los destinos correctamente
(defrule comprobar_entrada_destinos
    (declare (salience 9999))
    (Modulo Incertidumbre)

    ?b <- (destino_1 ?x)
    ?c <- (destino_2 ?y)
    (or
        (test (eq ?x ?y)) 
        (or 
            (not (lugarin ? ?x))
            (not (lugarin ? ?y))
        ) 
    )

    =>
    (retract ?b ?c)
    (printout t "Debe incluir las zonas de la lista mostrada y sin repetir" crlf)
    (printout t crlf)
)

;transformamos los destinos en un solo grupo de hechos
;para poder utilizarlos en las reglas

(defrule unir_destinos
    (declare (salience 8500))
    (destino_1 ?x)
    (destino_2 ?y)
=>
    (assert (destinosFinales ?x))
    (assert (destinosFinales ?y))
)
;aniadimos los destinos a la lista de destinos segun el lugar que prefiera el usuario
;lugar. norte
(defrule transformar_destinos1
    (declare (salience 8000))
    (Modulo Incertidumbre)
    (destinosFinales norte)
    =>
     (assert (destinosin santander santander))
    (assert (destinosin lacorunia lacorunia))
    (assert (destinosin jaca jaca))
)
;lugar: sur
(defrule transformar_destinos2
    (declare (salience 8000))
    (Modulo Incertidumbre)
    (destinosFinales sur)
    =>
    (assert (destinosin cordoba cordoba))
    (assert (destinosin almeria almeria))
    (assert  (destinosin sierranevada sierranevada))
    (assert   (destinosin marmenor marmenor))
)
;lugar: centro
(defrule transformar_destinos3
    (declare (salience 8000))
    (Modulo Incertidumbre)
    (destinosFinales centro)
    =>
    (assert (destinosin madrid madrid))
    (assert (destinosin barcelona barcelona))

)
;lugar: fuera de la península
(defrule transformar_destinos4
    (declare (salience 8000))
    (Modulo Incertidumbre)
    (destinosFinales fuera)
    =>
    (assert (destinosin mallorca mallorca))
    (assert (destinosin londres londres))
    (assert (destinosin marrakesh marrakesh))

)

;;aniado una regla para transformar los lugares de playa
;en evidencia de que al usuario le gusta la playa

(defrule transformar_destinos_evidencia_playa_IN
    (declare (salience 7000))
    (Modulo Incertidumbre)

    (destinosin lacorunia|santander|barcelona|mallorca|almeria|marmenor ?)
     
    =>

    (assert (Evidencia playa si))
)

(defrule transformar_destinos_evidencia_playano_IN
    (declare (salience 8000))
    (Modulo Incertidumbre)

    (destinosin sierranevada|londres|madrid|cordoba|marrakesh|jaca ?)
     
    =>

    (assert (Evidencia playa no))
)


;;AHORA aniadire las reglas que vienen en ejemplo sobre los factores de certeza

; Convertimos cada evidencia en una afirmacion sobre su factor de certeza
(defrule certeza_evidencias
    (declare (salience 9999))
    (Evidencia ?e ?r)
    =>
    (assert (FactorCerteza ?e ?r 1))
)
; Tambien podriamos considerar evidencias con una cierta incertidumbre:
; al preguntar por la evidencia, pedir y recoger directamente el grado de certeza

;;; Funcion encadenado ;;;

(deffunction encadenado (?fc_antecedente ?fc_regla)
    (if (> ?fc_antecedente 0)
        then
            (bind ?rv (* ?fc_antecedente ?fc_regla))
        else
            (bind ?rv 0)
    )
    ?rv
)

;;; Función combinación ;;;

(deffunction combinacion (?fc1 ?fc2)
(if (and (> ?fc1 0) (> ?fc2 0) )
then
(bind ?rv (- (+ ?fc1 ?fc2) (* ?fc1 ?fc2) ) )
else
(if (and (< ?fc1 0) (< ?fc2 0) )
then
(bind ?rv (+ (+ ?fc1 ?fc2) (* ?fc1 ?fc2) ) )
else
(bind ?rv (/ (+ ?fc1 ?fc2) (- 1 (min (abs ?fc1) (abs ?fc2))) ))
)
)
?rv)

;;; Combinar distintas deducciones ;;;

(defrule combinar
    (declare (salience 1))
    (Modulo Calculofactores)
    ?f <- (FactorCerteza ?h ?r ?fc1)
    ?g <- (FactorCerteza ?h ?r ?fc2)
    ?x <- (Razon FactorCerteza ?h ?r ?fc1 ?expl1)
    ?y <- (Razon FactorCerteza ?h ?r ?fc2 ?expl2)
    (test (neq ?fc1 ?fc2))
    
    =>
    (retract ?f ?g ?x ?y)
    (assert (FactorCerteza ?h ?r (combinacion ?fc1 ?fc2)))
    (assert (Razon FactorCerteza ?h ?r (combinacion ?fc1 ?fc2) (str-cat ?expl1 " y " ?expl2)))
)

;;; Certeza de las hipotesis ;;;

(defrule combinar_signo
    (declare (salience 2))
    (FactorCerteza ?h si ?fc1)
    (FactorCerteza ?h no ?fc2)
    =>
    (assert (Certeza ?h (- ?fc1 ?fc2)))
)

;;AQUI LE HAREMOS LAS DIFERENTES PREGUNTAS AL USUARIO

;si el usuario quiere parar de ser preguntado

(defrule respuestaPararIN
 (declare (salience 1))
   (Modulo Incertidumbre)
    ?f <- (Evidencia ?a ?b)
    ?f1 <- (FactorCerteza ?a ?b ?)
    (test  
            (eq ?b parar)  
    )
=>
    (retract ?f ?f1)
    (printout t "vale no se hacen mas preguntas" crlf)
    (assert (rParar si))
)


;pregunta sobre tiempo

(defrule preg_tiempo_IN
    (declare (salience 0))
    (not (Evidencia tiempo_bueno ?a))
    (Modulo Incertidumbre)
    =>

    (printout t "¿Prefieres un clima bueno? RESPUESTAS POSIBLES: (si | no) ENTIENDASE NO BUENO POR LLUEVIOSO/NIEVE/FRIO" crlf)
    (assert (Evidencia tiempo_bueno (lowcase (read))))
)

;pregunta sobre transporte

(defrule preg_transporte_IN
    (declare (salience 0))
    (not (Evidencia transporte_avion ?a))
    (Modulo Incertidumbre)
    =>

    (printout t "¿Prefieres avion? RESPUESTAS POSIBLES: (si | no )" crlf)
    (assert (Evidencia transporte_avion (lowcase (read))))
)

;pregunta sobre turismo
(defrule preg_turismo_IN
    (declare (salience 0))
    (not (Evidencia turistico ?a))
    (Modulo Incertidumbre)
    =>

    (printout t "¿Quieres un lugar turístico? RESPUESTAS POSIBLES: (si | no)" crlf)
    (assert (Evidencia turistico (lowcase (read))))
)

;pregunta sore presupuesto

(defrule preg_presupuesto_IN
    (declare (salience 0))
    (not (Evidencia presupuesto_alto ?a))
    (Modulo Incertidumbre)
    =>

    (printout t "¿Tienes presupuesto alto? RESPUESTAS POSIBLES: (si | no)" crlf)
    (assert (Evidencia presupuesto_alto (lowcase (read))))
)

;pregunta sobre localización

;si prefiere costa
(defrule preg_localizacion_costa_IN
    (declare (salience 0))
    (not (Evidencia localizacion_costa ?a))
    (Modulo Incertidumbre)
    =>

    (printout t "¿Te gusta localizacion de costa? RESPUESTAS POSIBLES: (si | no)" crlf)
    (assert (Evidencia localizacion_costa (lowcase (read))))
)

;si prefiere montania
(defrule preg_localizacion_montania_IN
    (declare (salience 0))
    (Modulo Incertidumbre)
    (not (Evidencia localizacion_montania ?a))
    =>

    (printout t "¿Te gusta localizacion de montania? RESPUESTAS POSIBLES: (si | no)" crlf)
    (assert (Evidencia localizacion_montania (lowcase (read))))
)

;comprobar que las respuestas son correctas
(defrule respuestaCorrectasIN
   (Modulo Incertidumbre)
    ?f <- (Evidencia ?a ?b)
    ?f1 <- (FactorCerteza ?a ?b ?)
    (test 
        (and
            (neq ?b no)
            (neq ?b si)
        )
    )
=>
    (retract ?f)
    (retract ?f1)
    (printout t "respuesta incorrecta. RESPUESTAS VALIDAS: [si | no]" crlf)
)

;; SI TERMINA DE PREGUNTAR PASAMOS A CALCULAR LOS FACTORES DE CERTEZA



(defrule no_quedan_pregs_IN
    (declare (salience 100))
     ?f <- (Modulo Incertidumbre)
    (Evidencia tiempo_bueno ?a)
    (Evidencia transporte_avion ?b)
    (Evidencia turistico ?c)
    (Evidencia presupuesto_alto ?g)
    (Evidencia localizacion_costa ?d)
    (Evidencia localizacion_montania ?e)
    =>
     (retract ?f)
     (assert (Modulo Calculofactores))
)

;;AHORA EMPEZAREMOS CON LAS REGLAS

;en caso de que el usuario no haya respondido preguntas pero si sepa una zona
;a la que le gustaría viajar y alguno de los destinos tiene costa entonces 
;el usuario querra costa con factor de 0.3
(defrule R1
    (Modulo Calculofactores)
    (destinosin lacorunia|santander|barcelona|mallorca|almeria|marmenor ?a)
    (FactorCerteza playa si ?f)
    (not (Evidencia localizacion_costa ?))
    (test (> ?f 0))
=>
    (assert (FactorCerteza ?a si (encadenado ?f 0.3)))
    (assert (Razon FactorCerteza ?a si (encadenado ?f 0.3) "porque es una de nuestras opciones del gusto de muchos clientes como lugar costero"))

)

;en caso de que el usuario no haya respondido preguntas pero si sepa una zona
;a la que le gustaria viajar y alguno de los destinos es de interior entonces 
;el usuario querra interior con factor de 0.4
(defrule R2
    (Modulo Calculofactores)
    (destinosin sierranevada|londres|madrid|cordoba|marrakesh|jaca ?a)
    (FactorCerteza playa no ?f)
    (not (Evidencia localizacion_costa ?))
    (test (> ?f 0))
=>
    (assert (FactorCerteza ?a si (encadenado ?f 0.4)))
    (assert (Razon FactorCerteza ?a si (encadenado ?f 0.4) "porque es una de nuestras opciones del gusto de muchos clientes como lugar de interior"))

)

;si le gustan los lugares turisticos y tiene presupuesto alto entonces le recomiento lugares grandes y turisticos
(defrule R3
    (Modulo Calculofactores)
    (destinosin madrid|londres|barcelona|mallorca|marrakesh ?a)
    (FactorCerteza presupuesto_alto si ?f1)
    (FactorCerteza turistico si ?f2)

=>
    (assert (FactorCerteza ?a si  0.8))
    (assert (Razon FactorCerteza ?a si 0.8 "porque tiene presupuesto y le gustan los lugares turisticos"))
)

;si le gusta la playa y los lugares lluviosos entonces se recomendara lugares costeros y lluviosos

;regla 1: para cuando hemos deducido que le gusta la playa y no ha respondido
            ;si le gusta la costa
(defrule R4
    (Modulo Calculofactores)
    (destinosin santander|lacorunia ?a)
    (not (FactorCerteza localizacion_costa si ?f))
    (FactorCerteza playa si ?f1)
    (FactorCerteza tiempo_bueno no ?f2)

=>
    (assert (FactorCerteza ?a si  0.05))
    (assert (Razon FactorCerteza ?a si 0.05 "porque le gusta la playa y le gustan los lugares lluviosos"))
)

;regla 2: cuando ha respondido si le gusta la costa

(defrule R5
    (Modulo Calculofactores)
    (destinosin santander|lacorunia ?a)
    (FactorCerteza localizacion_costa si ?f1)
    (FactorCerteza tiempo_bueno no ?f2)

=>
    (assert (FactorCerteza ?a si  0.7))
    (assert (Razon FactorCerteza ?a si 0.7 "porque le gusta la costa y le gustan los lugares lluviosos"))
)

;si prefiere transporte en avion
(defrule R6
    (Modulo Calculofactores)
    (destinosin londres|mallorca|barcelona|santander|marrakesh ?a)
    (FactorCerteza transporte_avion si ?f)
 
=>
    (assert (FactorCerteza ?a si  0.65))
    (assert (Razon FactorCerteza ?a si 0.65 "porque prefiere transporte en avion"))
)

;si prefiere un lugar lluvioso
(defrule R7
    (Modulo Calculofactores)
    (destinosin sierranevada|londres|santander|lacorunia|jaca ?a)
    (FactorCerteza tiempo_bueno no ?f)
 
=>
    (assert (FactorCerteza ?a si  0.65))
    (assert (Razon FactorCerteza ?a si 0.65 "porque prefiere un lugar lluvioso"))
)

;Si el usuario prefiere un lugar montanioso
(defrule R8
    (Modulo Calculofactores)
    (destinosin sierranevada|santander|jaca ?a)
    (FactorCerteza localizacion_montania si ?f)
 
=>
    (assert (FactorCerteza ?a si  0.8))
    (assert (Razon FactorCerteza ?a si 0.8 "porque prefiere un lugar montanioso"))
)
;si el usuario prefiere otro tansporte que no sea avion
(defrule R9
    (Modulo Calculofactores)
    (destinosin sierranevada|santander|madrid|barcelona|almeria|marmenor|cordoba|lacorunia ?a)
    (FactorCerteza transporte_avion no ?f)
 
=>
    (assert (FactorCerteza ?a si  0.5))
    (assert (Razon FactorCerteza ?a si 0.5 "porque no le gusta viajar en avion"))
)

;si el usuario prefiere un lugar turistico
(defrule R10
    (Modulo Calculofactores)
    (destinosin santander|madrid|barcelona|cordoba|londres|mallorca|marrakesh ?a)
    (FactorCerteza turistico si ?f)
 
=>
    (assert (FactorCerteza ?a si  0.55))
    (assert (Razon FactorCerteza ?a si 0.55 "porque le gustan los lugares turisticos"))
)

;si el usuario no prefiere un lugar turistico
(defrule R11
    (Modulo Calculofactores)
    (destinosin almeria|marmenor|sierranevada|lacorunia|jaca ?a)
    (FactorCerteza turistico no ?f)
 
=>
    (assert (FactorCerteza ?a si  0.45))
    (assert (Razon FactorCerteza ?a si 0.45 "porque no le gustan los lugares turisticos"))
)

;si el usuario quiere tiempo bueno
(defrule R12
    (Modulo Calculofactores)
    (destinosin almeria|marmenor|cordoba|madrid|mallorca|marrakesh ?a)
    (FactorCerteza tiempo_bueno si ?f)
 
=>
    (assert (FactorCerteza ?a si  0.65))
    (assert (Razon FactorCerteza ?a si 0.65 "porque le gusta los lugares con tiempo bueno"))
)

;si el usuario quiere playa y tiempo bueno
(defrule R13
    (Modulo Calculofactores)
    (destinosin almeria|marmenor|barcelona|mallorca ?a)
    (FactorCerteza tiempo_bueno si ?f)
    (FactorCerteza localizacion_costa si ?f1)
 
=>
    (assert (FactorCerteza ?a si  0.6))
    (assert (Razon FactorCerteza ?a si 0.6 "porque le gusta los lugares con buen pronostico del tiempo y localizacios en la costa"))
)

;si el usuario no quiere playa
(defrule R14
    (Modulo Calculofactores)
    (destinosin sierranevada|londres|madrid|cordoba|marrakesh|jaca  ?a)
    (FactorCerteza localizacion_costa no ?f)
 
=>
    (assert (FactorCerteza ?a si  0.5))
    (assert (Razon FactorCerteza ?a si 0.5 "porque no quiere lugares costeros"))
)



;dejamos solo la regla que más certeza tenga
(defrule hipotesis_mayor_certeza
     ;Metemos la prioridad negativa para que se haga al final
    (declare (salience -5))
    (FactorCerteza ?h1 ?resp1 ?f1)
    ?f <- (FactorCerteza ?h2 ?resp2 ?f2)
    (test(and (> ?f1 ?f2) (< ?f1 1)))
    =>
    (printout t "Borramos el destino " ?h2 " porque tiene menor certeza (" ?f2 ")" crlf)
    (retract ?f)
)

;con esto vamos a mostrar lo que hemos deducido por pantalla
(defrule deducciones_por_pantalla
 ;Metemos la prioridad negativa para que se haga al final
    (declare (salience -10))
    (Modulo Calculofactores)
    ?g <- (Razon FactorCerteza ?h ?r ?f1 ?expl)    
    ?f <- (FactorCerteza ?h ?r ?f1)
    =>
    (printout t "El destino adecuado para usted es " ?h " con certeza " ?f1 " " ?expl crlf)
    (retract ?f ?g)
)