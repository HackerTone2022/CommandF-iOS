import UIKit

import SnapKit
import Then

class AdminStaffInfoTableViewCell: UITableViewCell {

    let profileImageView = UIImageView().then {
        $0.contentMode = .scaleToFill
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 32
    }
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    let stateLabel = UILabel().then {
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 10, weight: .regular)
    }
    let timeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews()
        makeSubviewConstraints()
        setContentView()
    }

    private func setContentView() {
        self.layer.masksToBounds = true
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = .init(width: 0, height: 5)
        contentView.layer.shadowOpacity = 0.1
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
}

// MARK: - LAyout
extension AdminStaffInfoTableViewCell {
    private func addSubviews() {
        [profileImageView, nameLabel, stateLabel, timeLabel]
            .forEach { contentView.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        profileImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(9)
            $0.leading.equalToSuperview().inset(9)
            $0.height.width.equalTo(63)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(13)
        }
        stateLabel.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(11)
            $0.width.equalTo(45)
            $0.height.equalTo(20)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.leading.equalTo(nameLabel.snp.leading)
        }
    }
}
