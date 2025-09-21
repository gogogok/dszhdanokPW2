//
//  colorChangindMethods.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 21.09.25.
//

import UIKit

public func getUniqueColor() -> UIColor {
    var result = UIColor()
    let random = Int.random(in: 0...0xFFFFFF) //шеснадцатиричная запись числа
    let hex_string = String(format: "#%06X", random) //# - первая #,  % - спецификатор формата, 0 - заполнит недостоющие места нулями, 6 - количество символов, Х - шеснадцатиричный формат заглавными буквами
    if let color = UIColor(hex: hex_string) {
        result = color
    }
    return result
}

public func updateBackGroundColor(sliderRed : CustomSlider, sliderGreen : CustomSlider, sliderBlue : CustomSlider) -> UIColor {
    let r = CGFloat(sliderRed.slider.value) / 255
    let g = CGFloat(sliderGreen.slider.value) / 255
    let b = CGFloat(sliderBlue.slider.value) / 255
        
    return UIColor(red: r, green: g, blue: b, alpha: 1)
}
