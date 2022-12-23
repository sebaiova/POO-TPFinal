Class {
	#name : #ViewAdminUsers,
	#superclass : #ViewTable,
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
	table addColumn: 'DNI'. 
	table addColumn: 'Apellido'. 
	table addColumn: 'Nombre'.
	table model: aModel.
	^self.
]
