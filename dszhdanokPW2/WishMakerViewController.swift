//
//  WishMakerViewController.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 21.09.25.
//

import UIKit

final class WishMakerViewController : UIViewController {
    
    private let titleLable = UILabel()
    private let descriptionLabel = UILabel()
    private let stack = UIStackView()
    private let stackOfButtons = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    private func configureUI() {
        view.backgroundColor = UIColor(named: Constants.backGroundName)
        TitleConfiguration.configureTitle(titleLable : titleLable, in: view)
        DescriptionConfiguration.configureDescription(descriptionLabel: descriptionLabel, titleLable: titleLable, in: view)
        SliderConfiguration.configureSliders(stack: stack, in: view)
        HideButtonConfiguration.configureButton(stack: stack, in: view)
        ActionButtonsConfiguration.configureButton(description: descriptionLabel, stack: stackOfButtons, in: view)
    }
}
