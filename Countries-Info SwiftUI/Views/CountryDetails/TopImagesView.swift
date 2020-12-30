//
//  TopImagesView.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 24.12.2020.
//

import SwiftUI

struct TopImagesView: View {
    var body: some View {
        ZStack {
            Color(.systemGray5)
                .frame(height: 200)
                .shadow(color: .init(.systemGray3), radius: 10, x: 5, y: 5)
        VStack {
            Image(Constants.earthImage)
                .resizable()
                .frame(width: 133, height: 133)
            Image(Constants.wingImage)
                .resizable()
                .frame(height: 100)
                .offset(y: -60)
                .padding(.bottom, -60)
        }
    }
        .padding(.bottom, 20)
    }
}

struct TopImagesView_Previews: PreviewProvider {
    static var previews: some View {
        TopImagesView()
    }
}
