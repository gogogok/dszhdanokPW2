//
//  titleConf.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 23.09.25.
//

import UIKit

public class TitleConfiguration {
    static func configureTitle(titleLable: UILabel, in view: UIView) {
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.text = Constants.titleLabelName
        titleLable.font = UIFont.systemFont(ofSize: Constants.fontSizeTitle, weight: .semibold)
        titleLable.textColor = getUniqueColor()
        
        view.addSubview(titleLable)
        titleLable.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        titleLable.pinCenterX(to: view.centerXAnchor)
    }
}
