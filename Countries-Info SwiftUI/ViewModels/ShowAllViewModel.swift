//
//  ShowAllViewModel.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 30.12.2020.
//

import Foundation

protocol ShowAllViewModelProtocol {
    var message: String { get }
    var list: [String] { get }
    var backgrondColor: NewColor { get }
    
    init(list: [String], backgrondColor: NewColor, message: String)
}

class ShowAllViewModel: ShowAllViewModelProtocol {
    var message: String
    var backgrondColor: NewColor
    var list: [String]
    
    required init(list: [String], backgrondColor: NewColor, message: String) {
        self.list = list
        self.backgrondColor = backgrondColor
        self.message = message
    }
}

