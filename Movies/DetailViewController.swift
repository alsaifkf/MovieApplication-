//
//  DetailViewController.swift
//  Movies
//
//  Created by alsaif, khalid on 10/5/16.
//  Copyright © 2016 alsaif, khalid. All rights reserved.
//

import UIKit



class DetailViewController: UIViewController {

    //@IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var MovieTitle: UITextField!
    @IBOutlet weak var DirectorName: UITextField!
    @IBOutlet weak var PublishDate: UITextField!
    
    @IBAction func addNew(sender: AnyObject) {
        
       if (( MovieTitle.text?.isEmpty) != nil)
       {
        
        delegate?.DetailDidUpdate(self.detailItem!)

       // delegate?.AddNew(self.detailItem!)
        
        //navigationController?.popViewControllerAnimated(true)
      
    }
        else
       {
        self.detailItem!.MovieTitle = (MovieTitle?.text)!
        self.detailItem!.MovieDirector = (DirectorName?.text)!
        self.detailItem!.PublishDate = (PublishDate?.text!)!
        delegate?.DetailDidUpdate(self.detailItem!)

        }
        
        }
    
    @IBAction func doneEditDetails(sender: UIButton) {
        
        if (MovieTitle.text?.characters.count > 0)
        {
        
        self.detailItem!.MovieTitle = (MovieTitle?.text)!
        self.detailItem!.MovieDirector = (DirectorName?.text)!
        self.detailItem!.PublishDate = (PublishDate?.text!)!
        delegate?.DetailDidUpdate(self.detailItem!)
        //navigationController?.popViewControllerAnimated(true)
            
        }
        else
        {
        
        delegate?.DetailDidUpdate(self.detailItem!)
        }
        

    }
    
    
    
    //@IBOutlet weak var CancelEdit: UIButton!
    
    @IBAction func doneCancelEdit(sender: UIButton) {
        
        delegate?.DetailDidUpdate(self.detailItem!)

        
    }
    
    //@IBAction func doneCancelEdit(sender: UIButton) {
    //
    //    self.navigationController?.popViewControllerAnimated(true)
        
    //}
    
    
    
    var delegate:UpdateDetailsDeleget? = nil
    
    var detailItem: Movie? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        
        if let detail = self.detailItem {
            
            if detail.MovieTitle != "New Film "
            {
            
                MovieTitle?.text = detail.MovieTitle
                DirectorName?.text = detail.MovieDirector
                PublishDate?.text! = detail.PublishDate
        }
    }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        //backbutton.addTarget(self, action: "backAction", forControlEvents: .TouchUpInside)
        //CancelEdit.addTarget(self, action: #selector("backAction"), forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


   
    
}

