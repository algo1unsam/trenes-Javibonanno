class Deposito {

	var formaciones = []

	method agregarFormacion(unaFormacion) {
		formaciones.add(unaFormacion)
	}

}

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
		return self.sumatoriaDeArrastre() > self.sumatoriaDePesoMaximo()
	}

	method sumatoriaDeArrastre() {
		return locomotoras.sum{ unaLocomotora => unaLocomotora.arrastreUtil() }
	}

	method sumatoriaDePesoMaximo() {
		return vagones.sum{ unVagone => unVagone.pesoMaximo() }
	}

	method cuantosKilosDeArrastreLeFalta() {
		return self.sumatoriaDePesoMaximo() - self.sumatoriaDeArrastre()
	}

}

class Vagon {

	var property tipoDeVagon = null

	method pesoMaximo() {
		return tipoDeVagon.pesoMaximo()
	}

}

object pasajero {

	var property ancho = 0
	var property largo = 0

	method cantidadDePasajeros() {
		if (ancho <= 2.5) {
			return largo * 8
		} else return largo * 10
	}

	method pesoMaximo() {
		return self.cantidadDePasajeros() * 80
	}

}

object carga {

	var property cargaMaxima = 0

	method pesoMaximo() {
		return cargaMaxima + 160
	}

}

class Locomotora {

	var property peso = 100
	var property capacidadMaximaDeArrastre = 0
	var property velocidadMaxima = 0

	method arrastreUtil() {
		return capacidadMaximaDeArrastre - peso
	}

}

