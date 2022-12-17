Class {
	#name : #ViewAdmin,
	#superclass : #View,
	#instVars : [
		'tabs'
	],
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
ViewAdmin class >> new: sistema [
	^self new initialize: sistema. 
]

{ #category : #initialization }
ViewAdmin >> initialize: sistema [
	self	initialize
			addMorph: (tabs := Tabs new).	
	tabs addPage: (ViewAdminUsers new: sistema usuarios) label: 'Usuarios'.
	tabs addPage: (ViewAdminBibliotecas new: sistema bibliotecas) label: 'Bibliotecas'.	
	tabs selectedPageIndex: 1.
	^self.

]
