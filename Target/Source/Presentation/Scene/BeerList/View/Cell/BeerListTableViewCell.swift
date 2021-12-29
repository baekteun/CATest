import UIKit
import Then
import SnapKit
import Kingfisher

final class BeerListTableViewCell: BaseTableViewCell<Beer>{
    // MARK: - Properties
    private let beerImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.snp.makeConstraints {
            $0.width.height.equalTo(100)
        }
    }
    
    private let beerIDLabel = UILabel().then {
        $0.text = "ID"
        $0.textColor = .orange
        $0.font = .systemFont(ofSize: UIFont.smallSystemFontSize)
    }
    
    private let beerNameLabel = UILabel().then {
        $0.text = "name"
        $0.textColor = .black
    }
    
    private let beerDescription = UILabel().then {
        $0.text = "description"
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    private let labelStack = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 2
    }
    
    private let cellStack = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
    }
    
    // MARK: - UI
    override func addView() {
        labelStack.addArrangeSubviews([beerIDLabel, beerNameLabel, beerDescription])
        cellStack.addArrangeSubviews([beerImageView, labelStack])
        addSubview(cellStack)
    }
    override func setLayout() {
        cellStack.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview().inset(5)
            $0.bottom.equalToSuperview().inset(5).priority(.high)
        }
    }
    override func configureCell() {
        
    }
    override func bind(_ model: Beer) {
        beerIDLabel.text = "\(model.id)"
        beerNameLabel.text = model.name
        beerDescription.text = model.description
        beerImageView.kf.setImage(with: URL(string: model.imageUrl) ?? .none,
                                  placeholder: UIImage(),
                                  options: [.cacheMemoryOnly])
    }
    
}
