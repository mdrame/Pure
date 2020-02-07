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
// So I procided to use hardCorded database, becase one thing I've seen customer complain is that they done get updates when their phone is off the interne, So i'm trynna take that advantage and do that for the time being.

class DataSet {
    
    var quoteModel:[QuotesModel] = [
    
    // Get 30 quoits equavilent
    // first then (First ten days of the month )
    QuotesModel(quote: "If you want to achieve greatness stop asking for permission.", date: "Today", likeStatus: true),
    QuotesModel(quote: "Things work out best for those who make the best of how things work out.", date: "Yesterday", likeStatus: false),
    QuotesModel(quote: "To live a creative life, we must lose our fear of being wrong.", date: "Yesterday", likeStatus: false),
   QuotesModel(quote: "If you are not willing to risk the usual you will have to settle for the ordinary.", date: "Yesterday", likeStatus: false),
    QuotesModel(quote: "Trust because you are willing to accept the risk, not because it's safe or certain.", date: "Yesterday", likeStatus: false),
   QuotesModel(quote: "Take up one idea. Make that one idea your life--think of it, dream of it, live on that idea. Let the brain, muscles, nerves, every part of your body, be full of that idea, and just leave every other idea alone. This is the way to success.", date: "Yesterday", likeStatus: false),
   QuotesModel(quote: "All our dreams can come true if we have the courage to pursue them.", date: "Yesterday", likeStatus: false),
   QuotesModel(quote: "Good things come to people who wait, but better things come to those who go out and get them." , date: "Yesterday", likeStatus: false),
    QuotesModel(quote: "If you do what you always did, you will get what you always got.", date: "Yesterday", likeStatus: false),
    QuotesModel(quote: "Success is walking from failure to failure with no loss of enthusiasm.", date: "Yesterday", likeStatus: false),
    // second ten (middle then day of the month )
    QuotesModel(quote: "Just when the caterpillar thought the world was ending, he turned into a butterfly.", date: "Today", likeStatus: true),
      QuotesModel(quote: "Successful entrepreneurs are givers and not takers of positive energy.", date: "Yesterday", likeStatus: false),
      QuotesModel(quote: "Whenever you see a successful person you only see the public glories, never the private sacrifices to reach them.", date: "Yesterday", likeStatus: false),
      QuotesModel(quote:  "Try not to become a person of success, but rather try to become a person of value.", date: "Yesterday", likeStatus: false),
       QuotesModel(quote: "Great minds discuss ideas; average minds discuss events; small minds discuss people.", date: "Yesterday", likeStatus: false),QuotesModel(quote: "If you don't value your time, neither will others. Stop giving away your time and talents--start charging for it.", date: "Yesterday", likeStatus: false),
       QuotesModel(quote:  "A successful man is one who can lay a firm foundation with the bricks others have thrown at him.", date: "Yesterday", likeStatus: false),
       QuotesModel(quote: "No one can make you feel inferior without your consent.", date: "Yesterday", likeStatus: false),
       QuotesModel(quote: "The whole secret of a successful life is to find out what is one's destiny to do, and then do it.", date: "Yesterday", likeStatus: false),
       QuotesModel(quote: "Open your eye's and you shall see every thing", date: "Yesterday", likeStatus: false),
    // third ten ( last then days of a month )
    QuotesModel(quote: "Life is hard but you gotto keep you heads up !!!! ", date: "Today", likeStatus: true),
       QuotesModel(quote: "If you're going through hell keep going.", date: "Yesterday", likeStatus: false),
    QuotesModel(quote: "The ones who are crazy enough to think they can change the world, are the ones who do.", date: "Yesterday", likeStatus: false),
      QuotesModel(quote: "Don't raise your voice, improve your argument." , date: "Yesterday", likeStatus: false),
      QuotesModel(quote: "What seems to us as bitter trials are often blessings in disguise." , date: "Yesterday", likeStatus: false),
       QuotesModel(quote: "The meaning of life is to find your gift. The purpose of life is to give it away.", date: "Yesterday", likeStatus: false),
      QuotesModel(quote: "The distance between insanity and genius is measured only by success.", date: "Yesterday", likeStatus: false),
       QuotesModel(quote: "When you stop chasing the wrong things, you give the right things a chance to catch you.", date: "Yesterday", likeStatus: false),
      QuotesModel(quote:  "Knowledge is being aware of what you can do. Wisdom is knowing when not to do it.", date: "Yesterday", likeStatus: false),
       QuotesModel(quote: "There are two types of people who will tell you that you cannot make a difference in this world: those who are afraid to try and those who are afraid you will succeed.", date: "Yesterday", likeStatus: false)]
    
    func setQuotes() -> [QuotesModel] {
       
        return quoteModel
    }
    
    
}


