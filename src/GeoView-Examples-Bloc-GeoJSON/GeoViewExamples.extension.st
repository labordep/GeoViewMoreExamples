Extension { #name : 'GeoViewExamples' }

{ #category : '*GeoView-Examples-Bloc-GeoJSON' }
GeoViewExamples class >> exampleWithGeoJSON [
		
	| element layer datas brest |
	element := GeoViewAeElement new.

	"create GeoJSON map layer"
	layer := GeoViewDomainObjectsLayer new name: #geoJSON.
	layer setProcessData: GeoCircleProcessData new forClass: GeoCircle.
	layer setProcessData: GeoObjectWrapperForGJFeatureProcessData new forClass: GeoObjectWrapper.
	
	element addLayer: layer.

	"add datas"
	datas := (GeoJSONReader fromString: (GeoJSONReaderTest new exampleDepartments)) features.
	(1 to: datas size) do:[ :i | element addObject: ((GeoObjectWrapper wrap: (datas at: i)) key: i) ].
	
	brest := GeoCircle new key: 97.
	brest radiusInMeters: 100000.
	brest fillStyle: Color yellow asSmockFillStyle.
	brest absoluteCoordinates: (AbsoluteCoordinates frBrest).
	element addObject: brest.
	
	^ self openViewInWindow: element
]
