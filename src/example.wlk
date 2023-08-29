object casa{
	
	var reparaciones = 0//mal=0 bien=1
	var reparacionesDinero = 100
	var orden = 0//no=0 si=1
	var viveres = 50
	var calidad = 5////commit
	var parametro = 0
	
	method setViveres(cantidad){
		
		viveres = cantidad
		self.hayOrden()
		
	}
	
	method hayOrden(){
		
		if (reparaciones==0 or viveres<=40){
			
			orden=0
			
		}else{
			
			orden=1
			
		}
		
	}
	
	method setReparaciones(dinero){
		
		reparacionesDinero += dinero
		reparaciones = 0
		self.hayOrden()
		
	}
	
	method reparar(cuenta){
		
	
		self.Extraer(cuenta,reparacionesDinero)
		reparaciones = 1
		self.hayOrden()
		
	}
	
	method Depositar(cuenta,dinero){
		
		cuenta.depositar(dinero)
		
		
	}
	
	method Extraer(cuenta,dinero){
		
		cuenta.extraer(dinero)
		
	}

	method minimo(cuenta){
		
		if (viveres <= 40){
			
			parametro = (40 - viveres)*calidad
			cuenta.extraer(parametro)
			viveres = 40
			//return "Si Juancho, Mas bien"
			
		}else{
			
			//return "No juancito"
			
		}
		self.hayOrden()
		
	}
	
	method full(cuenta){
		
		if (orden==1){
			
			parametro = (100 - viveres)*calidad
			cuenta.extraer(parametro)
			viveres = 100
			//return "Si Juancho, Mas bien"
			
		}else{
			
			parametro = 40*calidad
			cuenta.extraer(parametro)
			viveres += 40
			//return "Casi Juancito"
			
		}
		self.hayOrden()
		
		if (cuenta.get()>1000){
			
			
			parametro = (100 - viveres)*calidad
			cuenta.extraer(parametro)
			viveres = 100
			
			
		}
		self.hayOrden()

		
	}
}


object cuentaCorriente {

	var saldo = 1000
	
	method depositar(dinero) {
		
		saldo += dinero
		
	}
	
	method extraer(dinero) {
		
		saldo -= dinero
		
	}	
	
	method get(){
		
		return saldo
		
	}
	
}
///////////////////////////
object cuentaGastos {
	
	var saldo=1000
	var costo=0.02
	
	method depositar(dinero){
		
		saldo+= dinero - dinero * costo
		
	}
	
	method extraer(dinero){
		
		saldo-= dinero
		
	}
	
	method get(){
		
		return saldo
		
	}
	
}
/////////////////////////////////////////
object cuentaCombinada{
	
	var saldoCuenta1 = 0
	var saldoCuenta2 = 500	
	var saldo = saldoCuenta1 + saldoCuenta2
	
	method extraer(dinero){
		
		if (saldoCuenta1 >= dinero + 50){
			
			saldoCuenta1 -= (dinero +50)
			saldo = saldoCuenta1 + saldoCuenta2
			
		}else{
			
			saldoCuenta2 -= dinero
			saldo = saldoCuenta1 + saldoCuenta2
			
		}
		
	}
	
	method depositar(dinero){
		
		saldoCuenta1 += (dinero-50)
		saldo = saldoCuenta1 + saldoCuenta2
		
	} 
	
	method get(){
		
		return saldo
		
	}
	
}


