Class {
	#name : #SIViewDetalleUsuario,
	#superclass : #View,
	#category : #'TPO-Final-Views'
}

{ #category : #'instance creation' }
SIViewDetalleUsuario class >> modelIndex: aModelIndex [
	^super new initializeModelIndex: aModelIndex. 
]

{ #category : #'instance creation' }
SIViewDetalleUsuario class >> new [ 
	self error: 'Usar modelIndex: en lugar de new'.
]

{ #category : #initialization }
SIViewDetalleUsuario >> initializeModelIndex: aModelIndex [
	self initialize;
		addMorph: (SIColumn new 
			
			addMorph: (SIRow new 
				addMorph: (SIButton label: 'Atras' target: self message: #delete);
				addMorph: SISpacer new;
				yourself
				)).
	
]
