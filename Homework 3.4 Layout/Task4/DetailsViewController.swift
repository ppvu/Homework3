import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet var usernameLabel: UILabel!
    
    var username: String?
    
    var stats = [
        StatsModel(imageName: "video-icon", title: "Videos", score: .random(in: 1...1000)),
        StatsModel(imageName: "heart-icon", title: "Hearts", score: .random(in: 1...1000)),
        StatsModel(imageName: "game-icon", title: "Games", score: .random(in: 1...1000)),
        StatsModel(imageName: "win-icon", title: "Wins", score: .random(in: 1...1000)),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = username
        
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        
        profileImageView.layer.masksToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? StatsViewController else { return }
        viewController.leftModel = stats.remove(at: 0)
        viewController.rightModel = stats.remove(at: 0)
    }
    
    @IBAction func doneButtonAction(_ sender: Any?) {
        dismiss(animated: true, completion: nil)
    }
}
