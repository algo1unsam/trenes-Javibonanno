class VagonPasajero {

	var property ancho = 0
	var property largo = 0
	const property cantidadBanios = 1

	method cantidadDePasajeros() {
		if (ancho <= 2.5) {
			return largo * 8
		} else return largo * 10
	}

	method pesoMaximo() {
		return self.cantidadDePasajeros() * 80
	}

}

class VagonCarga {

	var property cargaMaxima = 100

	method pesoMaximo() {
		return cargaMaxima + 160
	}

	method cantidadBanios() = 0

}

