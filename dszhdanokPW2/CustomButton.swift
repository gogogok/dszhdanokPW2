//
//  CustomButton.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 23.09.25.
//

import UIKit

public final class CustomButton : UIButton {
    
    var sliderStackView = UIStackView()
    
    init(title: String, stack: UIStackView) {
        super.init(frame: .zero)
        sliderStackView = stack
        self.setTitle(title, for: .normal)
        self.addTarget(self, action:  #selector(ActionButton), for: .touchUpInside)
        self.backgroundColor = getUniqueColor()
        self.layer.cornerRadius = 5
    }
    
    
    @objc private func ActionButton() {
        let willHide = !sliderStackView.isHidden
        self.isEnabled = false
        
        UIView.animate(withDuration: 0.5) {
            if willHide {
                self.sliderStackView.alpha = 0
            } else {
                self.sliderStackView.isHidden = false
                self.sliderStackView.alpha = 1
            }
        } completion: { _ in
            if willHide {
                self.sliderStackView.isHidden = true
            }
            self.setTitle(willHide ? "Show Sliders" : "Hide Sliders", for: .normal)
            self.isEnabled = true
        }
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
