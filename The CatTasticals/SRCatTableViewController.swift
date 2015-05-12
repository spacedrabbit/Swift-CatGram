//
//  SRCatTableViewController.swift
//  The CatTasticals
//
//  Created by Louis Tur on 5/11/15.
//  Copyright (c) 2015 Louis Tur. All rights reserved.
//

import UIKit

class SRCatTableViewController: PFQueryTableViewController {

    let cellIdentifier:String = "CatCell"
    
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
        
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        self.objectsPerPage = 25
        
        self.parseClassName = className
        self.tableView.rowHeight = 350
        self.tableView.allowsSelection = false
    }
    
    required init!(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    override func viewDidLoad() {
        tableView.registerNib(UINib(nibName: "CatViewerTableViewCell", bundle: nil), forCellReuseIdentifier:cellIdentifier)
        super.viewDidLoad()

    }
    
    override func queryForTable() -> PFQuery {
        var query:PFQuery = PFQuery(className: self.parseClassName!)
        if (objects?.count == 0){
            query.cachePolicy = PFCachePolicy.CacheThenNetwork
        }

        query.orderByAscending(SRParseConsts.CatTasticalConsts.nameKey)
        return query
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        
        var cell:CatViewerTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? CatViewerTableViewCell
        if ( cell == nil ){
            cell = NSBundle.mainBundle().loadNibNamed("CatViewerTableViewCell", owner: self, options: nil)[0] as? CatViewerTableViewCell
        }
        
        if let pfObject = object {
            cell?.catNameLabel?.text = pfObject[SRParseConsts.CatTasticalConsts.nameKey] as? String
            
            var votes:Int? = pfObject["votes"] as? Int
            if  votes == nil{
                votes = 0
            }

            cell?.catVotesLabel?.text = "\(votes!) votes"
            
            var credit:String? = pfObject["cc_by"] as? String
            if credit != nil {
                cell?.catCreditLabel?.text = "\(credit!) / CC 2.0"
            }
            
            cell?.catImageView?.image = nil
            if var urlString:String? = pfObject["url"] as? String {
                var url:NSURL? = NSURL(string: urlString!)
                
                if var url:NSURL? = NSURL(string: urlString!){
                    var error:NSError?
                    var request:NSURLRequest = NSURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.ReturnCacheDataElseLoad, timeoutInterval: 5.0)
                    
                    NSOperationQueue.mainQueue().cancelAllOperations()
                    
                    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {
                        (response:NSURLResponse!, imageData:NSData!, error:NSError!) -> Void in
                        
                        cell?.catImageView?.image = UIImage(data: imageData)
                    })
                }
            }
            
        }
        
        return cell
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
