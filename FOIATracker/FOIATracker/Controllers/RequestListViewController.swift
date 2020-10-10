//
//  ViewController.swift
//  FOIATracker
//
//  Created by Charmaine Runes on 10/1/20.
//

import UIKit

class RequestListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var requests: [Request] = []
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

extension RequestListViewController: UITableViewDataSource {
    //MARK: DataSource

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.requests.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "request") as! RequestCell
        let currentRequest = self.requests[indexPath.row]
        
        cell.request = currentRequest
         
        return cell
    }
}

extension RequestListViewController: UITableViewDelegate {
    //MARK: Delegate
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let response = receivedResponseAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [response])
    }
    
    func receivedResponseAction(at indexPath: IndexPath) -> UIContextualAction {
        let request = requests[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Received Response") { (action, view, completion) in
            request.receivedResponse = !request.receivedResponse
            completion(true)
        }
        
        let flame = UIImageView(frame: CGRect(x: 0, y: 65, width: 25, height: 30))
        flame.tintColor = .systemRed
        
        action.image = UIImage(systemName: "flame.fill")
        action.backgroundColor = request.receivedResponse ? .green : .orange
        
        return action
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if
           let cell = self.tableView.cellForRow(at: indexPath) as? RequestCell,
           let confirmedRequest = cell.request
        {
            confirmedRequest.receivedResponse = true
            cell.accessoryType = confirmedRequest.receivedResponse ? .checkmark : .none
        }
    }
}
