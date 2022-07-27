
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        let score = UserDefaults.standard.string(forKey: "score") ?? "0"
        labelScore.text = "Last score : \(score)"
        
    }

}

