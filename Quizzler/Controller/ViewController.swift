import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var trueButtonChange: UIButton!
    @IBOutlet weak var falseButtonChange: UIButton!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var CorrectAnswer: UILabel!
    
    var quizBrain = QuizBrain()
    
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = quizBrain.getQuestionText()
        trueButtonChange.layer.cornerRadius = 20
        falseButtonChange.layer.cornerRadius = 20
        CorrectAnswer.text = "0/\(quizBrain.quiz.count)"
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            correctAnswer += 1
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.updateUI()
        }
        
        
    }
    
    
    
    func updateUI() {
        questionText.text = quizBrain.getQuestionText()
        trueButtonChange.backgroundColor = UIColor.clear
        falseButtonChange.backgroundColor = UIColor.clear
        CorrectAnswer.text = quizBrain.getCorrectAnswer(correctAnswer: correctAnswer)
        progressView.progress = quizBrain.getProgress()
    }
}

