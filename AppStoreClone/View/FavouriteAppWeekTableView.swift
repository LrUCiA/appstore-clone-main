import UIKit

@IBDesignable class FavouriteAppWeekTableView: UITableView {
    
    typealias app = (name: String, subtitle: String, icon_name: String)
    
    var isClipped = false
    
    private let cellId = "AppTableCell"
    private let apps: [app] = [
        ("Apple Music", "9천0백만 곡의 음악을\n광고 없이 즐기세요.", "AppleMusic"),
        ("홈", "라이프 스타일", "Home"),
        ("단축어", "앱으로 더욱 다양한\n일을 해보세요", "Shortcuts"),
        ("주식", "금융", "Stocks"),
        ("Apple TV", "Apple TV+를 만날 수 있는 곳", "AppleTV"),
        ("나의 찾기", "유틸리티", "FindMy"),
        ("메모", "무엇이든 메모할 수 있습니다.", "Notes"),
        ("FaceTime", "소셜 네트워킹", "FaceTime")
    ]
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    private func setup() {
        let bundle = Bundle(for: type(of: self))
        let cellNib = UINib(nibName: cellId, bundle: bundle)
        register(cellNib, forCellReuseIdentifier: cellId)
        
        dataSource = self
        delegate = self
    }
}

extension FavouriteAppWeekTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isClipped ? 4 : apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: cellId) as! AppTableCell
        let app = apps[indexPath.row]
        let icon = app.icon_name + "Icon"
        cell.setup(icon: icon, name: app.name, subtitle: app.subtitle)
        let endIndex = tableView.numberOfRows(inSection: indexPath.section) - 1
        if indexPath.row == endIndex {
            cell.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width, bottom: 0, right: 0)
        }
        return cell
    }
}
