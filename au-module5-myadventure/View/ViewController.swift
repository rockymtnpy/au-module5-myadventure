import UIKit

class ViewController: UIViewController {

    var gameLogic = AdventureLogic()
    var currentLayer : Layer? = AdventureLogic().begin
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var choiceOne: UIButton!
    
    @IBOutlet weak var choiceTwo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setupGame()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitChoice(_ sender: UIButton) {
        let choice = sender.titleLabel?.text
        print(choice!)
        
        if choice == "Restart Game" {
            currentLayer = AdventureLogic().begin
            updateUI()
            return
        }
        
        let title = sender.title(for: .normal)
        
        if let index = currentLayer!.options.firstIndex(where: { $0.stateText == title }),
            let nextLayer = currentLayer!.options[index].nextLayer {
            currentLayer = nextLayer
            updateUI()
        }
    }
        
    func updateUI() {
        messageLabel.text = currentLayer?.stateText
        choiceOne.setTitle(currentLayer?.options[0].stateText, for: .normal)
        choiceTwo.setTitle(currentLayer?.options[1].stateText, for: .normal)
        
        if (gameLogic.endStates.contains(messageLabel.text!)) {
            choiceTwo.isHidden = true
        } else {
            choiceTwo.isHidden = false
        }
    }
    
    func setupGame() {
        //currentLayer = Layer.begin
        updateUI()
    }
    

}

