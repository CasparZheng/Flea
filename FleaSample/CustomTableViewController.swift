//
//  CustomTableViewController.swift
//  FleaSample
//
//  Created by 廖雷 on 16/8/16.
//  Copyright © 2016年 廖雷. All rights reserved.
//

import UIKit
import Flea

class CustomTableViewController: UITableViewController {

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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath as NSIndexPath).row {
        case 0:
            let guideView = GuideView(frame: CGRect(x: 0, y: 0, width: 280, height: 360))
            guideView.addPage(UIImage(named: "guide-0")!)
            guideView.addPage(UIImage(named: "guide-1")!)
            
            let flea = Flea(type: .custom)
            flea.anchor = .center(.top)
            flea.backgroundStyle = .dark
            flea.cornerRadius = 4
            
            flea.fill(guideView).show()
        case 1:
            let loginView = LoginView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 250))
            
            let flea = Flea(type: .custom)
            flea.anchor = .edge(.top)
            flea.backgroundStyle = .dark
            
            flea.fill(loginView).show()
        case 2:
            let loginView = LoginView(frame: CGRect(x: 0, y: 0, width: view.bounds.width * 0.8, height: 250))
            
            let flea = Flea(type: .custom)
            flea.anchor = .center(nil)
            flea.backgroundStyle = .dark
            flea.cornerRadius = 4
            
            flea.fill(loginView).show()
        case 3:
            let shareView = ShareView()
            shareView.addShareItem(UIImage(named: "facebook")!, action: nil)
            shareView.addShareItem(UIImage(named: "twitter")!, action: nil)
            shareView.addShareItem(UIImage(named: "line")!, action: nil)
            shareView.addShareItem(UIImage(named: "instagram")!, action: nil)
            shareView.addShareItem(UIImage(named: "messenger")!, action: nil)
            shareView.addShareItem(UIImage(named: "whatsapp")!, action: nil)
            shareView.addShareItem(UIImage(named: "youtube")!, action: nil)
            
            let flea = Flea(type: .custom)
            flea.anchor = .edge(.bottom)
            flea.backgroundStyle = .dark
            
            shareView.flea = flea
            flea.fill(shareView).show()
        default:
            break
        }
    }
}
