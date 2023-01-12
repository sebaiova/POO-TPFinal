Class {
	#name : #SIViewAgregarBiblioteca,
	#superclass : #SIView,
	#instVars : [
		'tfNombre',
		'tfDireccion',
		'tfTelefono',
		'tfRepresentante',
		'tfID',
		'tag'
	],
	#category : #'SI-Views'
}

{ #category : #button }
SIViewAgregarBiblioteca >> actionAgregar [
	(tfID text isEmpty) ifTrue: [ tag bad: 'Ingrese una ID'. tfID rejected ]
							ifFalse: [  
									(iface model agregar: (SIBiblioteca id: tfID text nombre: tfNombre text telefono: tfTelefono text direccion: tfDireccion text representante: tfRepresentante text))
									ifNil: 	  [ tag bad: 'ID ya existente'. tfID rejected  ]  
									ifNotNil:  [	self delete ]].
]

{ #category : #initialization }
SIViewAgregarBiblioteca >> initializeInterface: aSIInterface [
	super initializeInterface: aSIInterface .
	^self addMorph: (SIColumn new 
				addMorph: SISpacer new;
				addMorph: (tag := SITag new);
				addMorph: (tfID := SITextFieldTagged tag: 'ID');
				addMorph: (tfNombre := SITextFieldTagged tag: 'Nombre');
				addMorph: (tfDireccion := SITextFieldTagged tag: 'Dirección');
				addMorph: (tfTelefono := SITextFieldTagged tag: 'Teléfono');
				addMorph: (tfRepresentante := SITextFieldTagged tag: 'Representante');		
				addMorph: SISpacer new;			
				addMorph: (SIRow new
					addMorph: (SIButton label: 'Atras' target: self message: #delete);
					addMorph: SISpacer new;
					addMorph: (SIButton label: 'Agregar' target: self message: #actionAgregar);
					yourself
				));
			yourself
]
