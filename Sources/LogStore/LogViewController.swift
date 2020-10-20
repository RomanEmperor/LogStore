//
//  LogViewController.swift
//  
//
//  Created by Roman Parajuli on 10/18/20.
//

import UIKit


/// The keyword public tells Xcode that this class should be accessible from other modules.
/// We need this here because we want to create an instance of this class in the app target to test if the package is set up correctly.
public class LogViewController : UITableViewController {

    // Properties
    let logItems = LogStore.logItems // assigning the log array in the LogStore type to a property of table view controller
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    
    public override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int)-> Int {
        
        return logItems.count
    }
    
    /// To fill and return the cell
    /// - Parameters:
    ///   - tableView: The table view being shown
    ///   - indexPath: current index of tableView
    /// - Returns: cell containing respective text from logItems Array
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = logItems[indexPath.row]
        return cell
    }
    
}

