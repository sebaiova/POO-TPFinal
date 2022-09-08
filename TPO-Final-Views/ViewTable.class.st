Class {
	#name : #ViewTable,
	#superclass : #View,
	#instVars : [
		'ft_table'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
ViewTable class >> new: data [
	^self new initialize: data.
]

{ #category : #accessing }
ViewTable >> data: data [
	ft_table elements: data.
]

{ #category : #initialization }
ViewTable >> initialize: data [
	^self	
			initialize
			addMorph: (Row new 
							addMorph: (Button new: 'Agregar' target: self message: #iniciarSesion);
							addMorph: (Button new: 'Eliminar' target: self message: #crearUsuario);
							addMorph: (Button new: 'Editar' target: self message: #admin);
							addMorph: Spacer new;
							addMorph: (Button new: 'Atras' target: self message: #close);
							yourself);
			addMorph: (Spacer new addMorph: (ft_table := FTEasyListMorph new
																			vResizing: #spaceFill;
																			hResizing: #spaceFill));
			data: data;
			yourself.
]
