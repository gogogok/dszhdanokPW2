//
//  ClickerProtocols.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 5.11.25.
//

import UIKit

protocol ClickerBusinessLogic{
    typealias Model = ClickerModel
    func loadStart(_ request: Model.Start.Request)
    func loadPressHideSlider(_ request: Model.PressHideSlider.Request)
    func loadPressChangeRandom(_ request: Model.PressChangeRandomColor.Request)
    func loadPressChangeRGB(_ request: Model.PressChooseRGB.Request)
    func loadPressChangeApply(_ request: Model.PressChangeApplyColor.Request)
    func loadPressCloseRGB(_ request: Model.PressCloseButton.Request)
    func loadChangeSlider(_ request: Model.PressChangeSlider.Request, slider: CustomSlider)
    
}

protocol ClickerPresentationLogic {
    typealias Model = ClickerModel
    func presentStart(_ response: Model.Start.Response)
    func presentPressHideSlider(_ response: Model.PressHideSlider.Response)
    func presentPressRandomColor(_ response: Model.PressChangeRandomColor.Response)
    func presentPressRGBChange(_ response: Model.PressChooseRGB.Response)
    func presentPressApplyRGB(_ response: Model.PressChangeApplyColor.Response)
    func presentPressCloseRGB(_ response: Model.PressCloseButton.Response)
    func presentChangeSlider(_ response: Model.PressChangeSlider.Response, slider: CustomSlider)
    
}

