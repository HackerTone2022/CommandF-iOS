import UIKit

import SnapKit
import Then

class UserWeekWorkTimeTableViewCell: UITableViewCell {

    static let identifier = "UserWeekWorkTimeTableViewCell"

    let dateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .regular)
    }
    private let attandanceLabel = UILabel().then {
        $0.text = "출근 - "
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    let attandanceTimeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let officeHourLabel = UILabel().then {
        $0.text = "근무시간 - "
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    let officeHourTimeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let leaveWorkLabel = UILabel().then {
        $0.text = "퇴근 - "
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    let leaveWorkTimeLabel = UILabel().then {
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
        self.contentView.backgroundColor = .setRGB(red: 255, green: 238, blue: 177, alpha: 100)
        contentView.frame = contentView.frame.inset(
            by: UIEdgeInsets(top: 13, left: 0, bottom: 0, right: 0)
        )
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.layer.shadowOpacity = 0.1
        self.contentView.layer.shadowOffset = .init(width: 0, height: 5)
    }

    private func addSubviews() {
        [dateLabel,
         attandanceLabel,
         attandanceTimeLabel,
         officeHourLabel,
         officeHourTimeLabel,
         leaveWorkLabel,
         leaveWorkTimeLabel
        ].forEach { self.contentView.addSubview($0) }
    }
    private func makeSubviewsConstraint() {
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.centerX.equalToSuperview()
        }
        attandanceLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(15)
        }
        attandanceTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(attandanceLabel)
            $0.leading.equalTo(attandanceLabel.snp.trailing).inset(3)
        }
        officeHourLabel.snp.makeConstraints {
            $0.top.equalTo(attandanceLabel.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(15)
        }
        officeHourTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(officeHourLabel)
            $0.leading.equalTo(officeHourLabel.snp.trailing).inset(3)
        }
        leaveWorkLabel.snp.makeConstraints {
            $0.top.equalTo(officeHourLabel.snp.bottom).offset(7)
            $0.leading.equalToSuperview().inset(15)
        }
        leaveWorkTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(leaveWorkLabel)
            $0.leading.equalTo(leaveWorkLabel.snp.trailing).inset(3)
        }
    }
}
