import RxFlow
import RxRelay

struct BeerListStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return CAStep.beerListIsRequired
    }
}

final class BeerListFlow: Flow{
    // MARK: - Properties
    
    @Inject private var vc: BeerListVC
    @Inject private var reactor: BeerListReactor
    var root: Presentable{
        return self.rootVC
    }
    
    @Inject var stepper: BeerListStepper
    private let rootVC = UINavigationController()
    
    // MARK: - Init
    
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asCAStep else { return .none }
        
        switch step{
        case .beerListIsRequired:
            return coordinateToBeerList()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension BeerListFlow{
    func coordinateToBeerList() -> FlowContributors{
        self.rootVC.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: reactor))
    }
}
