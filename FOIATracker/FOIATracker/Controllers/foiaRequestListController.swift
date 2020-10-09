//
//  ViewController.swift
//  FOIATracker
//
//  Created by Charmaine Runes on 10/1/20.
//

import UIKit

class foiaRequestListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var requests: [Request] = [] // potentially no requests, so app doesn't crash
    var requestService: RequestService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.requestService = RequestService()
        self.requests = self.requestService.getRequests()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        }

}

extension foiaRequestListController: UITableViewDataSource {
    //MARK: DataSource

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.requests.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "request") as! requestCell
        
        let currentRequest = self.requests[indexPath.row]
        cell.requestLabel.text = currentRequest.department
        cell.requestDescription.text = currentRequest.description
        
        return cell
    }
}

extension foiaRequestListController: UITableViewDelegate {
    //MARK: Delegate

}
