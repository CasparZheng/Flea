//
//  AlertTableViewController.swift
//  FleaSample
//
//  Created by 廖雷 on 16/8/16.
//  Copyright © 2016年 廖雷. All rights reserved.
//

import UIKit
import Flea

class AlertTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            let defaultAlertFlea = Flea(type: .Alert(title: "Do you love Flea", subTitle: "If you love Flea, you may start it on GitHub"))
            defaultAlertFlea.addAction("No, thanks", action: { 
                
            })
            defaultAlertFlea.addAction("I love Flea", action: { 
                
            })
            defaultAlertFlea.show()
        default:
            break
        }
    }
}
