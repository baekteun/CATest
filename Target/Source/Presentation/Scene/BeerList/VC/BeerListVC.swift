import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa
import RxViewController
import RxDataSources

final class BeerListVC: baseVC<BeerListReactor>{
    // MARK: - Properties
    private let tableView = UITableView().then {
        $0.register(BeerListTableViewCell.self, forCellReuseIdentifier: BeerListTableViewCell.ReusableID)
        $0.refreshControl = UIRefreshControl()
        $0.rowHeight = 110.5
    }
    
    
    
    // MARK: - UI
    override func addView() {
        [tableView].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        tableView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalToSuperview()
        }
    }
    override func configureVC() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "BeerList"
        self.navigationItem.accessibilityLabel = "BeerList"
    }
    
    // MARK: - Reactor
    override func bindAction(reactor: BeerListReactor) {
        self.rx.viewDidLoad
            .map { _ in Reactor.Action.viewDidLoad }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    override func bindView(reactor: BeerListReactor) {
        tableView.rx.reachedBottom(offset: 120)
            .map { _ in Reactor.Action.fetchMoreBeer }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
            
        tableView.refreshControl?.rx.controlEvent(.valueChanged)
            .map { _ in Reactor.Action.refreshTrigger }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    override func bindState(reactor: BeerListReactor) {
        let sharedState = reactor.state.share(replay: 1).observe(on: MainScheduler.asyncInstance)
        
        let datasource = RxTableViewSectionedReloadDataSource<BeerListSection> { _, tv, ip, item in
            guard let cell = tv.dequeueReusableCell(withIdentifier: BeerListTableViewCell.ReusableID, for: ip) as? BeerListTableViewCell else { return .init() }
            cell.model = item
            return cell
        }
        
        sharedState
            .map { [BeerListSection(header: "", items: $0.beers)] }
            .bind(to: tableView.rx.items(dataSource: datasource))
            .disposed(by: disposeBag)
    }
}
