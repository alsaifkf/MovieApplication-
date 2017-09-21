//
//  MasterViewController.swift
//  Movies
//
//  Created by alsaif, khalid on 10/5/16.
//  Copyright © 2016 alsaif, khalid. All rights reserved.
//

import UIKit

protocol UpdateDetailsDeleget
{
    func DetailDidUpdate(currentmovie:Movie)
    

}



class MasterViewController: UITableViewController, UpdateDetailsDeleget  {
    
    
    
    var detailViewController: DetailViewController? = nil
    let movies = NSMutableArray()
    //var objects = [Movie]()
    
    
    func addmovieToList ( mv:Movie )
    {
        movies.addObject(mv)
    }

    //var movie = [Movie(Title: "Movie 0",Director: "Direct 0",PupDate: "2000-01-01"),
             // Movie(Title: "Movie 1",Director: "Direct 1",PupDate: "2010-01-01")]
    
     /*func listMovies()
     {
        for item in self.movie
        {
            objects.insert(item , atIndex: 0)
            
            let indexPath = NSIndexPath(forRow: 0, inSection: 0)
            self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }

     }*/
    
    func DetailDidUpdate(currentmovie:Movie)
    {
        
        let indexPath = self.tableView.indexPathForSelectedRow
        
        if indexPath != nil
        {
            movies[indexPath!.row] = currentmovie
            
        } else {

            movies[0] = currentmovie
        }
        
        
        self.tableView?.reloadData()
        
        
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func Cancel(segue:UIStoryboardSegue)
    {
        
    }
    
    /*func AddNew(currentmovie:Movie)
    {
       
        let indexPath = self.tableView.indexPathForSelectedRow
        
        if indexPath != nil
        {
            objects[indexPath!.row] = currentmovie
            
        } else
        {
            objects[0] = currentmovie
        }
        
        self.tableView?.reloadData()
        
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }*/
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
       let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(insertNewObject(_:)))
       self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        //listMovies()
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        
        
        
        //objects.insert(Movie() , atIndex: indexcount )
        
        //objects.insert(movie[0] , atIndex: 0)
        
        
        addmovieToList (Movie())
        
        
        let indexPath = NSIndexPath(forRow: movies.count-1, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        
        
  
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                //let object = objects[indexPath.row]
                let movie = movies.objectAtIndex(indexPath.row) as! Movie
                //currentrow = indexPath.row
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                
                //controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
                
                controller.detailItem = movie
                controller.delegate = self
                
            }
            
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let index = indexPath.row
        let movie = movies.objectAtIndex(index) as! Movie
        
            
        cell.textLabel!.text = movie.MovieTitle
        cell.detailTextLabel!.text = movie.MovieDirector + " , " + movie.PublishDate
        
        
        
        
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        
        
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            movies.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    

}

