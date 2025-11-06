//
//  ClickerPresenter.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 5.11.25.
//

import UIKit

final class ClickerPresenter: ClickerPresentationLogic {
    // MARK: - Constants
    private enum Constants {

    }

    weak var view: WishMakerViewController?

    // MARK: - PresentationLogic
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel())
    }
    
    func presentPressHideSlider(_ response: Model.PressHideSlider.Response) {
        view?.displayHideSliders(Model.PressHideSlider.ViewModel())
    }
    
    func presentPressRandomColor(_ response: Model.PressChangeRandomColor.Response) {
        view?.displayPressRandom(Model.PressChangeRandomColor.ViewModel())
    }
    
    func presentPressRGBChange(_ response: Model.PressChooseRGB.Response) {
        view?.displayPressHEXButton(Model.PressChooseRGB.ViewModel())
    }
    
    func presentPressApplyRGB(_ response: Model.PressChangeApplyColor.Response) {
        view?.displayChangesRGB(Model.PressChangeApplyColor.ViewModel())
    }
    
    func presentPressCloseRGB(_ response: Model.PressCloseButton.Response){
        view?.displayViewAfterHide(Model.PressCloseButton.ViewModel())
    }
    
    func presentChangeSlider(_ response: Model.PressChangeSlider.Response, slider: CustomSlider) {
        view?.displaySliderChange(Model.PressChangeSlider.ViewModel(), slider: slider)
    }
    
    func presentWishStoring(_ response: Model.PressShowStoringViewController.Response) {
        view?.displayWishStoringViewController(Model.PressShowStoringViewController.ViewModel())
    }
}
