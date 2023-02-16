import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var CorrectAnswer: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = quizBrain.getQuestionText()
        firstButton.layer.cornerRadius = 20
        secondButton.layer.cornerRadius = 20
        thirdButton.layer.cornerRadius = 20
        firstButton.setTitle("\(quizBrain.nameOfButton(0))", for: .normal)
        secondButton.setTitle("\(quizBrain.nameOfButton(1))", for: .normal)
        thirdButton.setTitle("\(quizBrain.nameOfButton(2))", for: .normal)

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
        firstButton.setTitle("\(quizBrain.nameOfButton(0))", for: .normal)
        secondButton.setTitle("\(quizBrain.nameOfButton(1))", for: .normal)
        thirdButton.setTitle("\(quizBrain.nameOfButton(2))", for: .normal)
        questionText.text = quizBrain.getQuestionText()
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        CorrectAnswer.text = "Score:\(quizBrain.getCorrectAnswer())"
        progressView.progress = quizBrain.getProgress()
    }
}

