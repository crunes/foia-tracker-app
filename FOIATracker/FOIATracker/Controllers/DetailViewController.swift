//
//  DetailViewController.swift
//  FOIATracker
//
//  Created by Charmaine Runes on 10/15/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    var request: Request!
    var image: UIImage!

    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.departmentLabel.text = self.request.department
        
        self.descriptionLabel.text = self.request.description
        self.descriptionLabel.numberOfLines = 0
        
        self.storyLabel.text = self.request.story
        self.storyLabel.numberOfLines = 0
        
        self.responseLabel.text = self.request.receivedResponse.description
        
        self.imageView.image = self.image
        
        // To-do: Figure out how to resize images or get images of uniform size!
        
        // Do any additional setup after loading the view.
        // print(request)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
