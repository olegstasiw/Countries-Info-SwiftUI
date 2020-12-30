//
//  DetailElement.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 28.12.2020.
//

import SwiftUI

struct DetailElement: View {
    var text: String
    var title: String
    var color: UIColor
    var showimage: Bool
    
    var body: some View {
        VStack {
        HStack{
            Color(color)
                .frame(width: 30, height: 30)
                .cornerRadius(15)
            VStack {
                HStack {
                    Text(title)
                    .font(.custom(Constants.robotoRegular, size: 14.0))
                    Spacer()
                }
                HStack {
                    Text(text)
                        .lineLimit(1)
                        .font(.custom(Constants.robotoBold, size: 20.0))
                        .scaledToFill()
                    Spacer()
                }
            }
        }
        .frame(height: 40)
        .frame(maxWidth: .infinity, alignment: .leading)
        SpaceImageView(showImage: showimage)
        }
    }
}

struct DetailElement_Previews: PreviewProvider {
    static var previews: some View {
        DetailElement(text: "Brazil",title: "Name", color: .blue, showimage: true)
    }
}
