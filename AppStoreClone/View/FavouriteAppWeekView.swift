import UIKit

class FavouriteAppWeekView: UIView, ClippableView {
    
    var isClipped: Bool = false
    
    @IBOutlet private var favouriteAppWeekTableView: FavouriteAppWeekTableView!
    
    
    func clip() {
        isClipped = false
        favouriteAppWeekTableView.isClipped = true
    }
}
