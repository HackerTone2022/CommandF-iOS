import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class AdminLoginViewController: BaseViewController {

    private let titleLabel = UILabel().then {
        $0.text = "정보 입력"
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        $0.layer.addBorder([.bottom], color: .black, width: 1)
    }
    private let idTextField = UITextField().then {
        $0.placeholder = "id"
        $0.font = .systemFont(ofSize: 15, weight: .regular)
    }
    private let passwordTextField = UITextField().then {
        $0.placeholder = "password"
        $0.font = .systemFont(ofSize: 15, weight: .regular)
    }
    private let loginButton = UIButton(type: .system).then {
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .setRGB(red: 255, green: 218, blue: 85, alpha: 100)
        $0.layer.cornerRadius = 8
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
    }
    override func addSubviews() {
        [titleLabel, idTextField, passwordTextField, loginButton]
            .forEach { view.addSubview($0) }
    }
    override func makeSubviewConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).offset(8)
            $0.centerX.equalToSuperview()
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(250)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(28)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(28)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(99)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(52)
        }
    }
    private func setTextField() {
        idTextField.rx.text.orEmpty
            .map { $0.count == 0 }
            .subscribe(onNext: { [weak self] isEmpty in
                self?.idTextField.layer.addBorder(
                    [.bottom],
                    color: isEmpty ? .white : .gray ,
                    width: 1
                )
            }).disposed(by: disposeBag)
        passwordTextField.rx.text.orEmpty
            .map { $0.count == 0 }
            .subscribe(onNext: { [weak self] isEmpty in
                self?.passwordTextField.layer.addBorder(
                    [.bottom],
                    color: isEmpty ? .white : .gray ,
                    width: 1
                )
            }).disposed(by: disposeBag)
    }
}
