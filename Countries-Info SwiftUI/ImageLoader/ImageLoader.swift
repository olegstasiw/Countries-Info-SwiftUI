//
//  ImageLoader.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 24.12.2020.
//

import UIKit
import Combine

class ImageLoader: ObservableObject {
    
    @Published var dataIsLoaded = false
    @Published var downloadedImage: UIImage?
    
    func load(code: String) {
        DispatchQueue.global().async {
            guard let imageURL = URL(string: "https://flagpedia.net/data/flags/normal/\(code.lowercased()).png") else {
                fatalError("ImageURL is not correct!")
            }
            
            guard let data = try? Data(contentsOf: imageURL) else {
                DispatchQueue.main.async {
                    self.downloadedImage = UIImage(named: "unknown")
                }
                return
            }
            
            
            DispatchQueue.main.async {
                self.dataIsLoaded = true
                self.downloadedImage = UIImage(data: data)
            }
        }
            
        
            
    
        
    }
    
    
}
