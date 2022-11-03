import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class UserWorkTypeViewController: BaseViewController {

    private let button = UIButton(type: .system).then {
        $0.setTitle("근무형태", for: .normal)
        $0.backgroundColor = .setRGB(red: 253, green: 226, blue: 131, alpha: 100)
        $0.layer.cornerRadius = 8
        $0.tintColor = .black
    }
    let menu = UIMenu(title: "", children: [
        UIAction(title: "재택근무") { _ in },
        UIAction(title: "회사출근") { _ in }
    ])
    let attandanceBtn = UIButton(type: .system).then {
        $0.backgroundColor = .setRGB(red: 255, green: 218, blue: 85, alpha: 100)
        $0.setTitle("출근 하러가기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 8
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
    }
    override func addSubviews() {
        [button,
         attandanceBtn
        ].forEach { self.view.addSubview($0) }
    }
    override func makeSubviewConstraints() {
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(100)
            $0.width.equalTo(130)
            $0.height.equalTo(35)
        }
        attandanceBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(42)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(50)
        }
    }

    private func setText(_ title: String) {
        button.setTitle(title, for: .normal)
    }
    private func setButton() {
        self.button.menu = menu
        self.button.showsMenuAsPrimaryAction = true
    }
}
