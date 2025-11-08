//
//  WrittenWishCell.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 6.11.25.
//

import UIKit

final class WrittenWishCell: UITableViewCell {
    
    static let reuseId: String = "WrittenWishCell"
    
    private enum Constants {
        static let wrapColor: UIColor = .white
        static let wrapRadius: CGFloat = 16
        static let wrapOffsetV: CGFloat = 5
        static let wrapOffsetH: CGFloat = 10
        static let wishLabelOffset: CGFloat = 8
        static let error: String = " init(coder:) has not been implemented"
        
        static let editButtonLeft: CGFloat = 20
        static let editButtonText: String = "Edit"
        
        static let deleteButtonLeft: CGFloat = 10
        static let deleteButtonText: String = "Delete"
        
        static let buttonWidth: CGFloat = 80
        static let buttonOffsetH: CGFloat = 20
        
        static let buttonRadius: CGFloat = 16
        
        static let labelWidth: CGFloat = 150
        static let labelRadius: CGFloat = 16
        
        
    }
    
    private let wishLabel: UILabel = UILabel()
    private let deleteWishButton: UIButton = UIButton(type: .system)
    private let editWishButton: UIButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.error)
    }
    
    func configure(with wish: String) {
        wishLabel.text = wish
    }
    
    private func configureUI() {
        
        wishLabel.backgroundColor = .white
        wishLabel.layer.cornerRadius = Constants.labelRadius
        wishLabel.clipsToBounds = true
        wishLabel.textAlignment = .center
        
        editWishButton.backgroundColor = .systemGray2
        editWishButton.tintColor = .black
        editWishButton.layer.cornerRadius = Constants.buttonRadius
        editWishButton.setTitle(Constants.editButtonText, for: .normal)

        editWishButton.changeWidth(Constants.buttonWidth)
        
        deleteWishButton.backgroundColor = .systemGray2
        deleteWishButton.layer.cornerRadius = Constants.buttonRadius
        deleteWishButton.setTitle(Constants.deleteButtonText, for: .normal)
        deleteWishButton.tintColor = .black
        deleteWishButton.changeWidth(Constants.buttonWidth)
        
        
        selectionStyle = .none
        backgroundColor = .clear
        let wrap: UIView = UIView()
        contentView.addSubview(wrap)
        wrap.backgroundColor = Constants.wrapColor
        wrap.layer.cornerRadius = Constants.wrapRadius
        wrap.pinVertical(to: contentView, Constants.wrapOffsetV)
        wrap.pinLeft(to: contentView, Constants.wrapOffsetH)
        wrap.pinRight(to: contentView, Constants.wrapOffsetH) 
        
        wrap.addSubview(wishLabel)
        wrap.addSubview(editWishButton)
        wrap.addSubview(deleteWishButton)
        
        editWishButton.pinLeft(to: wishLabel.trailingAnchor, Constants.editButtonLeft)
        editWishButton.pinVertical(to: wishLabel, Constants.buttonOffsetH)
        deleteWishButton.pinVertical(to: wishLabel, Constants.buttonOffsetH)
        deleteWishButton.pinLeft(to: editWishButton.trailingAnchor, Constants.deleteButtonLeft)
        deleteWishButton.pinRight(to: wrap, Constants.wrapOffsetH)
        
        wishLabel.pinLeft(to: wrap, Constants.wishLabelOffset)
        wishLabel.changeWidth(Constants.labelWidth)
        wishLabel.pinTop(to: wrap.topAnchor, Constants.wishLabelOffset)
        wishLabel.pinBottom(to: wrap.bottomAnchor, Constants.wishLabelOffset)
        wishLabel.numberOfLines = 0
        wishLabel.lineBreakMode = .byWordWrapping
    }
    
    func deleteButtonAddTarget(_ target: Any?, action: Selector) {
        deleteWishButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func editButtonAddTarget(_ target: Any?, action: Selector) {
        editWishButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    
}
