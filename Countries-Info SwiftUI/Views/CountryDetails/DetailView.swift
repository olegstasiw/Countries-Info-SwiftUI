//
//  DetailView.swift
//  SwiftUI Countries
//
//  Created by mac on 27.12.2020.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var imageLoader = ImageLoader()
    var viewModel: CountryDetailsViewModelProtocol
    
    var body: some View {
        VStack {
            TopImagesView()
            ScrollView {
                VStack{
                    HStack {
                        Group {
                            if imageLoader.dataIsLoaded {
                                Image(uiImage: imageLoader.downloadedImage!)
                                    .resizable()
                                    .frame(width: 140, height: 100)
                                    .cornerRadius(5)
                            } else {
                                ProgressView {
                                    Text("Loading Image...")
                                }
                            }
                        }.onAppear {
                            self.imageLoader.load(code: viewModel.alpha2Code)
                        }
                        Spacer()
                    }
                    DetailElement(text: viewModel.countryName, title: "Name", color: #colorLiteral(red: 1, green: 0.8941176471, blue: 0.6431372549, alpha: 1), showimage: true)
                    DetailElement(text: viewModel.capital, title: "Capital", color: #colorLiteral(red: 0.7254901961, green: 0.9176470588, blue: 0.7647058824, alpha: 1), showimage: true)
                    DetailElement(text: viewModel.population, title: "Population", color: #colorLiteral(red: 1, green: 0.8941176471, blue: 0.6431372549, alpha: 1), showimage: true)
                    DetailElement(text: viewModel.region, title: "Region", color: #colorLiteral(red: 0.7254901961, green: 0.9176470588, blue: 0.7647058824, alpha: 1), showimage: true)
                    DetailArrayElement(array: viewModel.currencies, title: "Currencies", color: #colorLiteral(red: 1, green: 0.8941176471, blue: 0.6431372549, alpha: 1), showImage: true, backgrondColor: .yellow)
                    DetailArrayElement(array: viewModel.languages, title: "Languages", color: #colorLiteral(red: 0.7254901961, green: 0.9176470588, blue: 0.7647058824, alpha: 1), showImage: true, backgrondColor: .orange)
                    DetailArrayElement(array: viewModel.timeZones, title: "Time zones", color: #colorLiteral(red: 1, green: 0.8941176471, blue: 0.6431372549, alpha: 1), showImage: true, backgrondColor: .green)
                    DetailArrayElement(array: viewModel.callingCodes, title: "Calling Codes", color: #colorLiteral(red: 0.7254901961, green: 0.9176470588, blue: 0.7647058824, alpha: 1), showImage: false, backgrondColor: .blue)
                }
                .navigationBarTitle("Country Detail", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action: {
                    self.mode.wrappedValue.dismiss()
                }, label: {
                    Image("backImg")
                        .foregroundColor(.black)
                }))
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: CountryDetailsViewModel(country: Country(name: "Brazal", capital: "Brazilia", population: 11110, currencies: [], officialLanguages: [], timezones: [], callingCodes: [], alpha2Code: "br", subregion: Subregion(region: Region(name: "America")))))
    }
}
