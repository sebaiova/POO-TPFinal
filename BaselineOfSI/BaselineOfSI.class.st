Class {
	#name : #BaselineOfSI,
	#superclass : #BaselineOf,
	#category : #BaselineOfSI
}

{ #category : #baselines }
BaselineOfSI >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"The main code of the baseline will go here"
			spec 
				package: 'SI-Domain';
				package: 'SI-Models';
				package: 'SI-Views';
				package: 'SI-UIComponents'
		]
]

{ #category : #accessing }
BaselineOfSI >> projectClass [
	^ MetacelloCypressBaselineProject
]
