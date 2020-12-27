import UIKit

struct StatsModel {
    let imageName: String
    let title: String
    let score: Int
}

class StatsViewController: UIViewController {
    
    var leftModel: StatsModel!
    @IBOutlet var leftImageView: UIImageView!
    @IBOutlet var leftTopLabel: UILabel!
    @IBOutlet var leftBottomLabel: UILabel!
    
    var rightModel: StatsModel!
    @IBOutlet var rightImageView: UIImageView!
    @IBOutlet var rightTopLabel: UILabel!
    @IBOutlet var rightBottomLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftImageView.image = UIImage(named: leftModel.imageName)
        leftTopLabel.text = leftModel.title
        leftBottomLabel.text = String(leftModel.score)
        
        rightImageView.image = UIImage(named: rightModel.imageName)
        rightTopLabel.text = rightModel.title
        rightBottomLabel.text = String(rightModel.score)
    }
}
