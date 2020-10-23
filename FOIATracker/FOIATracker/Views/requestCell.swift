//
//  requestCell.swift
//  FOIATracker
//
//  Created by Charmaine Runes on 10/1/20.
//

import UIKit

class RequestCell: UITableViewCell {
    
    @IBOutlet weak var requestLabel: UILabel!
    @IBOutlet weak var requestDescription: UILabel!
    @IBOutlet weak var requestImageView: UIImageView!
    
    var requestStory: String = ""
    var requestResponse: String = ""
    
    var request: Request? {
        didSet {
            self.requestLabel.text = request?.department
            self.requestDescription.text = request?.description
            self.requestDescription.numberOfLines = 0
            self.requestStory = request?.story ?? ""
            self.requestResponse = request?.receivedResponse.description ?? ""
            self.accessoryType = .none
            
            DispatchQueue.global(qos: .userInitiated).async {
                if let requestImageData = NSData(contentsOf: (URL(string: self.request!.imageUrl))!)
                {
                  DispatchQueue.main.async {
                    self.requestImageView.image = UIImage(data: requestImageData as Data)
                    }
                } else {
                    print("imageRequestData is nil")
                    return
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
