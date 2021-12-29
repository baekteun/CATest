import UIKit
import Then
import SnapKit

final class BeerListVC: baseVC<BeerListReactor>{
    // MARK: - Properties
    private let tableView = UITableView().then {
        $0.register(BeerListTableViewCell.self, forCellReuseIdentifier: BeerListTableViewCell.ReusableID)
    }
    
    
}
