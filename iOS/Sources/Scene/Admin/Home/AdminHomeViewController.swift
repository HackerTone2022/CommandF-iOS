import UIKit

import SnapKit
import Then

class AdminHomeViewController: BaseViewController {

    private let addStaffViewController = AddStaffViewController()
    private let infoView = UIView().then {
        $0.backgroundColor = .setRGB(red: 255, green: 238, blue: 177, alpha: 100)
        $0.layer.cornerRadius = 25
    }
    private let allStaffAverageWorkingTimeLabel = UILabel().then {
        $0.text = "전직원 주 평균 근무 시간"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    private let weekToAverageAttendanceLabel = UILabel().then {
        $0.text = "주 평균 출근 시간 : "
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    private let weekToAverageAttendanceTimeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let weekToAverageLeaveWorkLabel = UILabel().then {
        $0.text = "주 평균 퇴근 시간 : "
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    private let weekToAverageLeaveWorkTimeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let weekToAverageWorkLabel = UILabel().then {
        $0.text = "주 평균 근무 시간 : "
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    private let weekToAverageWorkTimeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let weekToAllWorkLabel = UILabel().then {
        $0.text = "주 총 근무 시간 : "
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    private let weekToAllWorkTimeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let staffInfoLabel = UILabel().then {
        $0.text = "직원 정보"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    private let staffAddButton = UIButton(type: .system).then {
        $0.setImage(.init(systemName: "plus"), for: .normal)
        $0.tintColor = .black
    }
    private let staffInfoTableView = UITableView().then {
        $0.register(AdminStaffInfoTableViewCell.self, forCellReuseIdentifier: "cell")
        $0.separatorStyle = .none
        $0.rowHeight = 95
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setButton()
    }
    override func addSubivews() {
        [infoView, staffInfoLabel, staffAddButton, staffInfoTableView]
            .forEach { view.addSubview($0) }
        [allStaffAverageWorkingTimeLabel, weekToAverageAttendanceLabel,
        weekToAverageAttendanceTimeLabel, weekToAverageLeaveWorkLabel,
        weekToAverageLeaveWorkTimeLabel, weekToAverageWorkLabel,
        weekToAverageWorkTimeLabel, weekToAllWorkLabel,
         weekToAllWorkTimeLabel].forEach { infoView.addSubview($0) }
    }
    // swiftlint:disable function_body_length
    override func makeSubviewConstraints() {
        infoView.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).inset(30)
            $0.leading.trailing.equalToSuperview().inset(21)
        }
        allStaffAverageWorkingTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(29)
            $0.centerX.equalToSuperview()
        }
        weekToAverageAttendanceLabel.snp.makeConstraints {
            $0.top.equalTo(allStaffAverageWorkingTimeLabel.snp.bottom).offset(23)
            $0.leading.equalToSuperview().inset(57)
        }
        weekToAverageAttendanceTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(weekToAverageAttendanceLabel)
            $0.leading.equalTo(weekToAverageAttendanceLabel.snp.trailing).offset(10)
        }
        weekToAverageLeaveWorkLabel.snp.makeConstraints {
            $0.top.equalTo(weekToAverageAttendanceLabel.snp.bottom).offset(20)
            $0.leading.equalTo(weekToAverageAttendanceLabel.snp.leading)
        }
        weekToAverageLeaveWorkTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(weekToAverageAttendanceLabel)
            $0.leading.equalTo(weekToAverageAttendanceLabel.snp.trailing).offset(10)
        }
        weekToAverageWorkLabel.snp.makeConstraints {
            $0.top.equalTo(weekToAverageLeaveWorkLabel.snp.bottom).offset(20)
            $0.leading.equalTo(weekToAverageLeaveWorkLabel.snp.leading)
        }
        weekToAverageWorkTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(weekToAverageWorkLabel)
            $0.leading.equalTo(weekToAverageWorkLabel.snp.trailing).offset(10)
        }
        weekToAllWorkLabel.snp.makeConstraints {
            $0.top.equalTo(weekToAverageWorkLabel.snp.bottom).offset(20)
            $0.leading.equalTo(weekToAverageWorkLabel.snp.leading)
            $0.bottom.equalToSuperview().inset(24)
        }
        weekToAllWorkTimeLabel.snp.makeConstraints {
            $0.centerY.equalTo(weekToAllWorkLabel)
            $0.leading.equalTo(weekToAllWorkLabel.snp.trailing).offset(10)
        }
        staffInfoLabel.snp.makeConstraints {
            $0.top.equalTo(infoView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(23)
        }
        staffAddButton.snp.makeConstraints {
            $0.centerY.equalTo(staffInfoLabel)
            $0.trailing.equalToSuperview().inset(23)
            $0.height.width.equalTo(23)
        }
        staffInfoTableView.snp.makeConstraints {
            $0.top.equalTo(staffInfoLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(14)
            $0.bottom.equalToSuperview()
        }
    }

    private func setButton() {
        staffAddButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.presentModal()
            }).disposed(by: disposeBag)
    }
    private func presentModal() {
        addStaffViewController.modalPresentationStyle = .pageSheet

        if let sheet = addStaffViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 41
        }
        self.present(addStaffViewController, animated: true)
    }
}

extension AdminHomeViewController: UITableViewDelegate, UITableViewDataSource {
    private func setTableView() {
        staffInfoTableView.dataSource = self
        staffInfoTableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as? AdminStaffInfoTableViewCell else { return UITableViewCell() }
        cell.profileImageView.image = .init(systemName: "person")
        cell.nameLabel.text = "김시안"
        cell.timeLabel.text = "08:00 ~ 05:00"
        cell.stateLabel.text = "퇴근중"
        cell.stateLabel.backgroundColor = .setRGB(red: 255, green: 218, blue: 85, alpha: 100)

        return cell
    }
}
