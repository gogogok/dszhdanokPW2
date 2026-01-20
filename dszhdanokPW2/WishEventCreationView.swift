//
//  WishEventCreationView.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 19.01.26.
//

import UIKit

final class WishEventCreationView : UIViewController {
    
    // MARK: - Fields
    typealias Model = ClickerModel
    private let interactor: ClickerBusinessLogic
    
    private let initialTitle: String?
    
    private var addEventButton = NewEventConfiguration.buttonToAddEvent
    private var backGroundColor: UIColor = .white
    
    // MARK: - Constants
    
    private enum Constants {
        static let numberOfSections : Int = 2
        static let fatalError: String = "init(coder:) has not been implemented"
        static let wishesKey = "userWishes"
        
        static let buttonOffset: CGFloat = 30
        static let buttonWidth: CGFloat = 100
        static let buttonRadius: CGFloat = 12
        static let fontSize: CGFloat = 16
    }
    
    // MARK: - LifeCycle
    init(
        interactor: ClickerBusinessLogic, backGroundColor: UIColor, initialTitle: String? = nil
    ) {
        self.interactor = interactor
        self.initialTitle = initialTitle
        self.backGroundColor = backGroundColor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }
    
    // MARK: - view load
    override func viewDidLoad() {
        configureUI()
        NewEventConfiguration.descriptionField.delegate = self
        addEventButton.addTarget(self, action: #selector(addEventButtonTapped), for: .touchUpInside)
        
        if let initialTitle, !initialTitle.isEmpty {
            NewEventConfiguration.titleField.text = initialTitle
        }
    }
    
    
    //MARK: - configure func
    private func configureUI() {
        view.backgroundColor = backGroundColor
        NewEventConfiguration.configure(in: view)
    }
    
    //MARK: - Target func
    @objc
    private func addEventButtonTapped() {
        guard
            let title = NewEventConfiguration.titleField.text, !title.isEmpty,
            let description = NewEventConfiguration.descriptionField.text,
            let startDate = NewEventConfiguration.startDateField.text,
            let endDate = NewEventConfiguration.endDateField.text,
            let event = convertToWishEvent(
                title: title,
                description: description,
                startDate: startDate,
                endDate: endDate
            )
        else {
            showErrorAlert(message: "All fields should be filled")
            return
        }
        
        interactor.loadAddEvent(
            ClickerModel.AddEventToCalendar.Request(event: event)
        )
    }
    
    
    
    //MARK: - Action func
    public func addNewEvent(_ vm: Model.AddEventToCalendar.ViewModel) {
        NewEventConfiguration.clear()
        NotificationCenter.default.post(name: .eventsDidChange, object: nil)
        dismiss(animated: true)
    }
    
    //MARK: - Help func
    private func convertToWishEvent(title: String, description: String, startDate: String, endDate: String) -> WishEventModel {
        let dateStart = Date(timeIntervalSince1970: TimeInterval(startDate)!)
        let dateEnd = Date(timeIntervalSince1970: TimeInterval(endDate)!)
        
        return WishEventModel(title: title, description: description, startDate: dateStart, endDate: dateEnd)
    }
    
    private func convertToWishEvent(title: String, description: String, startDate: String, endDate: String
    ) -> WishEventModel? {
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = .current
        formatter.dateFormat = "yyyy-MM-dd"
        
        guard
            let dateStart = formatter.date(from: startDate),
            let dateEnd = formatter.date(from: endDate)
        else {
            showErrorAlert(message: "Invalid date format")
            return nil
        }
        
        return WishEventModel(
            title: title,
            description: description,
            startDate: dateStart,
            endDate: dateEnd
        )
    }
    
    private func showErrorAlert( title: String = "Error", message: String
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(
            UIAlertAction(title: "Ok", style: .default)
        )
        
        present(alert, animated: true)
    }
    
}


extension WishEventCreationView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .secondaryLabel {
            textView.text = ""
            textView.textColor = .label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Description"
            textView.textColor = .secondaryLabel
        }
    }
    
}

