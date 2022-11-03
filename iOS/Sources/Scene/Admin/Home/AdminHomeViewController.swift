import UIKit

import SnapKit
import Then
import RxSwift
import RxCocoa

class AdminHomeViewController: BaseViewController {

    private var isSuccess = false
    private let viewModel = AdminHomeViewModel()
    private let addStaffViewController = AddStaffViewController()
    private var color: [UIColor] = [.red, .orange, .yellow, .green, .blue]
    private var name = ["김기영", "김시안", "홍승재", "박주영", "조병진"]
    private var time = ["08:00 ~ 17:00", "09:00 ~ 18:00", "08:30 ~ 17:30", "08:55 ~", "09:23 ~"]
    private var state = ["퇴근", "퇴근", "퇴근", "근무 중", "근무 중"]
    private let getList = PublishRelay<Void>()
    private let moveDetail = PublishRelay<IndexPath>()
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
        setDemoData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getList.accept(())
    }
    override func bind() {
        let input = AdminHomeViewModel.Input(
            getList: getList.asDriver(onErrorJustReturn: ()),
            index: staffInfoTableView.rx.itemSelected.asDriver(),
            id: addStaffViewController.staffIdTextField.rx.text.orEmpty.asDriver(),
            name: addStaffViewController.passwordTextField.rx.text.orEmpty.asDriver(),
            password: addStaffViewController.passwordTextField.rx.text.orEmpty.asDriver(),
            onTap: addStaffViewController.addButton.rx.tap.asDriver()
        )

        let output = viewModel.transform(input)

        output.userList.bind(to: staffInfoTableView.rx.items(
            cellIdentifier: "cell",
            cellType: AdminStaffInfoTableViewCell.self
        )) { _, items, cell in
            cell.nameLabel.text = items.name
            cell.profileImageView.image = UIImage(data: items.profileImage)
            cell.stateLabel.text = items.state.rawValue
            cell.timeLabel.text = "\(items.startAt?.timeToString()) ~ \(items.dateAt?.timeToString())"
        }
        .disposed(by: disposeBag)

        output.id
            .subscribe(onNext: {
                let viewController = StaffDetailViewController()
                viewController.id = $0
                self.navigationController?.pushViewController(viewController, animated: true)
            }).disposed(by: disposeBag)

        output.isSuccess
            .subscribe(onNext: {
                self.addStaffViewController.isDismiss.accept($0)
            })
            .disposed(by: disposeBag)
    }
    override func addSubviews() {
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
            $0.centerY.equalTo(weekToAverageLeaveWorkLabel)
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
            $0.leading.equalTo(weekToAverageWorkTimeLabel.snp.leading)
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
    override func setNavigation() {
        super.setNavigation()
        self.title = "홈"
    }

    private func setDemoData() {
        self.weekToAverageAttendanceTimeLabel.text = "08:04"
        self.weekToAverageLeaveWorkTimeLabel.text = "17:05"
        self.weekToAverageWorkTimeLabel.text = "8시간 30분"
        self.weekToAllWorkTimeLabel.text = "42시간"
    }
    private func setButton() {
        staffAddButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.presentModal()
            }).disposed(by: disposeBag)
        addStaffViewController.addButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.dismiss(animated: true)
                self?.name.append("김준호")
                self?.color.append(.purple)
                self?.state.append("출근전")
                self?.time.append("")
                self?.staffInfoTableView.reloadData()
            })
            .disposed(by: disposeBag)
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
        staffInfoTableView.rx.itemSelected
            .subscribe(onNext: {_ in
                self.navigationController?.pushViewController(StaffDetailViewController(), animated: true)
            }).disposed(by: disposeBag)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as? AdminStaffInfoTableViewCell else { return UITableViewCell() }
        cell.profileImageView.backgroundColor = color[indexPath.row]
        cell.nameLabel.text = name[indexPath.row]
        cell.timeLabel.text = time[indexPath.row]
        cell.stateLabel.text = state[indexPath.row]
        cell.stateLabel.backgroundColor = .setRGB(red: 255, green: 218, blue: 85, alpha: 100)

        return cell
    }
}
