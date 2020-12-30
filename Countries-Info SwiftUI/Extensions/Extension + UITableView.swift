//
//  Extension + UITableView.swift
//  SwiftUI Countries
//
//  Created by Oleh Stasiv on 29.12.2020.
//

import UIKit

extension UITableView {

    @objc static func swizzleTableView() {

        guard self == UITableView.self else {
            return
        }

        let originalTableViewDelegateSelector = #selector(setter: self.delegate)
        let swizzledTableViewDelegateSelector = #selector(self.nsh_set(delegate:))

        let originalTableViewMethod = class_getInstanceMethod(self, originalTableViewDelegateSelector)
        let swizzledTableViewMethod = class_getInstanceMethod(self, swizzledTableViewDelegateSelector)

        method_exchangeImplementations(originalTableViewMethod!,
                                       swizzledTableViewMethod!)
    }

    @objc open func nsh_set(delegate: UITableViewDelegate?) {
        nsh_set(delegate: delegate)

        guard let delegate =  delegate else { return }

        let originalDidSelectSelector = #selector(delegate.tableView(_:didSelectRowAt:))
        let swizzleDidSelectSelector = #selector(self.tableView(_:didSelectRowAt:))

        let swizzleMethod = class_getInstanceMethod(UITableView.self, swizzleDidSelectSelector)
        let didAddMethod = class_addMethod(type(of: delegate), swizzleDidSelectSelector, method_getImplementation(swizzleMethod!), method_getTypeEncoding(swizzleMethod!))

        if didAddMethod {
            let didSelectOriginalMethod = class_getInstanceMethod(type(of: delegate), NSSelectorFromString("tableView:didSelectRowAt:"))
            let didSelectSwizzledMethod = class_getInstanceMethod(type(of: delegate), originalDidSelectSelector)
            if didSelectOriginalMethod != nil && didSelectSwizzledMethod != nil {
                method_exchangeImplementations(didSelectOriginalMethod!, didSelectSwizzledMethod!)
            }
        }
    }

    @objc open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView(tableView, didSelectRowAt: indexPath)

        tableView.deselectRow(at: indexPath,
                              animated: true)

    }
}
