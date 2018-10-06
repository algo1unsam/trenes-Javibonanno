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
		return locomotoras.min{ unaLocomotora => unaLocomotora.velocidadMaxima() }.velocidadMaxima()
	}

	method cantidadVagonesLivianos() {
		return vagones.count({ unVagon => unVagon.pesoMaximo() < 2500 })
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

}

class FormacionesLargaDistancia inherits Formacion {

	method estaBienArmada() {
		return self.esCompleja() and self.cantidadDeBanios()
	}

	method cantidadDeBanios() {
		return vagones.sum{ unVagon => unVagon.cantidadBanios() }
	}

}

class FormacionesCortaDistancia inherits Formacion {

	method estaBienArmada() {
		return self.puedeMoverse() and not self.esCompleja()
	}

}

