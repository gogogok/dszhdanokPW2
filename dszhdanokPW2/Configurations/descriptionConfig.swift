//
//  descriptionConfig.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 23.09.25.
//

import UIKit

public class DescriptionConfiguration {
    
    private enum Constants {
        static let descriptionFont: CGFloat = 20
        static let descriptionNumberOfLines = 0
        static let descriptionLeading: CGFloat = 20
        static let descriptionLabelText: String = "This app will make your dreams come true. Now you will see it with your own eyes\n My first wish is to change the background of this app!\n\n (Just use the sliders!!)\n Also you have another two options to\n change color:"
        static let viewBottom: CGFloat = 20
        
    }
    
    static func configureDescription(descriptionLabel: UILabel, titleLable: UILabel, in view: UIView) {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = Constants.descriptionLabelText
        descriptionLabel.font = UIFont.systemFont(ofSize: Constants.descriptionFont)
        descriptionLabel.textColor = getRandomHEXColor()
        descriptionLabel.numberOfLines = Constants.descriptionNumberOfLines
        
        view.addSubview(descriptionLabel)
        descriptionLabel.pinTop(to: titleLable.bottomAnchor, Constants.viewBottom)
        descriptionLabel.pinLeft(to: view.leadingAnchor, Constants.descriptionLeading)
        descriptionLabel.pinCenterX(to: view.centerXAnchor)
    }
}
