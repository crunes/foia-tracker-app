//
//  ViewController.swift
//  FOIATracker
//
//  Created by Charmaine Runes on 10/1/20.
//

import UIKit

class foiaRequestListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var requests: [String] = [] // potentially no requests, so app doesn't crash
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        requests = ["Request 873641", "Request 831648", "Request 17267", "Request 873641", "Request 831648", "Request 17267", "Request 873641", "Request 831648", "Request 17267","Request 873641", "Request 831648", "Request 17267", "Request 873641", "Request 831648", "Request 17267", "Request 873641", "Request 831648", "Request 17267", "Request 873641", "Request 831648", "Request 17267"]
        
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
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "request")!
        
        cell.textLabel?.text = self.requests[indexPath.row]
        
        return cell
    }
}

extension foiaRequestListController: UITableViewDelegate {
    //MARK: Delegate

}
