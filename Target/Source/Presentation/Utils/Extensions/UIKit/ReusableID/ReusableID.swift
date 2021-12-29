import UIKit

protocol ReusableIdentifiable{
    static var ReusableID: String { get }
}

extension ReusableIdentifiable{
    static var ReusableID: String{
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableIdentifiable {}
extension UICollectionViewCell: ReusableIdentifiable {}
