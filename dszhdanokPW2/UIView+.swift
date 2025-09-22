//
//  UIView+.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 21.09.25.
//

import UIKit

public extension UIView {
    func pinCenterX(to otherViewLayout: NSLayoutXAxisAnchor, _ const: Double = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: otherViewLayout, constant: const).isActive = true
    }
    
    
    func pinTop(to otherViewLayout: NSLayoutYAxisAnchor, _ const: Double = 0) {
        translatesAutoresizingMaskIntoConstraints = false
                topAnchor.constraint(equalTo: otherViewLayout, constant: const).isActive = true
    }
    
    func pinBottom(to otherViewLayout: NSLayoutYAxisAnchor, _ const: Double = 0) {
        translatesAutoresizingMaskIntoConstraints = false
                topAnchor.constraint(equalTo: otherViewLayout, constant: -const).isActive = true
    }
    
    
    func pinLeft(to otherViewLayout: NSLayoutXAxisAnchor, _ const: Double = 0) {
            translatesAutoresizingMaskIntoConstraints = false
            leadingAnchor.constraint(equalTo: otherViewLayout, constant: const).isActive = true
        }
    
    func changeWidth(_ const: Double = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: const).isActive = true
    }
}

