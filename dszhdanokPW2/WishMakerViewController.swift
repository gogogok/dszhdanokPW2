//
//  WishMakerViewController.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 21.09.25.
//

import UIKit

final class WishMakerViewController : UIViewController {
    
    typealias Model = ClickerModel
    
    private let randomButton : UIButton = ActionButtonsConfiguration.makeRandomButton()
    private let hexButton : UIButton = ActionButtonsConfiguration.makeHexButton()
    private let addWishButton: UIButton = WishButtonsConfiguration.makeAddWishButton()
    
    private var hedealidersButton = UIButton()
    
    private let titleLable = UILabel()
    private let descriptionLabel = UILabel()
    private let stack = UIStackView()
    private let stackOfButtons = UIStackView()
    
    private var textField: UITextField?
    private var button: UIButton?
    private var closeButton: UIButton?
    
    private let sliderRed = CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax)
    private let sliderBlue = CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax)
    private let sliderGreen = CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
    
    
    
    // MARK: - Constants
    private enum Constants {
        static let backGroundName: String = "MyBackgroundColor"
        static let fatalError: String = "init(coder:) has not been implemented"
        static let durationOfAnimation: CGFloat = 0.5
        
        static let showButtonText: String = "Show sliders"
        static let hideButtonText: String = "Hide sliders"
        
        static let alphaFullValue: CGFloat = 1
        
        static let buttonHiddenAlfaOn: CGFloat = 0
        static let buttonHiddenAlfaOff: CGFloat = 1
        
        static let sliderMin: Double = 0
        static let sliderMax: Double = 1.0
        static let red: String = "Red"
        static let green: String = "Green"
        static let blue: String = "Blue"
        static let stackRadius: CGFloat = 10
        static let stackBottom: CGFloat = 250
        static let stackLeading: CGFloat = 20
        static let viewBottom: CGFloat = 20
        
        static let emptyString: String = ""
        static let textFieldError: String = "Текст не введен или неверное значение HEX "
        
        static let pattern = "^#[0-9A-Fa-f]{0,6}$"
        
        
        
    }

    // MARK: - Fields
    private let interactor: ClickerBusinessLogic

    // MARK: - LifeCycle
    init(
        interactor: ClickerBusinessLogic
    ) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        interactor.loadStart(Model.Start.Request())
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor(named: Constants.backGroundName)
        TitleConfiguration.configureTitle(titleLable : titleLable, in: view)
        DescriptionConfiguration.configureDescription(descriptionLabel: descriptionLabel, titleLable: titleLable, in: view)
        
        WishButtonsConfiguration.configureAddWishButton(addWishButton : addWishButton, in: view)
        
        SliderConfiguration.configureSliders(stack: stack, in: view, sliderRed: sliderRed, sliderBlue: sliderBlue, sliderGreen: sliderGreen, wishButton: addWishButton)
    
        
        hedealidersButton =  HideButtonConfiguration.configureButton(stack: stack, in: view)
        
        
        ActionButtonsConfiguration.configureButton(description: descriptionLabel, stack: stackOfButtons, in: view, randomButton: randomButton, HEXButton: hexButton)
        
        view.addSubview(hedealidersButton)
        
        randomButton.addTarget(self, action: #selector(ActionButtonRandom), for: .touchUpInside)
        hexButton.addTarget(self, action: #selector(ActionHEXButton), for: .touchUpInside)
        hedealidersButton.addTarget(self, action: #selector(HideSlidersButton), for: .touchUpInside)
        
        sliderRed.slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        sliderBlue.slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        sliderGreen.slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        
        subscribeSliders()
        
        addWishButton.addTarget(self, action: #selector(addWishButtonPressed), for: .touchUpInside)
    }
    
    
    // MARK: - Actions
    @objc
    private func ActionButtonRandom() {
        interactor.loadPressChangeRandom(Model.PressChangeRandomColor.Request())
    }
    
    @objc
    private func ActionHEXButton() {
        interactor.loadPressChangeRGB(Model.PressChooseRGB.Request())
    }
    
    @objc
    private func HideSlidersButton() {
        interactor.loadPressHideSlider(Model.PressHideSlider.Request())
    }
    
    @objc
    private func sliderValueChanged() {
        interactor.loadChangeSlider(Model.PressChangeSlider.Request(), slider: sliderRed)
        interactor.loadChangeSlider(Model.PressChangeSlider.Request(), slider: sliderGreen)
        interactor.loadChangeSlider(Model.PressChangeSlider.Request(), slider: sliderBlue)
    }
    
    @objc
    func ButtonTapped() {
        interactor.loadPressChangeApply(Model.PressChangeApplyColor.Request())
    }
    
    @objc
    func HideView() {
        interactor.loadPressCloseRGB(Model.PressCloseButton.Request())
    }
    
    @objc
    private func addWishButtonPressed() {
        // this will be done later!
    }
    
    // MARK: - DisplayLogic
    func displayStart(_ viewModel: Model.Start.ViewModel) {
    
    }
    
    func displayPressRandom(_ viewModel: Model.PressChangeRandomColor.ViewModel) {
        randomButton.isEnabled = false
        UIView.animate(withDuration: Constants.durationOfAnimation) {
            self.view.backgroundColor = getRandomColor()
        } completion: { _ in
            self.randomButton.isEnabled = true
        }
    }
    
    func displayHideSliders(_ viewModel: Model.PressHideSlider.ViewModel) {
        let willHide = !stack.isHidden
        hedealidersButton.isEnabled = false
        
        UIView.animate(withDuration: Constants.durationOfAnimation) {
            if willHide {
                self.stack.alpha = Constants.buttonHiddenAlfaOn
            } else {
                self.stack.isHidden = false
                self.stack.alpha = Constants.buttonHiddenAlfaOff
            }
        } completion: { _ in
            if willHide {
                self.stack.isHidden = true
            }
            self.hedealidersButton.setTitle(willHide ? Constants.showButtonText : Constants.hideButtonText, for: .normal)
            self.hedealidersButton.isEnabled = true
            
        }
    }
    
    func displayPressHEXButton(_ viewModel: Model.PressChooseRGB.ViewModel) {
        self.textField = UITextField()
        self.button = UIButton()
        self.closeButton = UIButton()
        
        self.button?.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
        self.closeButton?.addTarget(self, action: #selector(HideView), for: .touchUpInside)
        
        hexButton.isEnabled = false
        UIView.animate(withDuration: Constants.durationOfAnimation) {
            TextFieldConfiguration.configureText(in: self.view, stack: self.stackOfButtons, textField: self.textField, button: self.button, closeButton: self.closeButton)
            self.button?.addTarget(self, action: #selector(self.ButtonTapped), for: .touchUpInside)
            self.closeButton?.addTarget(self, action: #selector(self.HideView), for: .touchUpInside)
        } completion: { _ in
            self.hexButton.isEnabled = true
        }
    }
    
    func displaySliderChange(_ viewModel: Model.PressChangeSlider.ViewModel, slider : CustomSlider) {
        slider.valueChanged?(Double(slider.slider.value))
        slider.currentValueLabel.text = String(format: "%.2f", slider.slider.value)
    }
    
    func subscribeSliders() {
        sliderRed.valueChanged = { [weak view] value in
            view?.backgroundColor =  updateBackGroundColor(sliderRed: self.sliderRed, sliderGreen: self.sliderGreen, sliderBlue: self.sliderBlue)
        }
        
        sliderBlue.valueChanged = { [weak view] value in
            view?.backgroundColor =  updateBackGroundColor(sliderRed: self.sliderRed, sliderGreen: self.sliderGreen, sliderBlue: self.sliderBlue)
        }
        
        sliderGreen.valueChanged = { [weak view] value in
            view?.backgroundColor =  updateBackGroundColor(sliderRed: self.sliderRed, sliderGreen: self.sliderGreen, sliderBlue: self.sliderBlue)
        }
    }
    
    
    func displayChangesRGB(_ viewModel: Model.PressChangeApplyColor.ViewModel) {
        guard let textField = self.textField
        else { return }
        
        guard let text = textField.text, (!text.isEmpty && isValidFormat(text: textField.text!)) else {
            textField.text = Constants.emptyString
            textField.placeholder = Constants.textFieldError
            return
        }
        guard let color = UIColor(hex: text) else { return}
        view?.backgroundColor = color
        interactor.loadPressCloseRGB(Model.PressCloseButton.Request())
    }
    
    func displayViewAfterHide(_ viewModel: Model.PressCloseButton.ViewModel) {
        guard let textField = textField,
              let button = button,
              let closeButton = closeButton else {
            return
        }
        textField.resignFirstResponder()
        UIView.animate(withDuration: Constants.durationOfAnimation) {
            textField.alpha = Constants.buttonHiddenAlfaOn
            button.alpha = Constants.buttonHiddenAlfaOn
            closeButton.alpha = Constants.buttonHiddenAlfaOn
        } completion: { _ in
            textField.removeFromSuperview()
            button.removeFromSuperview()
            closeButton.removeFromSuperview()
        }
        self.textField = nil
        self.button = nil
        self.closeButton = nil
    }
    
    func displayWishStoringViewController(_ viewModel: Model.PressShowStoringViewController.ViewModel) {
        present(WishStoringViewController(), animated: true)
    }
    
    
    private func isValidFormat(text: String) -> Bool {
        return text.range(of: Constants.pattern, options: .regularExpression) != nil
    }
    
    
}

