//
//  ChooseSiteViewController.swift
//  SwiftTables2
//
//  Created by Don Riz Jaring on 4/19/20.
//  Copyright © 2020 DJ Initiatives. All rights reserved.
//

import UIKit

class ChooseSiteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var listData = ["Munkee","Dunkee","Lama", "Yotee", "Yeenah", "Waalaa", "Heetah", "Ayon"]
    
    var siteData = [
        "https://www.projectmkd.com/munkee",
        "https://www.projectmkd.com/dunkee",
        "https://www.projectmkd.com/laamaa",
        "https://www.projectmkd.com/yotee",
        "https://www.projectmkd.com/yeenah",
        "https://www.projectmkd.com/waalaa",
        "https://www.projectmkd.com/heetah",
        "https://www.projectmkd.com/ayon"
    ]
    
    var imageData: [UIImage] = [
        UIImage(named: "munkee")!,
        UIImage(named: "dunkee")!,
        UIImage(named: "lama")!,
        UIImage(named: "yotee")!,
        UIImage(named: "yeenah")!,
        UIImage(named: "waalaa")!,
        UIImage(named: "heetah")!,
        UIImage(named: "ayon")!
        ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell ?? SiteCell(style: .default, reuseIdentifier: "cell")
        
        let rowNum = indexPath.row
        tableCell.primaryLabel.text = listData[rowNum]
        tableCell.secondaryLabel.text = siteData[rowNum]
        tableCell.myImageView.image = imageData[rowNum]
        tableCell.accessoryType = .disclosureIndicator
        
        return tableCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        mainDelegate.selectedURL = siteData[indexPath.row]
        
        performSegue(withIdentifier: "ChooseSegueToView", sender: nil)
    }
    
    @IBAction func unwindToChooseViewController(sender: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
