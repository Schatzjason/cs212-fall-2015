
import UIKit

class ViewController: UIViewController {
    
    var count: Int = 0
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeCount(sender: UIButton) {
        
        switch sender {
        case incrementButton:
            count++
        case decrementButton:
            count--
        default:
            assert(false, "unidentified button")
        }
        
        label.text = "\(count)"
    }    
}












