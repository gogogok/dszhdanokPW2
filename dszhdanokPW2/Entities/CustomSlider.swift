//
//  CustomSlider.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 21.09.25.
//

import UIKit

public final class CustomSlider : UIView {
    public var valueChanged: ((Double) -> Void)?
    
    var slider = UISlider()
    var titleView = UILabel()
    public var currentValueLabel = UILabel()
    
    private enum Constants {
        static let titleViewTop: CGFloat = 20
        static let titleViewLeading: CGFloat = 20
        static let sliderBottom: CGFloat = 35
        static let aliderLeding: CGFloat = 20
        static let currentValueTop: CGFloat = 20
        static let currentValueFont: CGFloat = 10
        static let fatalErrorText: String = "init(coder:) has not been implemented"
    }
    
    
    init(title: String, min: Double, max: Double) {
        super.init(frame: .zero)
        titleView.text = title
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        configureUI()
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalErrorText)
    }
    
    private func configureUI() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        for view in [slider, titleView, currentValueLabel] {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        titleView.pinCenterX(to: centerXAnchor)
        titleView.pinTop(to: topAnchor, Constants.titleViewTop)
        titleView.pinLeft(to: leadingAnchor, Constants.titleViewLeading)
        
        slider.pinTop(to: titleView.bottomAnchor)
        slider.pinCenterX(to: centerXAnchor)
        slider.pinBottom(to: bottomAnchor, Constants.sliderBottom)
        slider.pinLeft(to: leadingAnchor, Constants.currentValueTop)
        
        currentValueLabel.pinTop(to: slider.topAnchor, Constants.currentValueTop)
        currentValueLabel.font = UIFont.systemFont(ofSize: Constants.currentValueFont)
        
        
    }

}
