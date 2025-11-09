//
//  AddWishCell.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 6.11.25.
//

import UIKit

final class AddWishCell: UITableViewCell {
    
    //MARK: - Fields
    
    static let reuseId: String = "AddWishCell"
    public var buttonToAddWish: UIButton = UIButton(type: .system)
    public var textView: UITextView = UITextView()
    
    //MARK: - Сallback-property
    var addWish: ((String) -> Void)?
    
    
    //MARK: - Constants
    private enum Constants {
        static let wrapColor: UIColor = .white
        static let wrapRadius: CGFloat = 16
        static let wrapOffsetV: CGFloat = 20
        static let wrapOffsetH: CGFloat = 10
        static let wishLabelOffset: CGFloat = 8
        static let error: String = " init(coder:) has not been implemented"
        
        static let tableCornerRadius: CGFloat = 5
        static let tableOffset: CGFloat = 20
        static let buttonTitle : String = "New wish"
        
        static let corner: CGFloat = 10
        static let fontSize: CGFloat = 16
        
        static let textHeight: CGFloat = 70
        static let buttonHeight: CGFloat = 30
        
        static let top: CGFloat = 12
        static let left: CGFloat = 12
        static let right: CGFloat = 12
        static let bottom: CGFloat = 12
        
        static let widthDiff: CGFloat = 15
        
        static let heightWrap: CGFloat = 140
        
        static let buttonWidth: CGFloat = 120
        
        static let borderWidth: CGFloat = 1
    }
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.error)
    }
    
    
    //MARK: - Add target for button
    func bindAddTarget(_ target: Any?, action: Selector) {
        buttonToAddWish.addTarget(target, action: action, for: .touchUpInside)
    }
    
    //MARK: - configure func
    
    private func configureWishGetText(in view: UIView) {
        buttonToAddWish.setTitle(Constants.buttonTitle, for: .normal)
        buttonToAddWish.setTitleColor(.white, for: .normal)
        buttonToAddWish.backgroundColor = .black
        buttonToAddWish.titleLabel?.font = .boldSystemFont(ofSize: Constants.fontSize)
        buttonToAddWish.layer.cornerRadius = Constants.corner
        
        textView.backgroundColor = .white
        textView.isEditable = true
        textView.layer.borderWidth = Constants.borderWidth
        textView.layer.cornerRadius = Constants.corner
        textView.layer.borderColor = UIColor.systemGray4.cgColor
        textView.font = .systemFont(ofSize: Constants.fontSize)
        textView.textColor = .secondaryLabel
        
        view.addSubview(textView)
        view.addSubview(buttonToAddWish)
        
        textView.pinTop(to: view.topAnchor, Constants.top)
        textView.pinLeft(to: view.leadingAnchor, Constants.left)
        textView.pinRight(to: view.trailingAnchor, Constants.right)
        textView.changeHeight(Constants.textHeight)
        
        
        buttonToAddWish.pinTop(to: textView.bottomAnchor,  Constants.top)
        buttonToAddWish.pinRight(to: textView.trailingAnchor)
        buttonToAddWish.pinBottom(to: view.bottomAnchor, Constants.bottom)
        buttonToAddWish.changeWidth(Constants.buttonWidth)
    }
    
    private func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
        let wrap: UIView = UIView()
        contentView.addSubview(wrap)
        wrap.backgroundColor = Constants.wrapColor
        wrap.layer.cornerRadius = Constants.wrapRadius
        wrap.pinVertical(to: contentView, Constants.wrapOffsetV)
        wrap.pinHorizontal(to: contentView, Constants.wrapOffsetH)
        configureWishGetText(in: wrap)
    }
    
    //MARK: - get properties func
    
    public func getText() -> String? {
        return textView.text
    }
    
}
