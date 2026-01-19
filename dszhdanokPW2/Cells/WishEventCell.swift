import UIKit

final class WishEventCell : UICollectionViewCell {
    
    // MARK: - Constants
       private enum Constants {
           static let offset: Double = 8
           static let cornerRadius: CGFloat = 12
           static let backgroundColor: UIColor = .systemGray6

           static let titleTop: Double = 12
           static let titleLeading: Double = 12

           static let descriptionTop: Double = 8
           static let labelsLeading: Double = 12
           static let labelsTrailing: Double = 12

           static let datesTop: Double = 10
           static let bottom: Double = 12
       }

    
    // MARK: - Fields
    static let reuseIdentifier: String = "WishEventCell"
    private let wrapView: UIView = UIView()
    private let titleLabel: UILabel = UILabel()
    private let descriptionLabel: UILabel = UILabel()
    private let startDateLabel: UILabel = UILabel()
    private let endDateLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureWrap()
        configureTitleLabel()
        configureDescriptionLabel()
        configureStartDateLabel()
        configureEndDateLabel()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell Configuration
    func configure(with event: WishEventModel) {
        titleLabel.text = event.title
        descriptionLabel.text = event.description
        startDateLabel.text = "Start Date: \(event.startDate)"
        endDateLabel.text = "End Date: \(event.endDate)"
    }
    
    // MARK: - UI Configuration
    private func configureWrap() {
        contentView.addSubview(wrapView)
        wrapView.pin(to: contentView, Constants.offset)
        wrapView.layer.cornerRadius = Constants.cornerRadius
        wrapView.backgroundColor = Constants.backgroundColor
    }

        private func configureTitleLabel() {
            wrapView.addSubview(titleLabel)
            titleLabel.textColor = .label
            titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
            titleLabel.numberOfLines = 1

            titleLabel.pinTop(to: wrapView, Constants.titleTop)
            titleLabel.pinLeft(to: wrapView, Constants.titleLeading)
            titleLabel.pinRight(to: wrapView, Constants.labelsTrailing)
        }

        private func configureDescriptionLabel() {
            wrapView.addSubview(descriptionLabel)
            descriptionLabel.textColor = .secondaryLabel
            descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
            descriptionLabel.numberOfLines = 0

            descriptionLabel.pinTop(to: titleLabel.bottomAnchor, Constants.descriptionTop)
            descriptionLabel.pinLeft(to: wrapView, Constants.labelsLeading)
            descriptionLabel.pinRight(to: wrapView, Constants.labelsTrailing)
        }

        private func configureStartDateLabel() {
            wrapView.addSubview(startDateLabel)
            startDateLabel.textColor = .tertiaryLabel
            startDateLabel.font = .systemFont(ofSize: 12, weight: .medium)
            startDateLabel.numberOfLines = 1

            startDateLabel.pinTop(to: descriptionLabel.bottomAnchor, Constants.datesTop)
            startDateLabel.pinLeft(to: wrapView, Constants.labelsLeading)
            startDateLabel.pinRight(to: wrapView, Constants.labelsTrailing)
        }

        private func configureEndDateLabel() {
            wrapView.addSubview(endDateLabel)
            endDateLabel.textColor = .tertiaryLabel
            endDateLabel.font = .systemFont(ofSize: 12, weight: .medium)
            endDateLabel.numberOfLines = 1

            endDateLabel.pinTop(to: startDateLabel.bottomAnchor, 6)
            endDateLabel.pinLeft(to: wrapView, Constants.labelsLeading)
            endDateLabel.pinRight(to: wrapView, Constants.labelsTrailing)
            endDateLabel.pinBottom(to: wrapView, Constants.bottom, .lsOE)
        }
    
    
}
