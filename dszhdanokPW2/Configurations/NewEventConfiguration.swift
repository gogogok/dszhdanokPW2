//
//  NewEventConfiguration.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 19.01.26.
//

import UIKit

final class NewEventConfiguration {

    private enum Constants {
        static let corner: CGFloat = 10
        static let fontSize: CGFloat = 16
        static let borderWidth: CGFloat = 1

        static let top: Double = 12
        static let side: Double = 12
        static let spacing: CGFloat = 10
        static let descriptionHeight: Double = 200

        static let buttonHeight: Double = 44
        static let fieldHeight: Double = 44

        static let buttonTitle: String = "Create event"
    }

    // MARK: - UI
    public static let titleField = UITextField()
    public static let descriptionField = UITextView()
    public static let startDateField = UITextField()
    public static let endDateField = UITextField()
    public static let buttonToAddEvent = UIButton(type: .system)

    private static let stack = UIStackView()

    public static func configure(in view: UIView) {

        stack.axis = .vertical
        stack.spacing = Constants.spacing
        stack.alignment = .fill
        stack.distribution = .fill

        view.addSubview(stack)

        stack.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.top)
        stack.pinLeft(to: view.leadingAnchor, Constants.side)
        stack.pinRight(to: view.trailingAnchor, Constants.side)

        setupField(titleField, placeholder: "Title")
        setupDescriptionView(descriptionField)
        descriptionField.setHeight(Constants.descriptionHeight)
        setupField(startDateField, placeholder: "Start date (YYYY-MM-DD)")
        setupField(endDateField, placeholder: "End date (YYYY-MM-DD)")

        buttonToAddEvent.setTitle(Constants.buttonTitle, for: .normal)
        buttonToAddEvent.setTitleColor(.white, for: .normal)
        buttonToAddEvent.backgroundColor = .black
        buttonToAddEvent.layer.cornerRadius = Constants.corner
        buttonToAddEvent.titleLabel?.font = .boldSystemFont(ofSize: Constants.fontSize)
        buttonToAddEvent.setHeight(Constants.buttonHeight)

        for f in [titleField, descriptionField, startDateField, endDateField] {
            stack.addArrangedSubview(f)
            if (f == descriptionField) {
                f.setHeight(Constants.descriptionHeight)
                continue
            }
            f.setHeight(Constants.fieldHeight)
        }
        stack.addArrangedSubview(buttonToAddEvent)
    }

    private static func setupField(_ field: UITextField, placeholder: String) {
        field.borderStyle = .none
        field.layer.borderWidth = Constants.borderWidth
        field.layer.borderColor = UIColor.systemGray4.cgColor
        field.layer.cornerRadius = Constants.corner
        field.font = .systemFont(ofSize: Constants.fontSize)
        field.textColor = .label
        field.placeholder = placeholder
        field.backgroundColor = .white
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 1))
        field.leftViewMode = .always
        field.autocorrectionType = .no
        field.autocapitalizationType = .sentences
    }
    
    private static func setupDescriptionView(_ view: UITextView) {
        view.layer.borderWidth = Constants.borderWidth
        view.layer.borderColor = UIColor.systemGray4.cgColor
        view.layer.cornerRadius = Constants.corner

        view.font = .systemFont(ofSize: Constants.fontSize)
        view.textColor = .secondaryLabel
        view.backgroundColor = .white

        view.text = "Description"
        view.isEditable = true
        view.isScrollEnabled = true

        view.textContainerInset = UIEdgeInsets(
            top: 8,
            left: 8,
            bottom: 8,
            right: 8
        )

        view.autocorrectionType = .no
        view.autocapitalizationType = .sentences
    }

    public static func clear() {
        titleField.text = nil
        startDateField.text = nil
        endDateField.text = nil

        descriptionField.text = "Description"
        descriptionField.textColor = .secondaryLabel
    }

}
