//
//  ContentView.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 24.12.2020.
//

import SwiftUI
import Combine

struct ContriesListView: View {
    
    @State private var didLoad = false
    @ObservedObject var viewModel: CounriesViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                WelcomeTopImageView()
                List(viewModel.countries.country, id: \.name) { country in
                    ZStack {
                        NavigationLink(destination: DetailView(viewModel: CountryDetailsViewModel(country: country))){
                            EmptyView()
                        }
                        .opacity(0.0)
                        .buttonStyle(PlainButtonStyle())
                        CountryItem(country: country)
                    }
                }
                .onAppear {
                    if didLoad == false {
                        didLoad = true
                        viewModel.fetch()
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal, content: {
                    Text("Countries List")
                })
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContriesListView(viewModel: CounriesViewModel(apollo: ApolloManager()))
    }
}

