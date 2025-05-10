object dominic {
 const autos  = []
    method comprar(unAuto)  {autos.add(unAuto) }
    method autosQueNoPuedenCorrer() = autos.filter({a=>not a.estaEnCondiciones()})
    method mandarAutosAlTaller() {
        taller.recibirAutos(self.autosQueNoPuedenCorrer())
    }
    method autosEnCondiciones() = autos.filter({a=>a.estaEnCondiciones()})
    method venderTodos() {autos.clear()}
    method hacerPrueba() {
        autos.forEach({a=>a.pruebaVelocidad()})
    }
    method promedioVelocidad() {
       return autos.sum({a=>a.velocidad()}) / autos.size()
    }
    method elMasRapidoEnCondiciones() = self.autosEnCondiciones().max({a=>a.velocidad()})
    method esMasDelDoble() = self.elMasRapidoEnCondiciones().velocidad() > self.promedioVelocidad() * 2

}
object taller {
  const enReparacion = []
  method recibirAutos(autos) {
    enReparacion.addAll(autos)
  }
  method repararAutos() {
    enReparacion.forEach({a=>a.reparar()})
    enReparacion.clear()
  }
}
object ferrari {
  var motor = 87
  method estaEnCondiciones() = motor >= 65
  method reparar() {motor = 100}
  method velocidad() = 110 + if(motor>75) 15 else 0
  method pruebaVelocidad() {motor= 0.max(motor -30)}  
}
object flechaRubi {
 var nivelCombustible = 100
 var combustibleUtilizado = gasolina
 var color = azul
 method combustibleUtilizado() = combustibleUtilizado
 method nivelCombustible() = nivelCombustible
 method combustible(nivel) {nivelCombustible = nivel}
 method estaEnCondiciones() =  color == rojo and nivelCombustible > combustibleUtilizado.nivelMinimo()
 
 method pruebaVelocidad() {nivelCombustible = (nivelCombustible -5).max(0)}
 method reparacion() {
    nivelCombustible = nivelCombustible * 2
    color.cambiarColor()
 }
 method velocidad() = (nivelCombustible * 2 ) + combustibleUtilizado.condicion(nivelCombustible)
}
object azul {
     method cambiarColor() = verde
  
}
object rojo {
  method cambiarColor() = azul
  
}
object verde {
  method cambiarColor() = rojo
}
object gasolina {
    method nivelMinimo() = 85
    method condicion(litros) = 10
}
object nafta {
  method nivelMinimo() = 50
  method condicion(litros) = -1 * (litros*2) * 0.10
}
object nitrogeno {
  method nivelMinimo() = 0
  method condicion(litros) = litros * 2 * 10
}