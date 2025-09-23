//
//  colorChangindMethods.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 21.09.25.
//

import UIKit

public func getRandomHEXColor() -> UIColor {
    var result = UIColor()
    let random = Int.random(in: 0...0xFFFFFF) //шеснадцатиричная запись числа
    let hex_string = String(format: "#%06X", random) //# - первая #,  % - спецификатор формата, 0 - заполнит недостоющие места нулями, 6 - количество символов, Х - шеснадцатиричный формат заглавными буквами
    if let color = UIColor(hex: hex_string) {
        result = color
    }
    return result
}

public func updateBackGroundColor(sliderRed : CustomSlider, sliderGreen : CustomSlider, sliderBlue : CustomSlider) -> UIColor {
    let r = CGFloat(sliderRed.slider.value)
    let g = CGFloat(sliderGreen.slider.value)
    let b = CGFloat(sliderBlue.slider.value)
        
    return UIColor(red: r, green: g, blue: b, alpha: 1)
}

public func getRandomColor() -> UIColor {
    let color = UIColor(
        displayP3Red: .random(in: 0...1),
        green: .random(in: 0...1),
        blue: .random(in: 0...1),
        alpha: 1
        )
    return color
}
