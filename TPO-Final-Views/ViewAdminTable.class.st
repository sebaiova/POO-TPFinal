Class {
	#name : #ViewAdminTable,
	#superclass : #View,
	#instVars : [
		'ft_table',
		'ft_model',
		'parent'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #adding }
ViewAdminTable >> addColumn: headerName [
	^ft_table addColumn: (FTColumn id: headerName).
]

{ #category : #button }
ViewAdminTable >> agregar [
	^nil.
]

{ #category : #'initialize-release' }
ViewAdminTable >> close [ 
	parent delete.
]

{ #category : #accessing }
ViewAdminTable >> data: data [
	ft_table elements: data.
]

{ #category : #button }
ViewAdminTable >> eliminar [
	ft_table hasSelection ifFalse: [ ^ self ].
	ft_model removeAt: ft_table selectedIndex.
	ft_table deselectAll
]

{ #category : #initialization }
ViewAdminTable >> initialize [
	 ^super initialize	
			addMorph: (Row new addMorph: (Button new: 'Agregar' target: self message: #agregar);
									addMorph: (Button new: 'Eliminar' target: self message: #eliminar);
									addMorph: (Button new: 'Editar' target: self message: #admin);
									addMorph: Spacer new;
									addMorph: (Button new: 'Atras' target: self message: #close);
									yourself);
			addMorph: (Spacer new addMorph: (ft_table := FTTableMorph new vResizing: #spaceFill; hResizing: #spaceFill));
			yourself.
]

{ #category : #accessing }
ViewAdminTable >> model: aModel [
	ft_model := aModel.
	ft_table dataSource: ft_model.
	ft_model addDependent: ft_table.
]

{ #category : #accessing }
ViewAdminTable >> parent: aParent [
	parent := aParent.
]
