//
//  ViewControllersAssembly.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 30.12.2020.
//

import UIKit
import Swinject

class ViewControllersAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ContriesListView.self) { r in
            let controller = ContriesListView(viewModel: CounriesViewModel(apollo: r.resolve(ApolloManager.self)!))
            UINavigationBar.appearance().barTintColor = UIColor(red:214/255, green: 194/255, blue: 141/255, alpha: 1)
            return controller
        }
    }
}
