import UIKit

import SnapKit
import Then

class StaffDetailViewController: BaseViewController {

    private let profileImageView = UIImageView().then {
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 32
    }
    private let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.minimumInteritemSpacing = 9
            $0.scrollDirection = .horizontal
        }).then {
            $0.register(StaffDetailCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    private let weekToAverageAttendanceButton = UIButton().then {
        $0.setTitle("주 평균 출근 시간 :", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    }
    private let weekToAverageAttendanceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let weekToAverageLeaveHomeButton = UIButton().then {
        $0.setTitle("주 평균 퇴근 시간 :", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    }
    private let weekToAverageLeaveHomeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let weekToAverageWorkingButton = UIButton().then {
        $0.setTitle("주 평균 근무 시간 :", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    }
    private let weekToAverageWorkingLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let weekToAllWorkingButton = UIButton().then {
        $0.setTitle("주 총 근무 시간 :", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    }
    private let weekToAllWorkingLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setDemoData()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    override func addSubviews() {
        [profileImageView, nameLabel, collectionView,
         weekToAverageAttendanceButton, weekToAverageAttendanceLabel,
         weekToAverageLeaveHomeButton, weekToAverageLeaveHomeLabel,
         weekToAverageWorkingButton, weekToAverageWorkingLabel,
         weekToAllWorkingButton, weekToAllWorkingLabel]
            .forEach { view.addSubview($0) }
    }
    override func makeSubviewConstraints() {
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).offset(10)
            $0.leading.equalToSuperview().inset(24)
            $0.height.width.equalTo(64)
        }
        nameLabel.snp.makeConstraints {
            $0.centerY.equalTo(profileImageView)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(13)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(19)
            $0.leading.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(170)
        }
        weekToAverageAttendanceButton.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(24)
        }
        weekToAverageAttendanceLabel.snp.makeConstraints {
            $0.centerY.equalTo(weekToAverageAttendanceButton)
            $0.leading.equalTo(weekToAverageAttendanceButton.snp.trailing).offset(10)
        }
        weekToAverageLeaveHomeButton.snp.makeConstraints {
            $0.top.equalTo(weekToAverageAttendanceButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(24)
        }
        weekToAverageLeaveHomeLabel.snp.makeConstraints {
            $0.centerY.equalTo(weekToAverageLeaveHomeButton)
            $0.leading.equalTo(weekToAverageAttendanceLabel)
        }
        weekToAverageWorkingButton.snp.makeConstraints {
            $0.top.equalTo(weekToAverageLeaveHomeButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(24)
        }
        weekToAverageWorkingLabel.snp.makeConstraints {
            $0.centerY.equalTo(weekToAverageWorkingButton)
            $0.leading.equalTo(weekToAverageAttendanceLabel)
        }
        weekToAllWorkingButton.snp.makeConstraints {
            $0.top.equalTo(weekToAverageWorkingButton.snp.bottom).offset(20)
            $0.centerX.equalTo(weekToAverageWorkingButton)
        }
        weekToAllWorkingLabel.snp.makeConstraints {
            $0.centerY.equalTo(weekToAllWorkingButton)
            $0.leading.equalTo(weekToAverageAttendanceLabel)
        }
    }

    private func setDemoData() {
        self.nameLabel.text = "김기영"
        self.weekToAverageAttendanceLabel.text = "08:04"
        self.weekToAverageLeaveHomeLabel.text = "17:05"
        self.weekToAverageWorkingLabel.text = "8시간 35분"
        self.weekToAllWorkingLabel.text = "49시간"
    }
}

extension StaffDetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath
        ) as? StaffDetailCollectionViewCell else { return UICollectionViewCell() }
        cell.dateLabel.text = "2022.10.28"
        cell.attendanceTimeLabel.text = "8:00"
        cell.workingTimeLabel.text = "04:00.01"
        cell.leaveHomeTimeLabel.text = "17:00"
        return cell
    }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 2
    }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 121, height: 170)
    }
}
