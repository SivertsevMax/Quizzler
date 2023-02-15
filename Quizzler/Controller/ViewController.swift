import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var trueButtonChange: UIButton!
    @IBOutlet weak var falseButtonChange: UIButton!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var CorrectAnswer: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = quizBrain.getQuestionText()
        trueButtonChange.layer.cornerRadius = 20
        falseButtonChange.layer.cornerRadius = 20
        CorrectAnswer.text = "\(quizBrain.correctAnswer)/\(quizBrain.questionNumber + 1)"
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
        questionText.text = quizBrain.getQuestionText()
        trueButtonChange.backgroundColor = UIColor.clear
        falseButtonChange.backgroundColor = UIColor.clear
        CorrectAnswer.text = "Score:\(quizBrain.getCorrectAnswer())"
        progressView.progress = quizBrain.getProgress()
    }
}

