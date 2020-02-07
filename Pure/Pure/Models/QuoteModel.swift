//
//  QuoteModel.swift
//  Pure
//
//  Created by Mohammed Drame on 2/6/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import Foundation

// Data model, Will be imporve as the app involved.
class QuotesModel {
    
    var quote: String
    var date: String
    var likeStatus: Bool
    
    init(quote: String, date: String, likeStatus: Bool) {
        self.quote = quote
        self.date = date
        self.likeStatus = likeStatus
    }
    
    
}



// make apicall and add datat into model here

class DataSet {
    
    var quoteModel = [QuotesModel]()
    
    let one = QuotesModel(quote: "Life is hard but you gotto keep you heads up !!!! ", date: "Today", likeStatus: true)
    let two = QuotesModel(quote: "Open your eye's and you shall see every thing", date: "Yesterday", likeStatus: false)
    
    func setQuotes() -> [QuotesModel] {
        quoteModel.append(one)
        quoteModel.append(two)
        return quoteModel
    }
    
    
}


