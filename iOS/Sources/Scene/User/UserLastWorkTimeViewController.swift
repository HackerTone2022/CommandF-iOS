import UIKit

import SnapKit
import Then

class UserLastWorkTimeViewController: BaseViewController {

    var date = ["2022.10.24", "2022.10.25", "2022.10.26", "2022.10.27", "2022.10.28"]
    private let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .regular)
    }
    private let timeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .regular)
    }
    private let weekWorkTimeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.text = "님의 총 근무시간은"
    }
    private let secondWeekWorkTimeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.text = "시간 입니다."
    }
    private let workTimeTableView = UITableView().then {
        $0.register(UserWeekWorkTimeTableViewCell.self, forCellReuseIdentifier: UserWeekWorkTimeTableViewCell.identifier)
        $0.backgroundColor = .setRGB(red: 246, green: 246, blue: 246, alpha: 100)
        $0.rowHeight = 128
        $0.separatorStyle = .none
    }
    private func demoData() {
        nameLabel.text = "김시안"
        timeLabel.text = "52"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        demoData()
        self.workTimeTableView.delegate = self
        self.workTimeTableView.dataSource = self
    }
    override func setNavigation() {
        self.navigationItem.title = "이전 근무시간 확인"
    }
    override func addSubviews() {
        [nameLabel,
         timeLabel,
         weekWorkTimeLabel,
         secondWeekWorkTimeLabel,
         workTimeTableView
        ].forEach { self.view.addSubview($0) }
    }
    override func makeSubviewConstraints() {
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.equalToSuperview().inset(62)
        }
        weekWorkTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(1)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.equalTo(weekWorkTimeLabel.snp.trailing).offset(2)
        }
        secondWeekWorkTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.equalTo(timeLabel.snp.trailing).offset(1)
        }
        workTimeTableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(160)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
    }
}

extension UserLastWorkTimeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return date.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserWeekWorkTimeTableViewCell", for: indexPath)
                as? UserWeekWorkTimeTableViewCell else { return UITableViewCell() }
        cell.dateLabel.text = date[indexPath.row]
        cell.attandanceTimeLabel.text = "8:00"
        cell.officeHourTimeLabel.text = "04:05:16"
        cell.leaveWorkTimeLabel.text = "17:00"
        return cell
    }
}

extension UserLastWorkTimeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select \(indexPath.row)")
    }
}
