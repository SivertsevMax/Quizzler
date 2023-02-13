import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var trueButtonChange: UIButton!
    @IBOutlet weak var falseButtonChange: UIButton!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var currentQuestion: UILabel!

    let quiz = [
        Question(q: "Four + Two is equal to Six", a: "true"),
        Question(q: "Five - Three is greater than One", a: "true"),
        Question(q: "Three + Eight is less than Ten", a: "false"),
        Question(q: "Four - Two is equal to Five", a: "false"),
        Question(q: "Seven * Three is greater than One", a: "true"),
        Question(q: "Three + Eight is less than Ten", a: "false"),
        Question(q: "Six - One is equal to Seven", a: "false"),
        Question(q: "Four + Three is greater than Two", a: "true"),
        Question(q: "Twenty / Two is less than Fourteen", a: "true"),
        Question(q: "One + Nine is equal to Eight", a: "false"),
    ]
    
    
    var questionNumber = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        trueButtonChange.layer.cornerRadius = 20
        falseButtonChange.layer.cornerRadius = 20
        progressView.progress = 0
    }
    
 
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let currentAnswer = quiz[questionNumber].answer
        
        if userAnswer == currentAnswer {
            sender.backgroundColor = UIColor.green
            correctAnswer += 1
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
            correctAnswer = 0
        }
        
        updateUI()
        updateCorrectQuestion()
        updateProgressView()
    }
    
    func updateUI() {
        questionText.text = quiz[questionNumber].question
    }
    func updateButton() {
        trueButtonChange.backgroundColor = UIColor.clear
        falseButtonChange.backgroundColor = UIColor.clear
    }
    
    func updateCorrectQuestion() {
        currentQuestion.text = "\(correctAnswer)/\(quiz.count)"
    }
    
    func updateProgressView() {
        progressView.progress = (Float(questionNumber) / Float(quiz.count))
    }
}

