import formaciones.*
import vagones.*
import locomotoras.*

class Deposito {

	var formaciones = []
	var formacion1 = new Formacion()

	method agregarFormacion(unaFormacion) {
		formaciones.add(unaFormacion)
	}

	method necesitoConductorExperimentado() {
		return formaciones.any{ unaFormacion => unaFormacion.esCompleja() }
	}

	method agregarLocomotoraSiNoPuedeMoverse(unaLocomotora) {
		if (!formacion1.puedeMoverse() && (unaLocomotora.arrastreUtil() > formacion1.cuantosKilosDeArrastreLeFalta())) {
			formacion1.add(unaLocomotora)
		} else {
			error.throwWithMessage("No se necesita agregar una locomotora")
		}
	}

	method necesitoAgregarOtraLomotora() {
		return formacion1.puedeMoverse()
	}

}

