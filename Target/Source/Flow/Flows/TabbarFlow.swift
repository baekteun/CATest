import RxFlow

final class TabbarFlow: Flow{
    // MARK: - TabIndex
    enum TabIndex: Int{
        case beerList = 0
        case beerIDSearch = 1
        case randomBeer = 2
    }
    
    // MARK: - Properties
    var root: Presentable{
        return self.rootVC
    }
    
    @Inject private var beerListFlow: BeerListFlow
    @Inject private var beerSearchFlow: BeerSearchFlow
    @Inject private var randomBeerFlow: RandomBeerFlow
    
    private let rootVC: UITabBarController = .init()
    
    // MARK: - deinit
    deinit{
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asCAStep else { return .none }
        
        switch step{
        case .mainTabbarIsRequired:
            return coordinateToTabbar()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension TabbarFlow{
    func coordinateToTabbar() -> FlowContributors{
        Flows.use(
            beerListFlow, beerSearchFlow, randomBeerFlow,
            when: .created
        ) { [unowned self] (root1: UINavigationController,
                            root2: UINavigationController,
                            root3: UINavigationController) in
            let beerListImage = UIImage(systemName: "1.circle")
            let beerSearchImage = UIImage(systemName: "2.circle")
            let randomBeerImage = UIImage(systemName: "3.circle")
            
            let beerListItem = UITabBarItem(title: "List", image: beerListImage, tag: 0)
            let beerSearchItem = UITabBarItem(title: "Search", image: beerSearchImage, tag: 1)
            let randomBeerItem = UITabBarItem(title: "Random", image: randomBeerImage, tag: 2)
            
            root1.tabBarItem = beerListItem
            root2.tabBarItem = beerSearchItem
            root3.tabBarItem = randomBeerItem
            
            self.rootVC.setViewControllers([root1, root2, root3], animated: true)
        }
        
        return .multiple(flowContributors: [
            .contribute(withNextPresentable: beerListFlow, withNextStepper: beerListFlow.stepper),
            .contribute(withNextPresentable: beerSearchFlow, withNextStepper: beerSearchFlow.stepper),
            .contribute(withNextPresentable: randomBeerFlow, withNextStepper: randomBeerFlow.stepper)
        ])
    }
}
