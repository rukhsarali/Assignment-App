//
//  ViewController.swift
//  sideMenuBar
//
//  Created by Rukhsar on 17/08/2020.
//  Copyright © 2020 Rukhsar. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
   
    var arrayData = ["CustomerCare" , "Home" , "Menu option 1" , "Menu option 2" , "Menu option 3" , "Menu option 4" , "Menu option 5" , "Menu option 6" , "Logout"]
    var arrayImage = [ #imageLiteral(resourceName: "customerCareImage") ,#imageLiteral(resourceName: "homeIcon") , #imageLiteral(resourceName: "menu1") , #imageLiteral(resourceName: "Menu2") , #imageLiteral(resourceName: "menu3") ,#imageLiteral(resourceName: "menu4") , #imageLiteral(resourceName: "menu5") , #imageLiteral(resourceName: "menu6") ,#imageLiteral(resourceName: "logout")  ]
    
    @IBOutlet weak var sideView: UIView!  //side view full
    
    @IBOutlet weak var profileView: UIView! // side view picture, name, email
    
    @IBOutlet weak var sideBar: UITableView! //side bar Tableview
    
    @IBOutlet weak var profileImage: UIImageView! //profile picture
    
    var isSideViewIsOpen : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       roundPicture()
        sideView.isHidden = true
      //  sideView.backgroundColor = UIColor.white
       isSideViewIsOpen = false
       // profileView.isHidden = true
        
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
       
       // tableView.tintColor = UIColor.black
        
    }
  
    //MARK: - picture round function
    
    func roundPicture(){
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 3
    }
    

    //MARK: - sideBar button


   // @IBAction func sideBarButton(_ sender: UIButton) {
        @IBAction func sideBarButton(_ sender: UIBarButtonItem) {
            //profileView.isHidden = false
                   sideBar.isHidden = false
                   sideView.isHidden = false
                   self.view.bringSubviewToFront(sideView)
                  
                   if !isSideViewIsOpen{
                       isSideViewIsOpen = true
                       sideView.frame = CGRect(x: 0, y: 88, width: 0, height: 808)
                       sideBar.frame = CGRect(x: 1, y: 236, width: 0, height: 571)

//                       UIView.setAnimationDuration(0.3)
//                       UIView.setAnimationDelegate(self)
//                       UIView.beginAnimations("TableAnimation", context: nil)

                       sideView.frame = CGRect(x: 0, y: 88, width: 321, height: 808)
                       sideBar.frame = CGRect(x: 1, y: 236, width: 319, height: 571)

                       //UIView.commitAnimations()
                    UIView.animate(withDuration: 0.9, delay: 0.0, options: .curveEaseIn, animations: {
                        self.view.layoutIfNeeded()
                    }) { (animationComplete) in
                        print("animation completed")
                    } //end
                    
                   }else {
                       // profileView.isHidden = true
                       sideBar.isHidden = true
                       sideView.isHidden = true
                       isSideViewIsOpen = false

                       sideView.frame = CGRect(x: 0, y: 88, width: 321, height: 808)
                       sideBar.frame = CGRect(x: 1, y: 236, width: 319, height: 571)

//                       UIView.setAnimationDuration(0.5)
//                       UIView.setAnimationDelegate(self)
//                       UIView.beginAnimations("TableAnimation", context: nil)

                       sideView.frame = CGRect(x: 0, y: 88, width: 0, height: 808)
                       sideBar.frame = CGRect(x: 1, y: 236, width: 0, height: 571)
                      // UIView.commitAnimations()
                   
           UIView.animate(withDuration: 0.9, delay: 0.0, options: .curveEaseIn, animations: {
               self.view.layoutIfNeeded()
           }) { (animationComplete) in
               print("animation completed")
           } //end
            
        }
            
            
        }
        
        
        
      
        
    }
    
    
//}



