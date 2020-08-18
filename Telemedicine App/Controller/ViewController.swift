//
//  ViewController.swift
//  sideMenuBar
//
//  Created by Rukhsar on 17/08/2020.
//  Copyright © 2020 Rukhsar. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
   
    
    
    @IBOutlet weak var homeProfile: UIImageView!   //home picture
    @IBOutlet weak var trailingView: NSLayoutConstraint!
    @IBOutlet weak var leadingView: NSLayoutConstraint!
    @IBOutlet weak var profileImage: UIImageView! //profile picture
    
    var arrayData = ["CustomerCare" , "Home" , "Menu option 1" , "Menu option 2" , "Menu option 3" , "Menu option 4" , "Menu option 5" , "Menu option 6" , "Logout"]
    var arrayImage = [ #imageLiteral(resourceName: "customerCareImage") ,#imageLiteral(resourceName: "homeIcon") , #imageLiteral(resourceName: "menu1") , #imageLiteral(resourceName: "Menu2") , #imageLiteral(resourceName: "menu3") ,#imageLiteral(resourceName: "menu4") , #imageLiteral(resourceName: "menu5") , #imageLiteral(resourceName: "menu6") ,#imageLiteral(resourceName: "logout")  ]
    var menuOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        roundPicture(profileName: homeProfile)
        roundPicture(profileName: profileImage)
     
        
    }
//MARK: - tableView Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.sideBarImageView.image = arrayImage[indexPath.row]
        cell.sideBarLabelName.text = arrayData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

       tableView.deselectRow(at: indexPath, animated: true)
       
        let path = indexPath.row
        
        if path == 2 {
            performSegue(withIdentifier: "menu1", sender: self)
        }else if path == 3 {
            performSegue(withIdentifier: "menu2", sender: self)
        }
        
    }
  
    //MARK: - picture round function
    
    func roundPicture(profileName: UIImageView){
        
        profileName.layer.cornerRadius = profileImage.frame.size.width / 2
        profileName.clipsToBounds = true
        profileName.layer.borderColor = UIColor.white.cgColor
        profileName.layer.borderWidth = 3
        
    }
    

    //MARK: - sideBar button


  
        @IBAction func sideBarButton(_ sender: UIBarButtonItem) {
          
            if menuOut == false {
                leadingView.constant = 319
                trailingView.constant = -319
                menuOut = true
            }else{
                leadingView.constant = 0
                trailingView.constant = 0
                menuOut = false
            }
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            }) { (animationComplete) in
                print("animation completed")
            } //animation end
            
            
            
        } // button end
        
        
        
      
        
    }
    
    


