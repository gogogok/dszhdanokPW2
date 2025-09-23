//
//  enumConstants.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 22.09.25.
//

import UIKit

enum Constants {
    
    static let constahtForHEX: Double = 255.0
    static let alphaFullValue: CGFloat = 1
    static let formatForHex: String = "#%06X"
    
    static let shiftRed: Int = 16
    static let shiftGreen: Int = 16
    
    static let backGroundName: String = "MyBackgroundColor"
    static let titleLabelName: String = "WishMaker"
    
    static let descriptionLabelText: String = "This app will make your dreams come true. Now you will see it with your own eyes\n My first wish is to change the background of this app!\n\n (Just use the sliders!!)\n Also you have another three options to\n change color:"
    
    static let sliderMin: Double = 0
    static let sliderMax: Double = 1.0
    static let red: String = "Red"
    static let green: String = "Green"
    static let blue: String = "Blue"
    static let stackRadius: CGFloat = 10
    static let stackBottom: CGFloat = 250
    static let stackLeading: CGFloat = 20
    static let viewBottom: CGFloat = 20
    
    static let fontSizeTitle: CGFloat = 32
    
    static let descriptionFont: CGFloat = 20
    static let descriptionNumberOfLines = 0
    static let descriptionLeading: CGFloat = 20
    
    static let titleViewTop: CGFloat = 20
    static let titleViewLeading: CGFloat = 20
    static let sliderBottom: CGFloat = 35
    static let aliderLeding: CGFloat = 20
    static let currentValueTop: CGFloat = 20
    static let currentValueFont: CGFloat = 10
    
    static let hideButtonText: String = "Hide sliders"
    static let showButtonText: String = "Show sliders"
    
    static let buttomHideTop: CGFloat = -50
    static let buttomHideWidth: CGFloat = 250
    static let buttomHideCornerRadius: CGFloat = 5
    
    static let durationOfAnimation: CGFloat = 0.5
    static let buttonHiddenAlfaOn: CGFloat = 0
    static let buttonHiddenAlfaOff: CGFloat = 1
    
    static let fatalErrorText: String = "init(coder:) has not been implemented"
    
    static let stackOfButtonsTop: CGFloat = 20
    
    static let stackSpacing: CGFloat = 15
    static let randomButtonLable :String =  "Random Background Color"
    
    static let hexButtonLable :String = "Enter HEX Code"
    
    static let stackNumberOfLines: Int = 0
    static let stackButtonLeft: CGFloat = 10
    static let stackButtonRight: CGFloat = -10
    
    static let stackButtonWidth: CGFloat = 100
    static let stackButtonHeight: CGFloat = 60
    static let buttonCreationFont: CGFloat = 14
    
    static let textFieldText: String = "Enter HEX code"
    static let textApply: String = "Apply"
    static let textClose: String = "Close"
    
    static let textrLeding: CGFloat = 20
    static let textrTrailing: CGFloat = -20
    static let textValueTop: CGFloat = 20
    static let textValueFont: CGFloat = 10
    static let textValueRight: CGFloat = -20
    static let textValueWidth: CGFloat = 350
    static let buttonValueWidth: CGFloat = 170
    
    static let closeButtonLeft: CGFloat = 10
    static let closeButtonRight: CGFloat = -20
    
    static let emptyString: String = ""
    static let textFieldError: String = "Текст не введен или неверное значение HEX "
    
    static let pattern = "^#[0-9A-Fa-f]{0,6}$"
}

