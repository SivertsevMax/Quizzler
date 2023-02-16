import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var allButton: [UIButton]!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var сorrectAnswer: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = quizBrain.getQuestionText()
        allButton.forEach({ $0.layer.cornerRadius = 20 })
        firstButton.setTitle("\(quizBrain.nameOfButton(0))", for: .normal)
        secondButton.setTitle("\(quizBrain.nameOfButton(1))", for: .normal)
        thirdButton.setTitle("\(quizBrain.nameOfButton(2))", for: .normal)
        сorrectAnswer.text = "Score:\(quizBrain.getCorrectAnswer())"
}
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.updateUI()
        }
    }
    
    func updateUI() {
        quizBrain.nextQuestion()
        firstButton.setTitle("\(quizBrain.nameOfButton(0))", for: .normal)
        secondButton.setTitle("\(quizBrain.nameOfButton(1))", for: .normal)
        thirdButton.setTitle("\(quizBrain.nameOfButton(2))", for: .normal)
        questionText.text = quizBrain.getQuestionText()
        allButton.forEach({ $0.backgroundColor = UIColor.clear })
        сorrectAnswer.text = "Score:\(quizBrain.getCorrectAnswer())"
        progressView.progress = quizBrain.getProgress()
    }
}

