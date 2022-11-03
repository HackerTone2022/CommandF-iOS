import UIKit

import SnapKit
import Then

class UserHomeTableViewCell: UITableViewCell {

    static let identifier = "UserHomeTableViewCell"

    let noticeImgView = UIImageView().then {
        $0.tintColor = .black
    }
    let contentLabel = UILabel().then {
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
        makeSubviewsConstraint()
        self.backgroundColor = .setRGB(red: 246, green: 246, blue: 246, alpha: 100)
        self.contentView.layer.cornerRadius = 8
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
