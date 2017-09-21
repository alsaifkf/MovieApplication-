//
//  Movie.swift
//  Movies
//
//  Created by alsaif, khalid on 10/5/16.
//  Copyright © 2016 alsaif, khalid. All rights reserved.
//

import Foundation

class Movie {

    
    var MovieTitle:String
    var MovieDirector:String
    var PublishDate:String
    
    
    init (Title:String,Director:String,PupDate:String)
    {
      MovieTitle = Title
      MovieDirector = Director
      PublishDate = PupDate
    }
    
    init ()
    {
        MovieTitle = "New Film "
        MovieDirector = "Director: "
        PublishDate = "Publish Date:  "
    
    }
    
    func MovieDetails() -> String
    {
        
        return  " \(MovieTitle) \n \(MovieDirector) \n \(PublishDate)"
    }
    
}
