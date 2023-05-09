//
//  AddressSearchView.swift
//  TapHap
//
//  Created by pr0m3th3usEx on 08/05/2023.
//

import SwiftUI
import CoreLocation

public struct AddressSearchView: View {
    @Binding var bLocation: Location?
    
    private var geocoder = CLGeocoder()
    @StateObject private var mapSearch = MapSearch()
    
    @Environment(\.dismiss) var dismiss
    
    init(bLocation: Binding<Location?>, geocoder: CLGeocoder = CLGeocoder(), mapSearch: MapSearch = MapSearch()) {
        self._bLocation = bLocation
        self.geocoder = geocoder
    }

    public var body: some View {
        VStack {
            Section {
                TextField("Search...", text: $mapSearch.searchTerm)
                    .textFieldStyle(.roundedBorder)
            }

            List(mapSearch.locationResults, id: \.self) { location in
                Button {
                    geocoder.geocodeAddressString("\(location.title), \(location.subtitle)") { placemarks, error in
                        let placemark = placemarks?.first
                        
                        guard
                            let lat = placemark?.location?.coordinate.latitude,
                            let lng = placemark?.location?.coordinate.longitude,
                            error == nil
                        else {
                            print("Issue during geocoding")
                            return;
                        }
                        
                        bLocation = Location(title: location.title, subTitle: location.subtitle, latitude: lat, longitude: lng)
                        
                        dismiss()
                    }
                } label: {
                    Text("\(location.title), \(location.subtitle)")
                }
                
            }
            .listStyle(.plain)
            .padding(.zero)
            Spacer()
        }.padding()
        
    }
}

struct AddressSearchView_Previews: PreviewProvider {
    @State static var location: Location? = nil
    
    static var previews: some View {
        AddressSearchView(bLocation: $location)
    }
}

