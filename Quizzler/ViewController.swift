import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var trueButtonChange: UIButton!
    @IBOutlet weak var falseButtonChange: UIButton!
    @IBOutlet weak var questionText: UILabel!
    
    let quiz = [
        ["Four + Two is equal to Six", "True"],
        ["Five - Three is greater than One", "True"],
        ["Three + Eight is less than Ten", "False"]
    ]
    var questionNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        trueButtonChange.layer.cornerRadius = 20
        falseButtonChange.layer.cornerRadius = 20
    }
    
 
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let currentAnswer = quiz[questionNumber][1]
        
        if userAnswer == currentAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.updateButton()
        }
        
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        updateUI()
    }
    
    func updateUI() {
        questionText.text = quiz[questionNumber][0]
    }
    func updateButton() {
        trueButtonChange.backgroundColor = UIColor.clear
        falseButtonChange.backgroundColor = UIColor.clear
    }
}

