import UIKit

class DetailViewController: UIViewController {
    
    let questions = ["G.O.A.T lakaplı yıldız oyuncu kimdir ?" , "Gezegenler isimlerini nereden alıyor ? ", "Güneş sistemizde kaç gezegen vardır ? "]
    let answers = [ ["Ronaldo" , "Messi" , "Hasan Ali Kaldırım"], ["Yunan tanrılarından" , "Onları keşfeden bilim adalrından" , "Latince kelimelerden"] , ["8" , "9" , "10"] ]

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    
    var currentQuestion =  0
    var score =  0
    var rightAnswer : Int32 =  0
    
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonA.layer.cornerRadius = 10
        buttonB.layer.cornerRadius = 10
        buttonC.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nextQuestions()
    }

    @IBAction func button(_ sender: Any) {
        
        if (sender as AnyObject).tag == Int(rightAnswer) {
            print("RIGHT!!")
            score += 1
        }else {
            print("WRONG")
        }
        
        if currentQuestion != questions.count {
            nextQuestions()
        }else {
            defaults.set(String(score), forKey: "score")
            defaults.synchronize()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func nextQuestions(){
        
        labelTitle.text = questions[currentQuestion]
        
        rightAnswer = Int32(arc4random_uniform(3) + 1)
        
        var button = UIButton()
        
        var x = 1
        
        for i in 1...3 {
            
            button = view.viewWithTag(i) as! UIButton
            
            if i == Int(rightAnswer) {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else{
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        
        currentQuestion += 1
        
    }
    
}
