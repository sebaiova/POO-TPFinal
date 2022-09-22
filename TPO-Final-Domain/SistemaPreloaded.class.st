Class {
	#name : #SistemaPreloaded,
	#superclass : #Sistema,
	#category : #'TPO-Final-Domain'
}

{ #category : #initialization }
SistemaPreloaded >> initialize [ 
	super initialize.
	^self agregarUsuario: 39062823 nombre: 'Sebastian' apellido: 'Iovaldi' password: 1234; 
			agregarUsuario: 39062823 nombre: 'Sebastian' apellido: 'Iovaldi' password: 1234;
			agregarBiblioteca: 01 nombre: 'JM de Rosas'  direccion: 'Pellegrini 1200'  telefono: 45228338  representante: 'Yo'
	yourself.
]
