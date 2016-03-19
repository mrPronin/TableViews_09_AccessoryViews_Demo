//
//  RatingTableViewController.swift
//  PrettyIcons
//
//  Created by Aleksandr Pronin on 3/19/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit

class RatingTableViewController: UITableViewController {
    
    //MARK: - Vars
    var icon: Icon?
    
    //MARK: - UITableViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        guard let rating = RatingType(rawValue: indexPath.row) else {
            return
        }
        icon?.rating = rating
        refresh()
    }
    
    //MARK: - Private
    func refresh() {
        for index in 0 ... RatingType.TotalRatings.rawValue {
            let indexPath = NSIndexPath(forItem:index, inSection:0)
            if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                cell.accessoryType = icon?.rating.rawValue == index ? .Checkmark : .None
            }
        }
    }
}
