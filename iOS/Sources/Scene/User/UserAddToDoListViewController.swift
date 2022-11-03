import UIKit

import SnapKit
import Then

class UserAddToDoListViewController: BaseViewController {

    private let toDoLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.text = "ToDo"
    }
    private let toDoTextField = UITextField().then {
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.setRGB(red: 255, green: 218, blue: 85, alpha: 100).cgColor
        $0.placeholder = "할 일 입력"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func setNavigation() {
        self.navigationItem.title = "ToDo"
    }
    override func addSubivews() {
        [toDoLabel,
         toDoTextField
        ].forEach { view.addSubview($0) }
    }
    override func makeSubviewConstraints() {
        toDoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.equalToSuperview().inset(26)
        }
        toDoTextField.snp.makeConstraints {
            $0.top.equalTo(toDoLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(48)
        }
    }
}
