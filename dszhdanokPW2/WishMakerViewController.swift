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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    private func configureUI() {
        view.backgroundColor = UIColor(named: "MyBackgroundColor")
        configureTitle()
        configureDescription()
        configureSliders()
    }
    
    private func configureTitle() {
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.text = "WishMaker"
        titleLable.font = UIFont.systemFont(ofSize: Constants.fontSizeTitle, weight: .semibold)
        titleLable.textColor = getUniqueColor()
        
        view.addSubview(titleLable)
        titleLable.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        //titleLable.pinLeft(to: view.leadingAnchor, 20)
        titleLable.pinCenterX(to: view.centerXAnchor)
    }
    
    private func configureDescription() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "This app will make your dreams come true. Now you will see it with your own eyes\n My first wish is to change the background of this app!\n\n (Just use the sliders!!)"
        descriptionLabel.font = UIFont.systemFont(ofSize: Constants.descriptionFont)
        descriptionLabel.textColor = getUniqueColor()
        descriptionLabel.numberOfLines = Constants.descriptionNumberOfLines
        
        view.addSubview(descriptionLabel)
        descriptionLabel.pinTop(to: titleLable.bottomAnchor, Constants.viewBottom)
        descriptionLabel.pinLeft(to: view.leadingAnchor, Constants.descriptionLeading)
        descriptionLabel.pinCenterX(to: view.centerXAnchor)
    }
    
    private func configureSliders() {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.stackRadius
        stack.clipsToBounds = true
        
        let sliderRed = CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax)
        let sliderBlue = CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax)
        let sliderGreen = CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
        
        for slider in [sliderRed, sliderBlue, sliderGreen] {
            stack.addArrangedSubview(slider)
        }
        
        stack.pinCenterX(to: view.centerXAnchor)
        stack.pinLeft(to: view.leadingAnchor, Constants.stackLeading)
        stack.pinBottom(to: view.bottomAnchor, Constants.stackBottom)
        
        sliderRed.valueChanged = { [weak self] value in
            self?.view.backgroundColor =  updateBackGroundColor(sliderRed: sliderRed, sliderGreen: sliderGreen, sliderBlue: sliderBlue)
        }
        
        sliderBlue.valueChanged = { [weak self] value in
            self?.view.backgroundColor =  updateBackGroundColor(sliderRed: sliderRed, sliderGreen: sliderGreen, sliderBlue: sliderBlue)
        }
        
        sliderGreen.valueChanged = { [weak self] value in
            self?.view.backgroundColor =  updateBackGroundColor(sliderRed: sliderRed, sliderGreen: sliderGreen, sliderBlue: sliderBlue)
        }
        
    
    }
    
}
