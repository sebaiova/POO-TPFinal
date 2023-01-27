Class {
	#name : #SIInterface,
	#superclass : #Object,
	#instVars : [
		'sistema',
		'lib',
		'user',
		'loan',
		'modelIndex'
	],
	#category : #'SI-Models'
}

{ #category : #'instance creation' }
SIInterface class >> new [ 
	self error: 'No usar new'.
]

{ #category : #'instance creation' }
SIInterface class >> sistema: unSistema [ 
	^super new initializeSistema: unSistema.
]

{ #category : #initialization }
SIInterface >> initializeSistema: unSistema [ 
	self initialize.
	sistema := unSistema.
	^self. 
]

{ #category : #accessing }
SIInterface >> lib [
	^lib.
]

{ #category : #accessing }
SIInterface >> lib: unaBiblioteca [
	lib := unaBiblioteca .
]

{ #category : #accessing }
SIInterface >> loan [ 
	^loan.
]

{ #category : #accessing }
SIInterface >> loan: unPrestamo [ 
	loan := unPrestamo .
]

{ #category : #accessing }
SIInterface >> modelIndex [
	^modelIndex.
]

{ #category : #accessing }
SIInterface >> modelIndex: aModelIndex [
	modelIndex := aModelIndex .
]

{ #category : #accessing }
SIInterface >> sys [ 
	^sistema.
]

{ #category : #accessing }
SIInterface >> user [ 
	^user.
]

{ #category : #accessing }
SIInterface >> user: unUsuario [
 user := unUsuario.
]
