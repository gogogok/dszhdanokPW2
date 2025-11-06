//
//  ClickerInteractor.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 5.11.25.
//

import UIKit

final class ClickerInteractor: ClickerBusinessLogic {
    // MARK: - Fields
    private let presenter: ClickerPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: ClickerPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - BusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        presenter.presentStart(Model.Start.Response())
    }
    
    func loadPressHideSlider(_ request: Model.PressHideSlider.Request) {
        presenter.presentPressHideSlider(Model.PressHideSlider.Response())
    }
    
    func loadPressChangeRandom(_ request: Model.PressChangeRandomColor.Request) {
        presenter.presentPressRandomColor(Model.PressChangeRandomColor.Response())
    }
    
    func loadPressChangeRGB(_ request: Model.PressChooseRGB.Request) {
        presenter.presentPressRGBChange(Model.PressChooseRGB.Response())
    }
    
    func loadPressChangeApply(_ request: Model.PressChangeApplyColor.Request) {
        presenter.presentPressApplyRGB(Model.PressChangeApplyColor.Response())
    }
    
    func loadPressCloseRGB(_ request: Model.PressCloseButton.Request) {
        presenter.presentPressCloseRGB(Model.PressCloseButton.Response())
    }
    
    func loadChangeSlider(_ request: Model.PressChangeSlider.Request, slider: CustomSlider) {
        presenter.presentChangeSlider(Model.PressChangeSlider.Response(), slider: slider)
    }
    
    func loadWishStoring(_ request: Model.PressShowStoringViewController.Request) {
        presenter.presentWishStoring(Model.PressShowStoringViewController.Response())
    }
}
