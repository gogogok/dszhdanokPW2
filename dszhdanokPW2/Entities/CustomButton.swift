//
//  CustomButton.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 23.09.25.
//

import UIKit

public final class CustomButton : UIButton {
    
    private enum Constants {
        static let fatalErrorText: String = "init(coder:) has not been implemented"
        static let buttomHideCornerRadius: CGFloat = 10
    }
    
    var sliderStackView = UIStackView()
    
    init(title: String, stack: UIStackView, mainView: UIView) {
        super.init(frame: .zero)
        sliderStackView = stack
        self.setTitle(title, for: .normal)
        configureUI(view: mainView)
    }
    
    private func configureUI(view: UIView) {
        self.backgroundColor = getRandomHEXColor()
        self.layer.cornerRadius = Constants.buttomHideCornerRadius
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalErrorText)
    }
}
