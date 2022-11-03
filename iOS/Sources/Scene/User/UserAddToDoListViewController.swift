import UIKit

import SnapKit
import Then

class UserAddToDoListViewController: BaseViewController {

    private let toDoLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.text = "ToDo"
    }
    let toDoTextField = UITextField().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.setRGB(red: 255, green: 218, blue: 85, alpha: 100).cgColor
        $0.placeholder = "할 일 입력"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.addLeftPadding()
    }
    private let timeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.text = "Time"
    }
    let timeTextField = UITextField().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.setRGB(red: 255, green: 218, blue: 85, alpha: 100).cgColor
        $0.placeholder = "시간 입력"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.addLeftPadding()
    }
    let contentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.text = "Content"
    }
    private let contentTextView = UITextView().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.layer.cornerRadius = 8
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.setRGB(red: 255, green: 218, blue: 85, alpha: 100).cgColor
    }
    let addButton = UIButton(type: .system).then {
        $0.backgroundColor = .setRGB(red: 255, green: 218, blue: 85, alpha: 100)
        $0.setTitle("추가하기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 8
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func setNavigation() {
        self.navigationItem.title = "ToDo"
    }
    override func addSubviews() {
        [toDoLabel,
         toDoTextField,
         timeLabel,
         timeTextField,
         contentLabel,
         contentTextView,
         addButton
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
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(toDoTextField.snp.bottom).offset(22)
            $0.leading.equalToSuperview().inset(26)
        }
        timeTextField.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(48)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(timeTextField.snp.bottom).offset(22)
            $0.leading.equalToSuperview().inset(26)
        }
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(300)
        }
        addButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(42)
            $0.height.equalTo(50)
        }
    }
}
