//
//  ClickerModel.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 5.11.25.
//

import UIKit

enum ClickerModel {
    
    enum Start {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum PressHideSlider {
        struct Request { }
        struct Response {}
        struct ViewModel { }
    }
    
    enum PressChangeRandomColor {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum PressChooseRGB {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum PressChangeApplyColor {
        struct Request {}
        struct Response { }
        struct ViewModel { }
    }
    
    enum PressCloseButton {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum PressChangeSlider {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum PressShowStoringViewController {
        struct Request { }
        struct Response { }
        struct ViewModel { }
    }
    
    enum PressAddNewWish {
        struct Request { let text: String }
        struct Response { let text: String }
        struct ViewModel { let text: String }
    }
    
    enum PressDeleteWish {
        struct Request { let text: String }
        struct Response { let text: String }
        struct ViewModel { let text: String }
    }
    
    enum PressEditWish {
        struct Request { let cell: WrittenWishCell}
        struct Response { let cell: WrittenWishCell }
        struct ViewModel {let cell: WrittenWishCell}
    }
    
    enum PressEnterFinishEditWish {
        struct Request {
            let cell: WrittenWishCell
            let index: IndexPath
        }
        struct Response {
            let cell: WrittenWishCell
            let index: IndexPath
        }
        struct ViewModel {
            let cell: WrittenWishCell
            let index: IndexPath
        }
    }
}
