//
//  WishCalendarViewController.swift
//  dszhdanokPW2
//
//  Created by Дарья Жданок on 19.01.26.
//

import UIKit

final class WishCalendarViewController: UIViewController {
    
    // MARK: - Constsnts
    private enum Constants {
        
        static let fatalError: String = "Error"
        
        static let contentInset : UIEdgeInsets = .init(top: 16, left: 16, bottom: 16, right: 16)
        static let collectionTop: CGFloat = 5
        static let collectionBottom: CGFloat = 10
        
        static let addButtonTitle: String = " + "
        static let chooseButtonTitle: String = "  Choose existed wish!  "
        static let buttonCornerRadius: CGFloat = 10
        static let buttonLeftRight: CGFloat = 40
        static let buttonBotton: CGFloat = 5
        static let burronBorderWidth: CGFloat = 1
        static let stackSpace: CGFloat = 5
    }
    
    // MARK: - Fields
    private let collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    private var stackButtons =  UIStackView()
    private var addButton = UIButton()
    private var chooseButton = UIButton()
    
    private var eventArray: [Event] = []
    private var wishes: [String] = []
    private let worker = EventWorker()
    
    private let interactor: ClickerBusinessLogic
    
    // MARK: - LifeCycle
    init(
        interactor: ClickerBusinessLogic
    ) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadFetchAllForCalendar(ClickerModel.FetchAll.Request())
        view.backgroundColor = .systemBackground
        title = "Wish Calendar"
        configureStackButtons()
        configureCollection()
        
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        chooseButton.addTarget(self, action: #selector(chooseButtonTapped), for: .touchUpInside)
        
        reloadEvents()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onEventsDidChange),
            name: .eventsDidChange,
            object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Configuration
    private func configureCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = Constants.contentInset
        
        /* Temporary line */
        collectionView.register(
            WishEventCell.self,
            forCellWithReuseIdentifier: WishEventCell.reuseIdentifier
        )
        
        view.addSubview(collectionView)
        collectionView.pinHorizontal(to: view)
        collectionView.pinBottom(to: addButton.topAnchor, Constants.collectionBottom)
        collectionView.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.collectionTop)
    }
    
    private func configureStackButtons() {
        stackButtons.axis = .horizontal
        view.addSubview(stackButtons)
        for button in [addButton, chooseButton] {
            stackButtons.addArrangedSubview(button)
        }
        
        stackButtons.spacing = Constants.stackSpace
        
        addButton.setTitle(Constants.addButtonTitle, for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.layer.cornerRadius = Constants.buttonCornerRadius
        addButton.layer.borderWidth = Constants.burronBorderWidth
        addButton.layer.borderColor = UIColor.black.cgColor
        
        chooseButton.setTitle(Constants.chooseButtonTitle, for: .normal)
        chooseButton.setTitleColor(.black, for: .normal)
        chooseButton.layer.cornerRadius = Constants.buttonCornerRadius
        chooseButton.layer.borderWidth = Constants.burronBorderWidth
        chooseButton.layer.borderColor = UIColor.black.cgColor
        
        stackButtons.pinHorizontal(to: view, Constants.buttonLeftRight)
        stackButtons.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constants.buttonBotton)
    }
    
    
    //MARK: - for targets
    
    @objc private func onEventsDidChange() {
        reloadEvents()
    }
    
    @objc
    private func addButtonTapped() {
        let third = WishEventCreationView(interactor: interactor)
        (interactor as? ClickerInteractor)?.attachThirdView(third)
        present(third, animated: true)
    }
    
    @objc
    private func chooseButtonTapped() {
        guard !wishes.isEmpty else { return }
        
        let alert = UIAlertController(title: "Choose a wish",
                                      message: nil,
                                      preferredStyle: .actionSheet)
        
        for wish in wishes {
                alert.addAction(UIAlertAction(title: wish, style: .default, handler: { [weak self, weak alert] _ in
                    guard let self else { return }
                    alert?.dismiss(animated: true) {
                        self.openCreationWith(title: wish)
                    }
                }))
            }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
    
    private func openCreationWith(title: String) {
        let vc = WishEventCreationView(interactor: interactor, initialTitle: title)
        (interactor as? ClickerInteractor)?.attachThirdView(vc)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}



// MARK: - UICollectionViewDataSource
extension WishCalendarViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return eventArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WishEventCell.reuseIdentifier,
            for: indexPath
        )
        
        guard let wishCell = cell as? WishEventCell else { return cell }
        
        let event = eventArray[indexPath.item]
        wishCell.configure(with: convertToWishEvent(event: event))
        
        return wishCell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension WishCalendarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        // Adjust cell size as needed
        return CGSize(width: collectionView.bounds.width - 10, height: 140)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print("Cell tapped at index \(indexPath.item)")
    }
    
    
    //MARK: - Help func
    private func convertToWishEvent(event: Event) -> WishEventModel {
        
        return WishEventModel(
            title: event.title ?? "No name",
            description: event.eventDescription ?? "No description",
            startDate: event.startDate ?? Date(),
            endDate: event.endDate ?? Date()
        )
    }
    
    private func reloadEvents() {
        eventArray = worker.fetchAll()
        collectionView.reloadData()
    }
    
    public func displayFetched(_ vm: ClickerModel.FetchAll.ViewModel)
    {
        wishes = vm.texts
    }
}
