Class {
	#name : #ViewTable,
	#superclass : #View,
	#instVars : [
		'ft_table',
		'ft_model'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #adding }
ViewTable >> addColumn: headerName [
	^ft_table addColumn: (FTColumn id: headerName).
]

{ #category : #accessing }
ViewTable >> data: data [
	ft_table elements: data.
]

{ #category : #button }
ViewTable >> eliminar [
	ft_table hasSelection ifFalse: [ ^ self ].
	ft_model removeAt: ft_table selectedIndex.
	ft_table deselectAll
]

{ #category : #initialization }
ViewTable >> initialize [
		super initialize.
		^self	
			addMorph: (Row new addMorph: (Button new: 'Agregar' target: self message: #iniciarSesion);
									addMorph: (Button new: 'Eliminar' target: self message: #eliminar);
									addMorph: (Button new: 'Editar' target: self message: #admin);
									addMorph: Spacer new;
									addMorph: (Button new: 'Atras' target: self message: #close);
									yourself);
			addMorph: (Spacer new addMorph: (ft_table := FTTableMorph new vResizing: #spaceFill; hResizing: #spaceFill));
			yourself.
]

{ #category : #accessing }
ViewTable >> model: aModel [
	ft_model := aModel.
	ft_table dataSource: ft_model.
	ft_model addDependent: ft_table.
]
