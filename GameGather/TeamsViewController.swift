//
//  TeamsViewController.swift
//  GameGather
//
//  Created by Uncia on 4/18/21.
//

import UIKit
import Parse
import AlamofireImage

class TeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [PFObject]()
    let user = PFUser.current()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self


        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        

        let query = PFQuery(className:"TeamPosts")
        
        query.includeKeys(["description", "author","image"])
        query.limit = 10
        query.order(byDescending: "updatedAt")
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamPostTableViewCell") as! TeamPostTableViewCell
        
        
        let post = posts[indexPath.row]
        
        cell.descriptionLabel.text = post["description"] as! String
        
        
        let imagefile = post["image"] as! PFFileObject
        let urlString = imagefile.url!
        let url = URL(string: urlString)!
        cell.gameImageView.af_setImage(withURL: url)
        
        
        cell.UserName.text = user["username"] as! String
        
        let userimagefile = user["ProfileImage"] as! PFFileObject
        let User_urlString = userimagefile.url!
        let User_url = URL(string: User_urlString)!
        cell.UserImage.af_setImage(withURL: User_url)
        
        
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
