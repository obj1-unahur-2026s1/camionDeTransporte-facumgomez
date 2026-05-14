
object knightRider {
  method bultos() = 1 
  method peso() = 500
  method nivelDePeligrosidad() = 10
  method consecuenciaDeLaCarga() {}
}

object bumblebee {
  var formaActual = auto

  method bultos() = 2

  method peso() = 800

  method nivelDePeligrosidad() = formaActual.nivel()

  method cambiarForma(forma) { formaActual = forma } 

  method consecuenciaDeLaCarga() { self.cambiarForma(robot) }
}

object paqueteDeLadrillos {
  var cantidadDeLadrillos = 10
  
    method bultos() {
    if(cantidadDeLadrillos <=100){
      return 1
    } else if(cantidadDeLadrillos.between(101, 300)){
      return 2
    } else {return 3}
  }

  method peso() = 2 * cantidadDeLadrillos
  method nivelDePeligrosidad() = 2
  method cambiarCantidad(cantidad) { cantidadDeLadrillos = cantidad } 
  method consecuenciaDeLaCarga() { cantidadDeLadrillos += 12 }
}

object arena {
  var property peso = 10

  method bultos() = 1 

  method nivelDePeligrosidad() = 1
  method consecuenciaDeLaCarga() { peso - (peso - 10).max(0) }
}

object bateria {
  var estaConMisiles = false

  method bultos() = if(estaConMisiles) 2 else 1

  method peso() = if (estaConMisiles) 300 else 0 

  method nivelDePeligrosidad() = 1

  method cargarYDescargarMisiles() { estaConMisiles = !estaConMisiles } 
  method consecuenciaDeLaCarga() { estaConMisiles = true }
}

object contenedor {
  const cosasContenidas = []

  method bultos() = 1 + self.bultosDeCosasContenidas()
  method bultosDeCosasContenidas() = cosasContenidas.sum({c => c.bultos()}) 

  method peso() = 100 + self.pesoDeCosasContenidas()

  method pesoDeCosasContenidas() = cosasContenidas.sum({c => c.peso()})

  method nivelDePeligrosidad() = if (!cosasContenidas.isEmpty()) self.nivelDePeligrosidad() else 0

  method cosasContenidasMasPeligrosidad() = cosasContenidas.max({c => c.nivelDePeligrosidad()})

  method meterElementos(listaDeElementos) {cosasContenidas.addAll(listaDeElementos)}

  method consecuenciaDeLaCarga() { cosasContenidas.forEach({c => c.consecuenciaDeLaCarga()}) }
}

object residuos {
  var property peso = 10 

  method bultos() = 1

  method nivelDePeligrosidad() = 200

  method consecuenciaDeLaCarga() {peso += 15}
}

object embalaje {
  var cosasQueEnvuelve = residuos
  method bultos() = 2

  method peso() = cosasQueEnvuelve.peso()
  method nivelDePeligrosidad() = cosasQueEnvuelve.nivelDePeligrosidad() * 0.5
  method cambiarLoQueEnvuelve(nuevaCosa) { cosasQueEnvuelve = nuevaCosa } 
  method consecuenciaDeLaCarga() {}
}


object auto {method nivel() = 15}
object robot {method nivel() = 30}