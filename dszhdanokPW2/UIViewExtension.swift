//
//  UIViewExtension.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 8.11.25.
//

import UIKit

// MARK: - расширение для поиска родителя (для того, чтобы найти ячейку, в которой нажата кнопка)
extension UIView {
    func findSuperview<T: UIView>(of type: T.Type) -> T? {
        var v: UIView? = self
        while let current = v {
            if let typed = current as? T { return typed }
            v = current.superview
        }
        return nil
    }
}
