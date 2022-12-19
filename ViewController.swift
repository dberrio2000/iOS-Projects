//**DISCLAIMER: This App is developed as an educational project. If any copyrighted materials are included in accordance to the multimedia fair use guidelines, a notice should be added and states that certain materials are included under the fair use exemption of the U.S. Copyright Law and have been prepared according to the multimedia fair use guidelines and are restricted from further use.**

//  ViewController.swift
//  ShowSelector
//
//  Created by Darion Berrios on 10/12/22.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    var mySoundFile:AVAudioPlayer!
    
    @IBOutlet weak var imgShowImage: UIImageView!
    @IBOutlet weak var lblShowDescription: UILabel!
    @IBOutlet weak var lblShowSeasonNum: UILabel!
    @IBOutlet weak var lblShowEPNum: UILabel!
    @IBOutlet weak var lblShowScore: UILabel!
    @IBOutlet weak var lblShowGenre: UILabel!
    @IBOutlet weak var lblShowName: UILabel!
    
    var TVShowObjects = [TVShow]()
    
    var seguePassedOjbect = TVShow()
    
    var creatorLink = "https://www.linkedin.com/in/darionberrios"
    
    func convertToimage(urlString: String) -> UIImage {
        let imgURL = URL(string:urlString)!
        let imgData = try? Data(contentsOf: imgURL)
        print(imgData ?? "Error. Image fors not exist at this URL \(imgURL)")
        let img = UIImage(data: imgData!)
        return img!
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
    
    var globalShow:TVShow = TVShow()
    
    func SetLables() {
        //let randomShow = TVShowObjects.randomElement()
        let randomShow = seguePassedOjbect
        globalShow = randomShow
        
        lblShowName.text = randomShow.ShowName
        lblShowDescription.text = randomShow.ShowDescription
        lblShowGenre.text = randomShow.ShowGenre
        lblShowScore.text = randomShow.ShowScore
        lblShowEPNum.text = String(randomShow.ShowEPNum)
        lblShowSeasonNum.text = randomShow.ShowSeasonNum
        imgShowImage.image = convertToimage(urlString: randomShow.ShowImage)
        mySoundFile.play()
        
        imgShowImage.contentMode = UIView.ContentMode.scaleAspectFill
        // Set the size of the Imageview Frame
        imgShowImage.frame.size.width = 350
        imgShowImage.frame.size.height = 200
        //imgShowImage.center = self.view.center

            
        // Make Image Corners Rounded
        imgShowImage.layer.cornerRadius = 50
        imgShowImage.clipsToBounds = true
        imgShowImage.layer.borderWidth = 2
        imgShowImage.layer.borderColor = UIColor.yellow.cgColor
        //https://www.appsdeveloperblog.com/uiimageview-rounded-corners-in-swift/
        
       // Set text view properties
        lblShowDescription.layer.cornerRadius = 5
        lblShowDescription.layer.borderWidth = 4
        lblShowDescription.layer.borderColor = UIColor.yellow.cgColor
    }
       
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let  urlObject = URL(fileURLWithPath: Bundle.main.path(forResource: "click", ofType: "wav")!)
         
         mySoundFile = try? AVAudioPlayer(contentsOf:urlObject)
        InitializeShows()
        SetLables()
    }
    
    @IBAction func tchShowSite(_ sender: Any) {
        let browserApp = UIApplication.shared
        let url = URL(string: globalShow.ShowLink)
        browserApp.open(url!)
    }
    @IBAction func tchCreatorLink(_ sender: Any) {
        let browserApp = UIApplication.shared
        let url = URL(string:creatorLink)
        browserApp.open(url!)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destController = segue.destination as! DetailViewController
        destController.PassedTVShow = seguePassedOjbect
    }

}


