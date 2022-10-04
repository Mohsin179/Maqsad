//
//  UiTableViewCell+Extension.swift
//  Maqsad-Test-App
//
//  Created by Mohsin Hassan on 04/10/2022.
//

import UIKit

public extension UITableView {
    func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
    }
    
    func reloadDataAnimated(type: CATransitionType = .push, subType: CATransitionSubtype = .fromLeft) {
        reloadData()
        let animation = CATransition()
        animation.type = type
        animation.subtype = subType
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.fillMode = CAMediaTimingFillMode.both
        animation.duration = 0.3
        layer.add(animation, forKey: "UITableViewReloadDataAnimationKey")
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
