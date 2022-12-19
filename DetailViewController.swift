//
//  DetailViewController.swift
//  ShowSelectorProject
//
//  Created by Darion Berrios on 12/7/22.
//

import Foundation
import UIKit
import WebKit
class DetailViewController : UIViewController{
    
    @IBOutlet weak var lblShowName: UILabel!
    @IBOutlet weak var wkBrowser: WKWebView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        lblShowName.text = PassedTVShow.ShowName
        
        let siteURL = URL(string: PassedTVShow.ShowLink)
        let request = URLRequest(url:siteURL!)
        wkBrowser.load(request)
        
        }
    
    var PassedTVShow = TVShow()
}
