import UIKit

import SnapKit
import Then

class AdminAddToDoViewController: BaseViewController {

    private let toDoLabel = UILabel().then {
        $0.text = "ToDo"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    private let toDoTextField = UITextField().then {
        $0.placeholder = "할 일 입력"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = UIColor.setRGB(red: 255, green: 218, blue: 85, alpha: 100).cgColor
        $0.layer.borderWidth = 1
        $0.addLeftPadding()
    }
    private let timeLabel = UILabel().then {
        $0.text = "Time"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    private let timeTextField = UITextField().then {
        $0.placeholder = "시간 입력"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = UIColor.setRGB(red: 255, green: 218, blue: 85, alpha: 100).cgColor
        $0.layer.borderWidth = 1
        $0.addLeftPadding()
    }
    private let contentLabel = UILabel().then {
        $0.text = "Content"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    private let contentTextView = UITextView().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = UIColor.setRGB(red: 255, green: 218, blue: 85, alpha: 100).cgColor
        $0.layer.borderWidth = 1
    }
    private let addButton = UIButton(type: .system).then {
        $0.setTitle("추가하기", for: .normal)
        $0.backgroundColor = .setRGB(red: 255, green: 218, blue: 85, alpha: 100)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 8
    }

    override func addSubivews() {
        [toDoLabel, toDoTextField, timeLabel, timeTextField,
         contentLabel, contentTextView, addButton].forEach { view.addSubview($0) }
    }
    override func makeSubviewConstraints() {
        toDoLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).offset(35)
            $0.leading.equalToSuperview().inset(26)
        }
        toDoTextField.snp.makeConstraints {
            $0.top.equalTo(toDoLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(48)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(toDoTextField.snp.bottom).offset(23)
            $0.leading.equalTo(toDoLabel.snp.leading)
        }
        timeTextField.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(48)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(timeTextField.snp.bottom).offset(23)
            $0.leading.equalTo(toDoLabel.snp.leading)
        }
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(300)
        }
        addButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(42)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(50)
        }
    }
}
