//
//  TimeLineViewModel.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import Foundation
import Combine
import EndPoints

final class TimeLineViewModel : ObservableObject {
    
    @Published var arrArticles : [ArticleModel] = []
    
    @Published var showAlert = false
    @Published var alertMessage : AlertMessages = .none
    
    @Published var isLoaderShowing = false
    
    @Published var copyright = String()
    
    init() {
        fetchArticles()
    }

    func fetchArticles() {
        self.isLoaderShowing = true
        
        UserEndpoints.fetchListing(UserDefaultsManager.shared.period).requestWithGenerics { (isSuccess, statuscode, model : ListingModel?, error) in
            
            self.isLoaderShowing = false
            
            if error != nil {
                self.alertMessage = .customOptional(error?.message)
                self.showAlert.toggle()
            } else {
                guard let _model = model else {
                    self.alertMessage = .serverError
                    self.showAlert.toggle()
                    return
                }
                self.copyright = _model.copyright
                self.arrArticles = _model.results
            }
        }
    }    
}
