import UIKit

import SnapKit
import Then

class UserHomeTableViewCell: UITableViewCell {

    static let identifier = "UserHomeTableViewCell"

    private let noticeImgView = UIImageView().then {
        $0.image = UIImage(systemName: "bell.badge")
        $0.tintColor = .black
    }
    private let contentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.text = "인사팀 회의 - \(Date())"
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
        makeSubviewsConstraint()
        self.backgroundColor = .setRGB(red: 246, green: 246, blue: 246, alpha: 100)
        self.contentView.layer.cornerRadius = 8
        self.contentView.backgroundColor = .setRGB(red: 255, green: 238, blue: 177, alpha: 100)
        contentView.frame = contentView.frame.inset(
            by: UIEdgeInsets(top: 13, left: 0, bottom: 0, right: 0)
        )
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.layer.shadowOpacity = 0.1
        self.contentView.layer.shadowOffset = .init(width: 0, height: 5)
    }

    private func addSubviews() {
        [noticeImgView,
         contentLabel
        ].forEach { self.contentView.addSubview($0) }
    }
    private func makeSubviewsConstraint() {
        noticeImgView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(12)
            $0.width.height.equalTo(25)
        }
        contentLabel.snp.makeConstraints {
            $0.centerY.equalTo(noticeImgView)
            $0.leading.equalTo(noticeImgView.snp.trailing).offset(20)
        }
    }
}
