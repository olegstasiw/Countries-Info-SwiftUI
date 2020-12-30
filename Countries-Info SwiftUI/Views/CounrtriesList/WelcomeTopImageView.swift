//
//  WelcomeTopImageView.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 30.12.2020.
//

import SwiftUI

struct WelcomeTopImageView: View {
    var body: some View {
        ZStack {
            Color(.systemGray5)
                .frame(height: 200)
                .shadow(color: .init(.systemGray3), radius: 10, x: 5, y: 5)
        VStack {
            Image(Constants.earthImage)
                .resizable()
                .frame(width: 133, height: 133)
            Text("Choose a card :)")
                .font(.custom(Constants.robotoRegular, size: 44.0))
                .scaledToFill()
        }
    }
        .padding(.bottom, 20)
    }
}

struct WelcomeTopImageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeTopImageView()
    }
}
