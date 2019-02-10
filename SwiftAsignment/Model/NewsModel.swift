//
//  NewsModel.swift
//  SwiftAssessment
//
//  Created by MOHAMMED IMRAN on 2/7/19.
//  Copyright © 2019 MOHAMMED IMRAN. All rights reserved.
//

import Foundation

class NewsData :  Codable {
    
    var status           : String?
    var copyright        : String?
    var section          : String?
    var last_updated     : String?
    var num_results      : Int?
    
    var results : [News]? = [News]()
    

}

class News :  Codable{
    
    var section                 : String?
    var subsection              : String?
    var title                   : String?
    var abstract                : String?
    var url                     : String?
    var byline                  : String?
    var updated_date            : String?
    var created_date            : String?
    var published_date          : String?
    var material_type_facet     : String?
    var kicker                  : String?
    var short_url               : String?
    
    var multimedia : [Multimedia]? = [Multimedia]()
    
    var des_facet        : [String]?
    var org_facet        : [String]?
    var per_facet        : [String]?
    var geo_facet        : [String]?
    
    
}

class Multimedia : Codable{
    
    var url                 : String?
    var format              : String?
    var height              : Int?
    var width               : Int?
    var type                : String?
    var subtype             : String?
    var caption             : String?
    var copyright           : String?
    
}

