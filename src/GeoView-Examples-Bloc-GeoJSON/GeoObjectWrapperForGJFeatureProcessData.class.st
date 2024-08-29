Class {
	#name : 'GeoObjectWrapperForGJFeatureProcessData',
	#superclass : 'SmockProcessData',
	#category : 'GeoView-Examples-Bloc-GeoJSON',
	#package : 'GeoView-Examples-Bloc-GeoJSON'
}

{ #category : 'processing' }
GeoObjectWrapperForGJFeatureProcessData >> processCreatedData: aKey incoming: aWrapper with: aDShape context: aContext [

	"choosing the good dShape to create depending feature geometry"
	| geometry dShape dText aGJFeature |
	aGJFeature := aWrapper object.
	dShape := aDShape ifNil:[ SmockDCompositeShape new ].
	dShape key: aWrapper key.

	"create label"
	dText := SmockDText new.
	dText text: (aWrapper key asString).
	dShape addChild: dText.

	"create geometry"
	geometry := aGJFeature geometry.
	(geometry isKindOf: GJPolygon) ifTrue:[ | coordinates dPolygone |
		dPolygone := SmockDPolygon new.
		dPolygone key: aWrapper key.
		dPolygone strokeColor: Color random.
		coordinates := geometry coordinates first collect:[ :array | ((array at: 2) @ (array at: 1)) asAbsoluteCoordinates ].
		coordinates := coordinates collect: [ :e | self processor projection projLatLonToCart: e ].
		dPolygone points: coordinates.
		dShape addChild: dPolygone.
		dText coordinates: (dPolygone points first).
		dShape := dPolygone.
	].

	^ dShape
]

{ #category : 'processing' }
GeoObjectWrapperForGJFeatureProcessData >> processDeletedData: aKey incoming: aWrapper with: aDShape context: aContext [

	^ aDShape
]

{ #category : 'processing' }
GeoObjectWrapperForGJFeatureProcessData >> processUpdatedData: aKey incoming: aWrapper with: aDShape context: aContext [

	^ aDShape
]
