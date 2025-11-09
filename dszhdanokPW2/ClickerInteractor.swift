//
//  ClickerInteractor.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 5.11.25.
//

import UIKit

final class ClickerInteractor: ClickerBusinessLogic {
    // MARK: - Fields
    private var presenter: ClickerPresentationLogic
    
    private let worker = WishWorker()
    
    private var wishes: [Wish] = []
    
    // MARK: - Lifecycle
    init(presenter: ClickerPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - first view BusinessLogic
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
    
    // MARK: - second view BusinessLogic
    
    func loadAddWish(_ req: Model.PressAddNewWish.Request) {
        let w = worker.add(text: req.text)
        wishes.append(w)
        presenter.presentAddWish(Model.PressAddNewWish.Response(text: req.text))
    }
    
    func loadDeleteWish(_ req: Model.PressDeleteWish.Request) {
        guard let idx = wishes.firstIndex(where: { $0.text == req.text }) else { return }
        let w = wishes.remove(at: idx)
        worker.delete(w)
        presenter.presentDeleteWish(Model.PressDeleteWish.Response(text: req.text))
    }
    
    func loadEditWish(_ req: Model.PressEditWish.Request) {
        presenter.presentEditWish(Model.PressEditWish.Response(cell: req.cell))
    }
    
    func loadFinishEditWish(_ req: Model.PressEnterFinishEditWish.Request) {
        let row = req.index.row
        guard wishes.indices.contains(row) else { return }
        let wish = wishes[row]

        let newText = (req.cell.getTextFieldText() ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        let finalText = newText.isEmpty ? (req.cell.getTextLabelText() ?? "") : newText

        worker.update(wish, newText: finalText)

        wishes[row].text = finalText
        
        
        presenter.presentEditFinishWish(Model.PressEnterFinishEditWish.Response(cell: req.cell, index: req.index))
    }
    
    func loadFetchAll(_ req: ClickerModel.FetchAll.Request) {
        let fetched = worker.fetchAll()
        self.wishes = fetched
        presenter.presentFetched(Model.FetchAll.Response(wishes: fetched))
    }
    
    func loadShareWishes(_ req: ClickerModel.ShareWishes.Request) {
        Persistence.shared.container.viewContext.refreshAllObjects()
        
        guard let url = worker.exportJSON() else { return }
        presenter.presentShare(Model.ShareWishes.Response(fileURL: url))
    }
    
    //MARK: - set second view
    
    func attachSecondView(_ view: WishStoringViewController) {
        presenter.secondView = view
    }
    
    func detachSecondView() {
        presenter.secondView = nil
    }
    
}
