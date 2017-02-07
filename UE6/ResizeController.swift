//
//  ResizeController.swift
//  UE6
//
//  Created by Student on 31/01/2017.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ResizeController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{

    @IBOutlet var table: UITableView!
    
    var tableContent: [String] = ["Cheese Burger","Chicken Burger","ULTIMATE BEEF BURGER"]
    
    private let kTableHeaderHeight: CGFloat = 250.0
    private let kTableHeaderCutAway: CGFloat = 40.0
    
    
    var headerView: UIView!
    var headerMaskLayer: CAShapeLayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.rowHeight = UITableViewAutomaticDimension
        headerView = table.tableHeaderView
        table.tableHeaderView = nil
        table.addSubview(headerView)
        
        let effectiveHeight = kTableHeaderHeight-kTableHeaderCutAway/2
        
        //table.contentInset=UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right:0)
        //table.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        table.contentInset=UIEdgeInsets(top: effectiveHeight, left: 0, bottom: 0, right:0)
        table.contentOffset = CGPoint(x: 0, y: -effectiveHeight)

        
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.black.cgColor
        
        headerView.layer.mask = headerMaskLayer
        
        updateHeaderView()
        
        // Do any additional setup after loading the view.
    }
    
    

    
    func updateHeaderView(){
        
        let effectiveHeight = kTableHeaderHeight-kTableHeaderCutAway/2
        //var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: table.bounds.width, height: kTableHeaderHeight)
        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: table.bounds.width, height: kTableHeaderHeight)
        if table.contentOffset.y < -kTableHeaderHeight{
            headerRect.origin.y = table.contentOffset.y
            //headerRect.size.height = -table.contentOffset.y
            headerRect.size.height = -table.contentOffset.y + kTableHeaderCutAway/2
        }
        
        headerView.frame = headerRect
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y:0))
        path.addLine(to: CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLine(to: CGPoint(x:0, y: headerRect.height-kTableHeaderCutAway))
        headerMaskLayer?.path = path.cgPath
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        cell.textLabel?.text = tableContent[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent.count
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
