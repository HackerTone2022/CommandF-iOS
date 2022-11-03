import UIKit

import SnapKit
import Then

class UserEditProfileViewController: BaseViewController {

    private let profileImageView = UIImageView().then {
        $0.image = UIImage(systemName: "person.crop.circle")
        $0.tintColor = .black
    }
    private let completeBtn = UIButton(type: .system).then {
        $0.backgroundColor = .setRGB(red: 255, green: 218, blue: 85, alpha: 100)
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 8
    }
    private let editProfileButton = UIButton(type: .system).then {
        $0.backgroundColor = .setRGB(red: 255, green: 238, blue: 177, alpha: 100)
        $0.setTitle("프로필 사진 수정", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 8
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func setNavigation() {
        self.navigationItem.title = "프로필 수정"
    }
    override func addSubviews() {
        [profileImageView,
         completeBtn,
         editProfileButton
        ].forEach { self.view.addSubview($0) }
    }
    override func makeSubviewConstraints() {
        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(150)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(175)
        }
        editProfileButton.snp.makeConstraints {
            $0.width.equalTo(110)
            $0.height.equalTo(25)
            $0.centerX.equalTo(profileImageView)
            $0.top.equalTo(profileImageView.snp.bottom).offset(17)
        }
        completeBtn.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(42)
        }
    }
}
