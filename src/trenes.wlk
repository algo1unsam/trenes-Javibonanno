class Deposito {

	var formaciones = []

	method agregarFormacion(unaFormacion) {
		formaciones.add(unaFormacion)
	}

}

class Formacion {

	var property locomotora = []
	var property vagon = []

	method agregarLocomotora(unaLocomotora) {
		locomotora.add(unaLocomotora)
	}

	method agregarFormacion(unVagon) {
		vagon.add(unVagon)
	}

	method cantidadVagonesLivianos() {
		return vagon.count({ unVagon => unVagon.pesoMaximo() < 2500 })
	}

	method velocidadMaxima() {
		return locomotora.min({ unaLocomotora => unaLocomotora.velocidadMaxima() })
	}

}

class Vagon {

	var property tipoDeVagon = pasajero

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

	var property peso = 0
	const property pesoMaximo = 0
	const property velocidadMaxima = 0

}

