Class {
	#name : #ViewAdminUsers,
	#superclass : #ViewAdminTable,
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
ViewAdminUsers class >> new: aSeqCol [
	^self new initialize: aSeqCol; yourself.
]

{ #category : #button }
ViewAdminUsers >> agregar [ 
	parent stack: (ViewSignUp new model: parent model).
]

{ #category : #initialization }
ViewAdminUsers >> initialize: aModel [
	self initialize.
	^self	addColumn: 'DNI'; 
			addColumn: 'Apellido'; 
			addColumn: 'Nombre';
			model: aModel;
			yourself.
]
