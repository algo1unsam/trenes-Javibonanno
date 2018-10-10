import vagones.*
import locomotoras.*
import depositos.*

class Formacion {

	var property locomotoras = []
	var property vagones = []

	method agregarLocomotora(unaLocomotora) {
		locomotoras.add(unaLocomotora)
	}

	method agregarVagon(unVagon) {
		vagones.add(unVagon)
	}

	method velocidadMaxima() {
		return self.velocidadMaximaLocomotora().min(self.velocidadMaximaLegal())
	}

	method velocidadMaximaLocomotora() {
		return locomotoras.min{ unaLocomotora => unaLocomotora.velocidadMaxima() }.velocidadMaxima()
	}

	method velocidadMaximaLegal()

	method cantidadVagonesLivianos() {
		return vagones.count({ unVagon => self.esLiviano(unVagon) })
	}

	method esLiviano(unVagon){
		return unVagon.pesoMaximo() < 2500 
	}
	

	method esEficiente() {
		return locomotoras.all{ unaLocomotora => unaLocomotora.arrastreUtil() >= unaLocomotora.peso() * 5 }
	}

	method puedeMoverse() {
		return self.sumatoriaDeArrastre() > self.sumatoriaDePesoMaximoDeVagones()
	}

	method sumatoriaDeArrastre() {
		return locomotoras.sum{ unaLocomotora => unaLocomotora.arrastreUtil() }
	}

	method sumatoriaDePesoMaximoDeVagones() {
		return vagones.sum{ unVagon => unVagon.pesoMaximo() }
	}

	method sumatoriaDePesoMaximoDeLocomotoras() {
		return locomotoras.sum{ unaLocomotora => unaLocomotora.peso() }
	}

	method cuantosKilosDeArrastreLeFalta() {
		return self.sumatoriaDePesoMaximoDeVagones() - self.sumatoriaDeArrastre()
	}

	method vagonMasPesadoDeUnaFormacion() {
		return vagones.max{ unVagon => unVagon.pesoMaximo() }
	}

	method esCompleja() {
		return (locomotoras.size() + vagones.size()) > 20 or (self.sumatoriaDePesoMaximoDeLocomotoras() + self.sumatoriaDePesoMaximoDeVagones()) > 10000
	}

	method totalDePasajeros() {
		return vagones.sum{ unVagon => unVagon.cantidadDePasajeros() }
	}

}

class FormacionLargaDistancia inherits Formacion {

	const property origen = null
	const property destino = null

	method estaBienArmada() {
		return self.puedeMoverse() and self.tieneSuficientesBanios()
	}

	method cantidadDeBanios() {
		return vagones.sum{ unVagon => unVagon.cantidadBanios() }
	}

	method tieneSuficientesBanios() {
		return self.cantidadDeBanios() >= self.totalDePasajeros() / 50
	}

	override method velocidadMaximaLegal() {
		return if (origen.esGrande() and destino.esGrande()) 200 else 150
	}

}

class FormacionCortaDistancia inherits Formacion {

	method estaBienArmada() {
		return self.puedeMoverse() and not self.esCompleja()
	}

	override method velocidadMaximaLegal() = 60

}

class Ciudad {

	var property esGrande = true

}

class FormacionAltaVelocidad inherits FormacionLargaDistancia {

	override method estaBienArmada() {
		return self.velocidadMaxima() >= 250 and vagones.all{ unVagon =>self.esLiviano(unVagon) }
	}

	override method velocidadMaximaLegal() = 400

}

