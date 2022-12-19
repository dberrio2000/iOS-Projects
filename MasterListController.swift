//
//  MasterListController.swift
//  ShowSelectorProject
//
//  Created by Darion Berrios on 12/5/22.
//

import Foundation
import UIKit
class MasterListController : UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetJSONData()
        //InitializeShows()
    }
    
    override func numberOfSections(in tableView: UITableView) ->
    Int {
        return 1
    }
    
    override func tableView(_ tabbleView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TVShowObjects.count
    }
    
    override func tableView(_ TableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowNum = indexPath.row
        
        let show = TVShowObjects[rowNum]
        
        let cellA = TableView.dequeueReusableCell(withIdentifier: "cellA")
        
        cellA?.textLabel!.text = show.ShowName
        
        cellA?.imageView?.image = UIImage(named:show.ShowImage)
        
        cellA?.detailTextLabel!.text = show.ShowGenre
        return cellA!
        
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail")
        {
            let selectedRowIndex = tableView.indexPathForSelectedRow!.row
            var selectedShow =  TVShowObjects[selectedRowIndex]
            
            let destinationController = segue.destination as! ViewController
            destinationController.seguePassedOjbect = selectedShow
        }
    }
    
    func convertToimage(urlString: String) -> UIImage {
        let imgURL = URL(string:urlString)!
        let imgData = try? Data(contentsOf: imgURL)
        print(imgData ?? "Error. Image does not exist at this URL \(imgURL)")
        let img = UIImage(data: imgData!)
        return img!
    }
    
    var TVShowObjects = [TVShow]()
    
    func GetJSONData(){
        let endPointString = "https://raw.githubusercontent.com/dberrio2000/JSON_Files/main/ShowList.json"
        let endPointURL = URL (string:endPointString)
        let dataBytes = try? Data(contentsOf: endPointURL!)
        
        if (dataBytes != nil){
            let dictionary:NSDictionary = (try! JSONSerialization.jsonObject(with:dataBytes!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            print ("Dictionary --: \(dictionary) ---- \ns")
            
            let showDictionary = dictionary["TVShows"] as! [[String:AnyObject]]
            
            for index in 0...showDictionary.count - 1 {
                let singleShow = showDictionary[index]
                let show = TVShow()
                show.ShowName = singleShow["ShowName"] as! String
                show.ShowDescription = singleShow["ShowDescription"] as! String
                show.ShowGenre = singleShow["ShowGenre"] as! String
                show.ShowScore = singleShow["ShowScore"] as! String
                show.ShowEPNum = singleShow["ShowEPNum"] as! String
                show.ShowSeasonNum = singleShow["ShowSeasonNum"] as! String
                show.ShowImage = singleShow["ShowImage"] as! String
                show.ShowLink = singleShow["ShowLink"] as! String
                
                TVShowObjects.append(show)
            }
        }
        
        
        func InitializeShows() {
            let s1 = TVShow()
            s1.ShowName = "Pantheon"
            s1.ShowDescription = "Bullied teen Maddie begins receiving messages from a mysterious stranger that claims to be her recently deceased father, David; his consciousness has been uploaded to the cloud after an experimental brain scan, and it turns out he's not the only one."
            s1.ShowGenre = "Sci-Fi"
            s1.ShowScore = "86%"
            s1.ShowEPNum = "8"
            s1.ShowSeasonNum = "1 Season"
            s1.ShowImage = "Pantheon.jpeg"
            s1.ShowLink = "https://www.rottentomatoes.com/tv/pantheon"
            TVShowObjects.append(s1)
            
            let s2 = TVShow()
            s2.ShowName = "Death Note"
            s2.ShowDescription = "A high-school student discovers a supernatural notebook that grants its user the ability to kill."
            s2.ShowGenre = "Crime, Suspense"
            s2.ShowScore = "96%"
            s2.ShowEPNum = "37"
            s2.ShowSeasonNum = "1 Season"
            s2.ShowImage = "Death Note.jpeg"
            s2.ShowLink = "https://www.rottentomatoes.com/tv/death_note"
            TVShowObjects.append(s2)
            
            let s3 = TVShow()
            s3.ShowName = "Cowboy Bebop"
            s3.ShowDescription = "Bounty hunters search for criminals."
            s3.ShowGenre = "Sci-fi, Crime"
            s3.ShowScore = "96%"
            s3.ShowEPNum = "26"
            s3.ShowSeasonNum = "1 Season"
            s3.ShowImage = "Cowboy Bebop.jpeg"
            s3.ShowLink = "https://www.rottentomatoes.com/tv/cowboy_bebop"
            TVShowObjects.append(s3)
        }
        
    }
}
