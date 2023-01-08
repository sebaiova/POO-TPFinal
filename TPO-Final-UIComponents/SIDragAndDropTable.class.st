Class {
	#name : #SIDragAndDropTable,
	#superclass : #SITable,
	#category : #'TPO-Final-UIComponents'
}

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
