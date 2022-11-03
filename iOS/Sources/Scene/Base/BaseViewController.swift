import UIKit

import RxSwift
import RxCocoa

class BaseViewController: UIViewController {
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .setRGB(red: 246, green: 246, blue: 246, alpha: 100)
        setNavigation()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubivews()
        makeSubviewConstraints()
    }

    func addSubivews() { }
    func makeSubviewConstraints() { }
    func bind() { }
    func setNavigation() { }
}
