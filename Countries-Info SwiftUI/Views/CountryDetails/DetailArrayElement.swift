//
//  DetailArrayElement.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 28.12.2020.
//

import SwiftUI

struct DetailArrayElement: View {
    
    @Environment(\.viewController) private var viewControllerHolder: ViewControllerHolder
    
    private var viewController: UIViewController? {
        self.viewControllerHolder.value
    }
    var array: [String]
    var title: String
    var color: UIColor
    var showImage: Bool
    var backgrondColor: NewColor
    
    var body: some View {
        ZStack {
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
                        createTextViews(elements: array)
                    }
                }
                .frame(height: 40)
                .frame(maxWidth: .infinity, alignment: .leading)
                SpaceImageView(showImage: showImage)
            }
        }
    }
    
    private func createTextViews(elements: [String]) -> some View {
        let color = UIColor(red: backgrondColor.color.red,
                            green: backgrondColor.color.green,
                            blue: backgrondColor.color.blue,
                            alpha: 1)
        
        var textViews: some View {
            var buttonIshidden = true
            var size: CGFloat = 140
            let array: [String] = elements
            var emptyArray: [String] = []
            for text in array {
                let string = text
                let font = UIFont(name: Constants.robotoBold, size: 20.0)
                let width = string.size(OfFont: font!).width
                size += width + 30
                if size < UIScreen.main.bounds.width {
                    emptyArray.append(string)
                    
                } else {
                    buttonIshidden = false
                }
            }
            return HStack {
                ForEach(emptyArray, id: \.self) { element in
                    return Text(element)
                        .font(.custom(Constants.robotoBold, size: 20.0))
                        .lineLimit(1)
                        .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                        .background(Color(color))
                        .cornerRadius(20)
                        .fixedSize()
                }
                if buttonIshidden == false {
                    Button(action: {
                        self.viewController?.present(builder: {
                            ShowAllView(viewModel: ShowAllViewModel(list: elements, backgrondColor: backgrondColor, message: "Show All"))
                        })
                    }, label: {
                        Image(Constants.dotsImage)
                        
                    })
                    .lineLimit(1)
                    .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                    .frame(width: 50, height: 30)
                    .fixedSize()
                    .font(.custom(Constants.robotoRegular, size: 18.0))
                    .foregroundColor(.black)
                    .background(Color(#colorLiteral(red: 0.2122632563, green: 0.4038027823, blue: 0.8837400079, alpha: 1)))
                    .cornerRadius(20)
                }
                Spacer()
            }
        }
        return textViews
    }
}

struct DetailArrayElement_Previews: PreviewProvider {
    static var previews: some View {
        DetailArrayElement(array: ["ffffff", "ffffff", "ffffff", "f", "ffffff"], title: "title", color: .blue, showImage: true, backgrondColor: .orange)
    }
}


extension String {
    func size(OfFont font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: font])
    }
}
