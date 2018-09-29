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

	var property cargaMaxima = 100

	method pesoMaximo() {
		return cargaMaxima + 160
	}

}

