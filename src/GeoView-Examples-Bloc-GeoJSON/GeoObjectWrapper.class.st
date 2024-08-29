Class {
	#name : 'GeoObjectWrapper',
	#superclass : 'Object',
	#instVars : [
		'key',
		'object'
	],
	#category : 'GeoView-Examples-Bloc-GeoJSON',
	#package : 'GeoView-Examples-Bloc-GeoJSON'
}

{ #category : 'constructor' }
GeoObjectWrapper class >> wrap: anObject [ 

	^ self new object: anObject 
]

{ #category : 'accessing' }
GeoObjectWrapper >> key [

	^ key
]

{ #category : 'accessing' }
GeoObjectWrapper >> key: anObject [

	key := anObject
]

{ #category : 'accessing' }
GeoObjectWrapper >> object [

	^ object
]

{ #category : 'accessing' }
GeoObjectWrapper >> object: anObject [

	object := anObject
]
