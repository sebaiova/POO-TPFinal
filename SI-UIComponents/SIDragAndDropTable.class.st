Class {
	#name : #SIDragAndDropTable,
	#superclass : #SITable,
	#category : #'SI-UIComponents'
}

{ #category : #adding }
SIDragAndDropTable >> addAll: anCollection [ 
	model addAll: anCollection.
	
]

{ #category : #protocol }
SIDragAndDropTable >> disable [ 
	table dragEnabled: false;
			dropEnabled: false.
]

{ #category : #accessing }
SIDragAndDropTable >> elements [ 
	^model elements.
]

{ #category : #protocol }
SIDragAndDropTable >> enable [ 
	table dragEnabled: true;
			dropEnabled: true.
]

{ #category : #initialization }
SIDragAndDropTable >> initializeModel: aModelDragAndDrop headers: colHeaders [
	super initializeModel: aModelDragAndDrop headers: colHeaders.
	
	^self enable; yourself.


]
