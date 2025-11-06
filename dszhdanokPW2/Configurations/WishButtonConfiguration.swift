//
//  WishButtonConfiguration.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 6.11.25.
//

import UIKit

final class WishButtonsConfiguration {
    
    private enum Constants {
        static let buttonHeight: CGFloat = 50
        static let buttonText: String = "Add Wish"
        static let buttonBottom: CGFloat = 20
        static let buttonSide: CGFloat = 40
        static let buttonRadius: CGFloat = 10
    }
    
    static func makeAddWishButton() -> UIButton {
        let addWishButton = UIButton(type: .system)
        addWishButton.setHeight(Constants.buttonHeight)
        addWishButton.backgroundColor = .white
        addWishButton.setTitleColor(.systemPink, for: .normal)
        addWishButton.setTitle(Constants.buttonText, for: .normal)
        addWishButton.layer.cornerRadius = Constants.buttonRadius
        return addWishButton
    }
    
    
    public static func configureAddWishButton(addWishButton : UIButton, in  view: UIView) {
        view.addSubview(addWishButton)
        addWishButton.pinBottom(to: view, Constants.buttonBottom)
        addWishButton.pinHorizontal(to: view, Constants.buttonSide)
        addWishButton.layer.cornerRadius = Constants.buttonRadius
    }
}
