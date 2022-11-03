import UIKit

import SnapKit
import Then

class StaffDetailCollectionViewCell: UICollectionViewCell {
    let dateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13, weight: .regular)
    }
    let attendanceLabel = UILabel().then {
        $0.text = "출근 -"
        $0.font = .systemFont(ofSize: 10, weight: .semibold)
    }
    let attendanceTimeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .regular)
    }
    let workingLabel = UILabel().then {
        $0.text = "근무 시간 -"
        $0.font = .systemFont(ofSize: 10, weight: .semibold)
    }
    let workingTimeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .regular)
    }
    let leaveHomeLabel = UILabel().then {
        $0.text = "퇴근 -"
        $0.font = .systemFont(ofSize: 10, weight: .semibold)
    }
    let leaveHomeTimeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .regular)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews()
        makeSubviewConstraints()
        self.layer.masksToBounds = true
        setContentView()
    }

    private func setContentView() {
        contentView.backgroundColor = .setRGB(red: 255, green: 238, blue: 177, alpha: 100)
        contentView.layer.cornerRadius = 20
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = .init(width: 4, height: 4)
        contentView.layer.shadowOpacity = 0.2
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 5))
    }
}

extension StaffDetailCollectionViewCell {
    private func addSubviews() {
        [dateLabel, attendanceLabel, attendanceTimeLabel,
        workingLabel, workingTimeLabel, leaveHomeLabel, leaveHomeTimeLabel]
            .forEach { contentView.addSubview($0) }
    }
    private func makeSubviewConstraints() {
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(10)
        }
        attendanceLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(10)
        }
        attendanceTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(attendanceLabel)
            $0.leading.equalTo(attendanceLabel.snp.trailing).offset(2)
        }
        workingLabel.snp.makeConstraints {
            $0.top.equalTo(attendanceLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(10)
        }
        workingTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(workingLabel)
            $0.leading.equalTo(workingLabel.snp.trailing).offset(2)
        }
        leaveHomeLabel.snp.makeConstraints {
            $0.top.equalTo(workingLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(10)
        }
        leaveHomeTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(leaveHomeLabel)
            $0.leading.equalTo(leaveHomeLabel.snp.trailing).offset(2)
        }
    }
}
