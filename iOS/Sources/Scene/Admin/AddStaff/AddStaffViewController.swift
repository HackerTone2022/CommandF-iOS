import UIKit

class AddStaffViewController: BaseViewController {

    let staffIdTextField = UITextField().then {
        $0.placeholder = "사원번호"
        $0.font = .systemFont(ofSize: 15, weight: .regular)
    }
    let nameTextField = UITextField().then {
        $0.placeholder = "이름"
        $0.font = .systemFont(ofSize: 15, weight: .regular)
    }
    let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.font = .systemFont(ofSize: 15, weight: .regular)
    }
    let addButton = UIButton(type: .system).then {
        $0.setTitle("사원 추가하기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.backgroundColor = .setRGB(red: 255, green: 218, blue: 85, alpha: 100)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 8
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        [staffIdTextField, nameTextField, passwordTextField]
            .forEach {
                $0.text = ""
                $0.layer.addBorder([.bottom], color: .white, width: 1)
            }
    }
    override func addSubivews() {
        [staffIdTextField, nameTextField, passwordTextField, addButton]
            .forEach { view.addSubview($0) }
    }
    override func makeSubviewConstraints() {
        staffIdTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(45)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(28)
        }
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(staffIdTextField.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(28)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(28)
        }
        addButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(52)
        }
    }

    private func setTextField() {
        staffIdTextField.rx.text.orEmpty
            .map { $0.count == 0 }
            .subscribe(onNext: { [weak self] isEmpty in
                self?.staffIdTextField.layer.addBorder(
                    [.bottom],
                    color: isEmpty ? .white : .gray ,
                    width: 1
                )
            }).disposed(by: disposeBag)
        nameTextField.rx.text.orEmpty
            .map { $0.count == 0 }
            .subscribe(onNext: { [weak self] isEmpty in
                self?.nameTextField.layer.addBorder(
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
