//
//  UIColor_random_extension.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 21.09.25.
//

import UIKit

extension UIColor {
    
    convenience init?(hex: String) { //опциональный инициализатор
        let hex_sanitised = hex.replacingOccurrences(of: "#", with: "")
        var srgb : UInt64 = 0
        guard Scanner(string: hex_sanitised).scanHexInt64(&srgb) else {return nil} //чтение HEX числа из строки
        let r = CGFloat((srgb & 0xFF0000) >> Constants.shiftRed) / Constants.constahtForHEX //битовый сдвиг, чтобы остались только биты красного
        let g = CGFloat((srgb & 0x00FF00) >> Constants.shiftGreen) / Constants.constahtForHEX //аналогично
        let b = CGFloat(srgb & 0x0000FF) / Constants.constahtForHEX //аналогично
        
        self.init(red: r, green: g, blue: b, alpha: Constants.alphaFullValue) //передаём в инициализатор результаты
    }
    
}
