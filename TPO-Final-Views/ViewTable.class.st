Class {
	#name : #ViewTable,
	#superclass : #View,
	#category : #'TPO-Final-Views'
}

{ #category : #initialization }
ViewTable >> initialize [
	super initialize.
	^self	
			addMorph: (Row new 
							addMorph: (Button new: 'Agregar' target: self message: #iniciarSesion);
							addMorph: (Button new: 'Eliminar' target: self message: #crearUsuario);
							addMorph: (Button new: 'Editar' target: self message: #admin);
							addMorph: Spacer new;
							addMorph: (Button new: 'Atras' target: self message: #close);
							yourself);
			addMorph: (Spacer new addMorph: (FTTableMorph new
							vResizing: #spaceFill;
							hResizing: #spaceFill));
			"addMorph: Spacer new;"
			yourself.
]
