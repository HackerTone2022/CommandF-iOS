import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa
import Service

class OnboardingViewController: BaseViewController {
    private let titleLabel = UILabel().then {
        $0.numberOfLines = 4
        $0.font = .systemFont(ofSize: 28, weight: .bold)
        $0.text = "Let's\nCommute\n&\nFlexTime"
    }
    private let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "Bag")
        $0.contentMode = .scaleAspectFit
    }
    private let adminStartButton = UIButton(type: .system).then {
        $0.backgroundColor = .setRGB(red: 255, green: 218, blue: 85, alpha: 100)
        $0.setTitle("Admin으로 시작하기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.layer.cornerRadius = 8
    }
    private let userStartButton = UIButton(type: .system).then {
        $0.backgroundColor = .setRGB(red: 255, green: 238, blue: 177, alpha: 100)
        $0.setTitle("User으로 시작하기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.layer.cornerRadius = 8
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        adminStartButton.rx.tap
            .subscribe(onNext: {
                self.navigationController?.pushViewController(AdminLoginViewController(), animated: true)
            })
            .disposed(by: disposeBag)
        userStartButton.rx.tap
            .subscribe(onNext: {
                self.navigationController?.pushViewController(UserSigninViewController(), animated: true)
            })
            .disposed(by: disposeBag)
    }
    override func addSubviews() {
        [titleLabel, logoImageView, adminStartButton, userStartButton]
            .forEach { view.addSubview($0) }
    }
    override func makeSubviewConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).offset(50)
            $0.leading.equalToSuperview().inset(25)
        }
        logoImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(350)
            $0.trailing.equalToSuperview().offset(100)
        }
        adminStartButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(52)
            $0.bottom.equalTo(userStartButton.snp.top).offset(-14)
        }
        userStartButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.height.equalTo(52)
            $0.bottom.equalToSuperview().inset(64)
        }
    }
}
