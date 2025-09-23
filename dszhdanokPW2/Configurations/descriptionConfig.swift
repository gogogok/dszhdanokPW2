//
//  descriptionConfig.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 23.09.25.
//

import UIKit

public class DescriptionConfiguration {
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
