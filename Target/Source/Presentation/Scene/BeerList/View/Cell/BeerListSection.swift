import RxDataSources

struct BeerListSection{
    let header: String
    var items: [Beer]
}

extension BeerListSection: SectionModelType{
    init(original: BeerListSection, items: [Beer]) {
        self = original
        self.items = items
    }
}

