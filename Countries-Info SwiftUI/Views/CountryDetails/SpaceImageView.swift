//
//  SpaceImageView.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 28.12.2020.
//

import SwiftUI

struct SpaceImageView: View {
    var showImage: Bool
    
    var body: some View {
        if showImage {
            HStack{
                Image(Constants.vectorImage)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .offset(y: -10)
                    .padding(.bottom, -10)
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } else {
            EmptyView()
        }
    }
}

struct SpaceImageView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceImageView(showImage: true)
    }
}
