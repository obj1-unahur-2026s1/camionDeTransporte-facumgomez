import cosas2.*


object camion {
  const cosasCargadas = []

  method cargarCosa(cosa) {
    cosasCargadas.add(cosa)
    cosa.consecuanciaDeLaCarga()
  }

  method descargarCosa(cosa) { cosasCargadas.remove(cosa) }

  method cargarCosas(listaDeCosas) { listaDeCosas.forEach({c => self.cargarCosa(c)}) }

  method peso() = 1000 + cosasCargadas.sum({c => c.peso()})

  method todosLosPesosSonPares() = cosasCargadas.all({c => c.peso().even()})

  method hayAlgunaCargaQuePesa(peso) = cosasCargadas.any({c => c.peso() == peso})

  method primeraCosaCargada(peligrosidad) = cosasCargadas.findOrDefault({c => c.nivelDePeligrosidad() == peligrosidad }, "No hay cosa") 

  method cosasQueSuperarPeligrosdiad(peligrosidad) = cosasCargadas.filter({c => c.nivelDePeligrosidad() > peligrosidad})
  
  method cosasQueSuperanDePeligrosidadDe(cosa) = self.cosasQueSuperarPeligrosdiad(cosa.nivelDePeligrosidad())

  method estaExcedidoDePeso() = self.peso() > 2500

  method puedeCircularEnRuta(nivelMax) = !self.estaExcedidoDePeso() and self.cosasQueSuperarPeligrosdiad(nivelMax).isEmpty()

  method algunaCargaPesaEntre(min, max) = cosasCargadas.any({c => c.peso().between(min, max)}) 

  method cargaMasPesada() = cosasCargadas.max({c => c.peso()})

  method cantidadTotalDeBultos() = cosasCargadas.sum({c => c.bultos()}) 
}