Class {
	#name : #SistemaPreloaded,
	#superclass : #Sistema,
	#category : #'TPO-Final-Domain'
}

{ #category : #initialization }
SistemaPreloaded >> initialize [ 
	super initialize.
	^self agregarUsuario: 39062823 nombre: 'Sebastian' apellido: 'Iovaldi' password: 1234;
			agregarUsuario: 43484212 nombre: 'Leonard' apellido: 'Fernandez' password: 1234;
			agregarUsuario: 44216402 nombre: 'Medel' apellido: 'Joaquin' password: 1234;
			agregarUsuario: 43275843 nombre: 'Leonel' apellido: 'Llancaqueo' password: 1234;
			agregarUsuario: 44287842 nombre: 'Cristopher' apellido: 'Ovaillos' password: 1234;
			
			agregarBiblioteca: ((Biblioteca newID: 01 nombre: 'Juan Bautista Alberdi'  telefono: 45228338 direccion: 'Av. Argentina 844' representante: 'Bernardino Teruel')
				agregarLibro: (Libro newNombre: 'OpenGL SuperBible' editorial: 'Addison-Wesley Professional' año: 2013 autores: {
					(Autor new: 'Graham Sellers'),
					(Autor new: 'Richard S. Wright, Jr.'),
					(Autor new: 'Nicholas Haemel')}));
			
			agregarBiblioteca: 02 nombre: 'Francisco P. Moreno'  direccion: 'Av. Leloir y Sta Fe'  telefono: 45132458  representante: 'Yeray Salazar';
			agregarBiblioteca: 03 nombre: 'Juan Jose Brion'  direccion: 'Av. Leloir 842'  telefono: 42658752  representante: 'Guillermina Llorens';
	yourself.
]
