import UIKit

extension UIColor {
    static func setRGB(
        red: CGFloat,
        green: CGFloat,
        blue: CGFloat,
        alpha: CGFloat
    ) -> UIColor {
        return UIColor(
            red: red/255,
            green: green/255,
            blue: blue/255,
            alpha: alpha/100
        )
    }
}
