import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    var count = 103
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(withTimeInterval:1.0,
                             repeats: true,
                             block: { (timer) in
                                let text = String(format:"%ld", self.count)
                                
                                self.label1.text = text
                                self.label2.text = text
                                self.label3.text = text
                                
                                self.count = self.count - 1
        })

        /* Demo 1 */
        let font1 = UIFont.monospacedDigitSystemFont(
            ofSize: label1.font.pointSize,
            weight: UIFontWeightRegular)
        label1.font = font1

        /* Demo 2 */
        let font2 = UIFont.monospacedDigitSystemFont(
            ofSize: label2.font.pointSize,
            weight: UIFontWeightRegular)
        label2.font = font2
        
        /* Demo 3 */
        var fontSize = label3.font.pointSize
        if (self.traitCollection.horizontalSizeClass == .compact) {
            let fontFactor = CGFloat(120.0/300.0)  // font sizes used in Demo 2
           fontSize *= fontFactor
        }
        let font3 = UIFont.monospacedDigitSystemFont(
            ofSize: fontSize,
            weight: UIFontWeightRegular)
        label3.font = font3
    }
}

