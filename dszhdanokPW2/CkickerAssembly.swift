//
//  CkickerAssembly.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 5.11.25.
//

import UIKit

enum ClickerAssembly {
    static func build() -> UIViewController {
        let presenter: ClickerPresenter = ClickerPresenter()
        let interactor: ClickerInteractor = ClickerInteractor(presenter: presenter)
        let viewController: WishMakerViewController = WishMakerViewController(
            interactor: interactor
        )

        presenter.view = viewController

        return viewController
    }
}
