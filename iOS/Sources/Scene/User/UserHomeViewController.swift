import UIKit

import SnapKit
import Then

class UserHomeViewController: BaseViewController {

    private let userAddToDoListViewController = UserAddToDoListViewController()
    private let userWorkTypeViewController = UserWorkTypeViewController()
    private let staffInformationView = UIView().then {
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .white
    }
    private let profileImgView = UIImageView().then {
        $0.tintColor = .black
    }
    private let profileLable = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    private let teamLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    private let workStatesLabel = UILabel().then {
        $0.backgroundColor = .setRGB(red: 255, green: 218, blue: 85, alpha: 100)
        $0.text = "근무중"
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textAlignment = .center
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
    }
    private let attandanceLabel = UILabel().then {
        $0.text = "출근 - "
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let attandanceTimeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let officeHourLabel = UILabel().then {
        $0.text = "근무시간 - "
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let officeHourTimeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let leaveWorkLabel = UILabel().then {
        $0.text = "퇴근 - "
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let leaveWorkTimeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    private let attandanceBtn = UIButton(type: .system).then {
        $0.backgroundColor = .setRGB(red: 255, green: 218, blue: 85, alpha: 100)
        $0.setTitle("출근 하러가기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 8
    }
    private let toDoLabel = UILabel().then {
        $0.text = "ToDo"
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    private let addBtn = UIButton(type: .system).then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .black
    }
    private let toDoTableView = UITableView().then {
           $0.register(UserHomeTableViewCell.self, forCellReuseIdentifier: UserHomeTableViewCell.identifier)
           $0.backgroundColor = .setRGB(red: 246, green: 246, blue: 246, alpha: 100)
           $0.rowHeight = 60
           $0.separatorStyle = .none
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        demoData()
        self.toDoTableView.delegate = self
        self.toDoTableView.dataSource = self
        setButton()
    }
    override func setNavigation() {
        self.navigationItem.title = "홈"
    }
    override func addSubviews() {
        [staffInformationView,
         attandanceBtn,
         toDoLabel,
         addBtn,
         toDoTableView
        ]
            .forEach { view.addSubview($0) }
        [profileImgView,
         profileLable,
         teamLabel,
         workStatesLabel,
         attandanceLabel,
         attandanceTimeLabel,
         officeHourLabel,
         officeHourTimeLabel,
         leaveWorkLabel,
         leaveWorkTimeLabel
        ]
            .forEach {staffInformationView.addSubview($0)}
    }
    override func makeSubviewConstraints() {
        staffInformationView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(120)
        }
        profileImgView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.width.height.equalTo(63)
        }
        profileLable.snp.makeConstraints {
            $0.leading.equalTo(profileImgView.snp.trailing).offset(12)
            $0.top.equalTo(profileImgView)
        }
        teamLabel.snp.makeConstraints {
            $0.top.equalTo(profileLable.snp.bottom).offset(4)
            $0.centerX.equalTo(profileLable)
        }
        workStatesLabel.snp.makeConstraints {
            $0.top.equalTo(teamLabel.snp.bottom).offset(7)
            $0.centerX.equalTo(profileLable)
            $0.width.equalTo(44)
            $0.height.equalTo(20)
        }
        attandanceLabel.snp.makeConstraints {
            $0.top.equalTo(profileLable)
            $0.leading.equalTo(profileLable.snp.trailing).offset(36)
        }
        attandanceTimeLabel.snp.makeConstraints {
            $0.top.equalTo(profileLable)
            $0.leading.equalTo(attandanceLabel.snp.trailing).offset(2)
        }
        officeHourLabel.snp.makeConstraints {
            $0.top.equalTo(teamLabel)
            $0.leading.equalTo(teamLabel.snp.trailing).offset(36)
        }
        officeHourTimeLabel.snp.makeConstraints {
            $0.top.equalTo(teamLabel)
            $0.leading.equalTo(officeHourLabel.snp.trailing).offset(2)
        }
        leaveWorkLabel.snp.makeConstraints {
            $0.top.equalTo(workStatesLabel)
            $0.leading.equalTo(workStatesLabel.snp.trailing).offset(36)
        }
        leaveWorkTimeLabel.snp.makeConstraints {
            $0.top.equalTo(workStatesLabel)
            $0.leading.equalTo(leaveWorkLabel.snp.trailing).offset(2)
        }
        attandanceBtn.snp.makeConstraints {
            $0.top.equalTo(staffInformationView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(50)
        }
        toDoLabel.snp.makeConstraints {
            $0.top.equalTo(attandanceBtn.snp.bottom).offset(50)
            $0.leading.equalToSuperview().inset(20)
        }
        addBtn.snp.makeConstraints {
            $0.centerY.equalTo(toDoLabel)
            $0.trailing.equalToSuperview().inset(20)
        }
        toDoTableView.snp.makeConstraints {
            $0.top.equalTo(toDoLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview()
        }
    }

    private func setButton() {
        addBtn.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.presentModal()
            }).disposed(by: disposeBag)

        attandanceBtn.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.secondPresentModal()
            }).disposed(by: disposeBag)
    }
    private func presentModal() {
        userAddToDoListViewController.modalPresentationStyle = .pageSheet

        if let sheet = userAddToDoListViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 41
        }
        self.present(userAddToDoListViewController, animated: true)
    }
    private func secondPresentModal() {
        userAddToDoListViewController.modalPresentationStyle = .pageSheet

        if let sheet = userWorkTypeViewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 41
        }
        self.present(userWorkTypeViewController, animated: true)
    }
    private func demoData() {
        profileImgView.image = UIImage(systemName: "circle.fill")
        profileLable.text = "김시안"
        teamLabel.text = "인사팀"
        attandanceTimeLabel.text = "8:00"
        officeHourTimeLabel.text = "04:05:16"
    }
}

extension UserHomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserHomeTableViewCell", for: indexPath)
                as? UserHomeTableViewCell else { return UITableViewCell() }
        return cell
    }
}

extension UserHomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select \(indexPath.row)")
    }
}
