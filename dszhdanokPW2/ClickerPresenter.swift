//
//  ClickerPresenter.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 5.11.25.
//

import UIKit

final class ClickerPresenter: ClickerPresentationLogic {
   
    // MARK: - views
    
    weak var view: WishMakerViewController?
    weak var secondView: WishStoringViewController?
    
    // MARK: - first view PresentationLogic
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
    
    // MARK: - second view PresentationLogic
    
    func presentAddWish(_ resp: ClickerModel.PressAddNewWish.Response) {
        let vm = ClickerModel.PressAddNewWish.ViewModel(text: resp.text)
        self.secondView?.displayAddWishToArray(vm)
        
    }
    
    func presentDeleteWish(_ resp: Model.PressDeleteWish.Response) {
        self.secondView?.displayDeleteWish(Model.PressDeleteWish.ViewModel(text: resp.text))
    }
    
    func presentEditWish(_ resp: ClickerModel.PressEditWish.Response) {
        self.secondView?.displayEditedWish(Model.PressEditWish.ViewModel(cell: resp.cell))
    }
    
    func presentEditFinishWish(_ resp: Model.PressEnterFinishEditWish.Response) {
        self.secondView?.displayFinishEditingWish(Model.PressEnterFinishEditWish.ViewModel(cell: resp.cell, index: resp.index))
    }
    
    func presentFetched(_ resp: ClickerModel.FetchAll.Response) {
        let texts = resp.wishes.map { $0.text ?? "" }
        self.secondView?.displayFetched(Model.FetchAll.ViewModel(texts: texts))
    }
    
    func presentShare(_ resp: Model.ShareWishes.Response) {
        self.secondView?.shareWishes(Model.ShareWishes.ViewModel(fileURL: resp.fileURL))
    }
}
