//
//  MapView.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 16/05/2023.
//

import SwiftUI
import MapKit

class CustomAnnotationView: MKAnnotationView {
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.image = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.image = nil
    }
}

struct CustomMapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.delegate = context.coordinator
        
        // Remove existing annotations
        uiView.removeAnnotations(uiView.annotations)
        
        // Add your custom annotations
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        uiView.addAnnotation(annotation)
        
        // Zoom to the annotation
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        uiView.setRegion(region, animated: true)
    }
    
    func makeCoordinator() -> MapCoordinator {
        MapCoordinator()
    }
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation {
                // Return nil for the user location annotation
                return nil
            }
            
            // Use the custom annotation view for your annotations
            let annotationView = CustomAnnotationView(annotation: annotation, reuseIdentifier: "CustomAnnotation")
            
            return annotationView
        }
    }
}
