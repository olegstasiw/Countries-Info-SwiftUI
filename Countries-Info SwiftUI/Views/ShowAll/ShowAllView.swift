//
//  ShowAllView.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 29.12.2020.
//

import SwiftUI

struct ShowAllView: View {
    @Environment(\.viewController) var presentation: ViewControllerHolder
    private var viewController: UIViewController? {
        self.presentation.value
    }
    var viewModel: ShowAllViewModelProtocol

    var body: some View {
        VStack {
            Text(viewModel.message)
            createTextViews(color: viewModel.backgrondColor, elements: viewModel.list)
            Button("Close") {
                self.presentation.value?.dismiss(animated: true)
            }
            
            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
            .foregroundColor(.black)
            .background(Color(.systemBlue))
            .cornerRadius(20)
        }
        .frame(minWidth: UIScreen.main.bounds.width, minHeight: UIScreen.main.bounds.height)
        .ignoresSafeArea(.all)
        .background(BlurView(style: .light))
    }
    
    func createTextViews(color: NewColor, elements: [String]) -> some View {
        let color = UIColor(red: color.color.red,
                            green: color.color.green,
                            blue: color.color.blue,
                            alpha: 1)
        
        var textViews: some View {
            
            return VStack {
                ForEach(elements, id: \.self) { element in
                    return Text(element)
                        .font(.custom(Constants.robotoBold, size: 20.0))
                        .lineLimit(1)
                        .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                        .background(Color(color))
                        .cornerRadius(20)
                        .fixedSize()
                }
            }
        }
        return textViews
    }
}
