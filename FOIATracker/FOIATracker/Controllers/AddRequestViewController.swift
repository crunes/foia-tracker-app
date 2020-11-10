//
//  AddRequestViewController.swift
//  FOIATracker
//
//  Created by Charmaine Runes on 11/6/20.
//

import UIKit

class AddRequestViewController: UIViewController {

    var request: Request!
    
    @IBOutlet weak var departmentInput: UITextField!
    @IBOutlet weak var descriptionInput: UITextField!
    @IBOutlet weak var storyInput: UITextField!
    @IBOutlet weak var responseInput: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
