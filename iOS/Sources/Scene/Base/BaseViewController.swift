import UIKit

import RxSwift
import RxCocoa

class BaseViewController: UIViewController {
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubivews()
        makeSubviewConstraints()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    func addSubivews() { }
    func makeSubviewConstraints() { }
    func bind() { }
}
