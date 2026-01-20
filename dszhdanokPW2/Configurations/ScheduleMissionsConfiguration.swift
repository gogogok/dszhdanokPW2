//
//  ScheduleMissionsConfigurations.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 19.01.26.
//

import UIKit

final class ScheduleMissionsConfiguration {
    
    //MARK: - Constants
    
    private enum Constants {
        static let buttonHeight: CGFloat = 50
        static let buttonText: String = "Schedule wish granting"
        static let buttonBottom: CGFloat = 20
        static let buttonSide: CGFloat = 40
        static let buttonRadius: CGFloat = 10
    }
    
    //MARK: - create button func
    
    static func makeScheduleWishButton() -> UIButton {
        let scheduleButton = UIButton(type: .system)
        scheduleButton.setHeight(Constants.buttonHeight)
        scheduleButton.backgroundColor = .white
        scheduleButton.setTitleColor(.systemPink, for: .normal)
        scheduleButton.setTitle(Constants.buttonText, for: .normal)
        scheduleButton.layer.cornerRadius = Constants.buttonRadius
        return scheduleButton
    }
    
    //MARK: - configure func
    
    public static func configureScheduleWishButton(scheduleWishButton : UIButton) {
        scheduleWishButton.layer.cornerRadius = Constants.buttonRadius
    }
}
