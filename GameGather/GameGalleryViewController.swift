//
//  GameGalleryViewController.swift
//  GameGather
//
//  Created by Uncia on 4/10/21.
//

import UIKit
import Parse
import AlamofireImage


class GameGalleryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var GameImageTableView: UITableView!
    
    
    var Games = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        GameImageTableView.delegate = self
        GameImageTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        

        let query = PFQuery(className:"Games")
        
        query.includeKeys(["GameName", "GameImage"])
        query.limit = 10
        
        query.findObjectsInBackground { (Games, error) in
            if Games != nil {
                self.Games = Games!
                self.GameImageTableView.reloadData()
            }
        }
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        return Games.count
    }
    

   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameImageViewCell") as! GameImageViewCell
        
        
        let game = Games[indexPath.row]
        
        cell.GameLabel.text = game["GameName"] as! String
        
        
        let imagefile = game["GameImage"] as! PFFileObject
        let urlString = imagefile.url!
        let url = URL(string: urlString)!
        cell.GameImageView.af_setImage(withURL: url)
        
        return cell
        
    
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
