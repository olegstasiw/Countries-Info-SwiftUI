//
//  UIImageLoad.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 24.12.2020.
//

import SwiftUI

struct UIImageLoad: View {
    
    @ObservedObject var imageLoader = ImageLoader()
    var code: String
    var height: CGFloat
    var width: CGFloat?
    
    init(code: String, height: CGFloat, width: CGFloat?) {
        self.code = code
        self.height = height
        self.width = width
    }
    
    var body: some View {
        Group {
            if imageLoader.dataIsLoaded {
                Image(uiImage: imageLoader.downloadedImage!)
                    .resizable()
                    .frame(width: width, height: height)
                    .cornerRadius(5)
            } else {
                ProgressView {
                    Text("Loading Image...")
                }
            }
        }.onAppear {
            self.imageLoader.load(code: code)
        }
    }
}

struct UIImageLoad_Previews: PreviewProvider {
    static var previews: some View {
        UIImageLoad(code:"BR", height: 120, width: nil)
    }
}
