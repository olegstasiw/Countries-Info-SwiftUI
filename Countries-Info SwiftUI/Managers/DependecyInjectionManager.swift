//
//  DependecyInjectionManager.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 30.12.2020.
//

import Foundation
import  Swinject

class DependecyInjectionManager {
    static let shared = DependecyInjectionManager()
    
    let assembler = Assembler([
        ApolloAssembly(),
        ViewControllersAssembly()
    ])
    
}

