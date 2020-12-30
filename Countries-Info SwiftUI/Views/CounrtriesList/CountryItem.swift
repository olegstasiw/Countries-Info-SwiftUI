//
//  CountryItem.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 24.12.2020.
//

import SwiftUI

struct CountryItem: View {
    
    var country: Country
    var body: some View {
            HStack {
                UIImageLoad(code: country.alpha2Code, height: 120, width: nil)
                Spacer()
                VStack(alignment: .leading) {
                    Text("Country name")
                        .font(.custom(Constants.robotoRegular, size: 12.0))
                        .scaleEffect()
                    Text(country.name)
                        .font(.custom(Constants.robotoBold, size: 32.0))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    Text("Capital")
                        .font(.custom(Constants.robotoRegular, size: 12.0))
                        .scaleEffect()
                    Text(country.capital)
                        .font(.custom(Constants.robotoBold, size: 24.0))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    Text("Region")
                        .font(.custom(Constants.robotoRegular, size: 12.0))
                        .scaleEffect()
                    Text(country.subregion?.region.name ?? "")
                        .font(.custom(Constants.robotoBold, size: 24.0))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
                .frame(width: 100,height: 140)
                Spacer()
            }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor(red:255/255, green: 228/255, blue: 133/255, alpha: 0.5)), Color(UIColor(red:186/255, green: 123/255, blue: 0/255, alpha: 0.5))])
                                       , startPoint: .top, endPoint: .bottom))
            .cornerRadius(15)
        }
}

struct CountryItem_Previews: PreviewProvider {
    static var previews: some View {
        CountryItem(country: Country(name: "Brazil", capital: "Brazilia", population: 0, currencies: [], officialLanguages: [], timezones: [], callingCodes: [], alpha2Code: "br", subregion: Subregion(region: Region(name: "Americas"))))
    }
}
