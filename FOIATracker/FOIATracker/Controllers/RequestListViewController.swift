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
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // To-do: Set up pull-to-refresh
        
        self.requestService = RequestService()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
        
    override func viewWillAppear(_ animated: Bool) {
        // This happens after viewDidLoad, before every view appears
        guard let confirmedService = self.requestService else { return }
        
        confirmedService.getRequests(completion: { requests, error in
            guard let requests = requests, error == nil else {
                
                // Set up UIAlertController
                let alert = UIAlertController(title: "We could not load your FOIA requests", message: "Pull to refresh", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "OK",
                                              style: .default,
                                              handler: { action in print("Trying to fetch data from API again...") }))

                self.present(alert, animated: true)
                
                return
            }
            self.requests = requests
            self.tableView.reloadData()
        })

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let destination = segue.destination as? DetailViewController,
            let selectedIndexPath = self.tableView.indexPathForSelectedRow,
            let confirmedCell = self.tableView.cellForRow(at: selectedIndexPath) as? RequestCell
            else { return }
        
        let confirmedRequest = confirmedCell.request
        let confirmedImageView = confirmedCell.requestImageView
        
        destination.request = confirmedRequest
        destination.image = confirmedImageView?.image
        
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
        if
            // Check that the cell is indeed an instance of the RequestCell class
            let cell = self.tableView.cellForRow(at: indexPath) as? RequestCell,
            let confirmedRequest = cell.request
        {
            // Get current state and remove accessory type
            let status = confirmedRequest.receivedResponse
            let title = status ? "Awaiting response" : "Received response"
            
            // Create the image
            let tray = UIImageView(frame: CGRect(x: 0, y: 65, width: 25, height: 30))
            tray.image = UIImage(systemName: "tray.full.fill")
            tray.tintColor = .systemTeal
            
            // Define the swipe action
            let action = UIContextualAction(style: .normal, title: title,
                handler: { (action, view, completionHandler) in
                    
                // Update data source when user taps action
                    confirmedRequest.receivedResponse = !confirmedRequest.receivedResponse
                    cell.accessoryView = confirmedRequest.receivedResponse ? tray : .none
                    completionHandler(true)
              })
            
            action.image = .none
            action.backgroundColor = status ? .gray : .systemTeal
            
            return UISwipeActionsConfiguration(actions: [action])
        }
        
        return nil
    }
    
    // OLD FUNCTION
    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //if
           //let cell = self.tableView.cellForRow(at: indexPath) as? RequestCell,
           //let confirmedRequest = cell.request
        //{
            //confirmedRequest.receivedResponse = true
            //cell.accessoryType = confirmedRequest.receivedResponse ? .checkmark : .none
        //}
    //}
}
