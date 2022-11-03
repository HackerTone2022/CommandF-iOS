import UIKit

import Charts
import SnapKit
import Then

class ChartView: UIView {
    private let lineChartView = LineChartView()

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews()
        setCharts()
    }

    public func setWeekCharts(
        stepCounts: [Double]
    ) {
        let today = Date()
        var dataEntries: [ChartDataEntry] = []

        for index in 0..<stepCounts.count {
           let value = ChartDataEntry(x: Double(index), y: stepCounts[index])
            dataEntries.append(value)
        }

        for data in 0..<stepCounts.count {
            let dataEntry = ChartDataEntry(x: Double(data), y: Double(stepCounts[data]))
        }

        let line1 = LineChartDataSet(entries: dataEntries, label: "Number")
        line1.colors = [NSUIColor.blue]

        let data = LineChartData(dataSets: [line1])
        lineChartView.data = data
    }

}

extension ChartView {
    private func addSubviews() {
        self.addSubview(lineChartView)

        lineChartView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    private func setCharts() {
        lineChartView.xAxis.drawAxisLineEnabled = false
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.xAxis.enabled = false
        lineChartView.leftAxis.enabled = false
        lineChartView.doubleTapToZoomEnabled = false
        lineChartView.rightAxis.enabled = false

        lineChartView.legend.enabled = false
    }
}
