//
//  titleConf.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 23.09.25.
//

import UIKit

public class TitleConfiguration {
    
    //MARK: - Constants
    
    private enum Constants {
        static let titleLabelName: String = "WishMaker"
        static let fontSizeTitle: CGFloat = 32
        static let topUp: CGFloat = 55
    }
    
    //MARK: - configure func
    
    static func configureTitle(titleLable: UILabel, in view: UIView) {
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.text = Constants.titleLabelName
        titleLable.font = UIFont.systemFont(ofSize: Constants.fontSizeTitle, weight: .semibold)
        titleLable.textColor = getRandomHEXColor()
        
        view.addSubview(titleLable)
        titleLable.pinTop(to: view.topAnchor, Constants.topUp)
        titleLable.pinCenterX(to: view.centerXAnchor)
    }
}
