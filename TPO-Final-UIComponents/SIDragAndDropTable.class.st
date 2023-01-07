Class {
	#name : #SIDragAndDropTable,
	#superclass : #SITable,
	#category : #'TPO-Final-UIComponents'
}

{ #category : #initialization }
SIDragAndDropTable >> initializeModel: aModelDragAndDrop headers: colHeaders [
	super initializeModel: aModelDragAndDrop headers: colHeaders.
	
	table dragEnabled: true;
			dropEnabled: true.

]
