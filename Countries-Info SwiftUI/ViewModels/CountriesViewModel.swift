//
//  CountriesViewModel.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 24.12.2020.
//

import Foundation
import Combine

class CounriesViewModel: ObservableObject {
    @Published var countries: AllCountries = AllCountries(country: [])
    
    private let apollo: ApolloManager
   
    init(apollo: ApolloManager) {
        self.apollo = apollo
    }
    
    func fetch() {
            self.apollo.fetch(query: AllCountriesQuery(), type: AllCountries.self){ (data) in
                self.countries = data
            }
    }
}
