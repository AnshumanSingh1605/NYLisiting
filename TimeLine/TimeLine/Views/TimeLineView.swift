//
//  TimeLineView.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import SwiftUI
import EndPoints

struct TimeLineView : View  {
    
    private let periodChangePublisher = NotificationCenter.default.publisher(for: .periodValueChanged)
    
    @Binding var showMenu: Bool
    @Binding var showCancelButton : Bool
        
    @State private var searchText : String = String()
        
    @State private var arrArticles : [ArticleModel] = []
    
    @State private var showAlert = false
    @State private var alertMessage : AlertMessages = .none
    
    @State private var isLoaderShowing = false
    
    @State private var copyright = String()
    
    @State private var navigationIndex : Int? = nil

    var body: some View {
        LoaderView(isShowing: self.$isLoaderShowing) {
            ZStack(alignment: .topLeading) {
                VStack(alignment: .leading, spacing: 10) {
                    if self.showCancelButton {
                        // Search view
                        HStack {
                            HStack {
                                Image.system(.search)
                                    .foregroundColor(.secondary)
                                
                                TextField("search", text: self.$searchText, onEditingChanged: { isEditing in
                                    self.showCancelButton = true
                                }, onCommit: {
                                    print("onCommit")
                                })
                                .foregroundColor(.secondary)
                                
                                Button(action: {
                                    self.searchText = ""
                                }) {
                                    Image.system(.cross)
                                        .opacity(self.searchText == "" ? 0 : 1)
                                }
                            }
                            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                            .background(.shadow)
                            .cornerRadius(10.0)
                            
                            if self.showCancelButton  {
                                Button("Cancel") {
                                    UIApplication.shared.endEditing(true)
                                    self.searchText = ""
                                    self.showCancelButton = false
                                }
                                .foregroundColor(Color(.systemBlue))
                            }
                        }
                        .padding([.horizontal,.top])
                        .animation(.spring())
                    }
                    
                    List {
                        
                        ForEach(self.arrArticles.filter{ $0.title.hasPrefix(self.searchText) } , id: \.id) { article in
                            ArticleRowView(article: article)
                        }
                        .padding(.trailing, -15)
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Spacer()
                            
                            Text(self.copyright)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(2)
                                .foregroundColor(.tertiary)
                                .font(.footnote)
                                .padding(.top, 10)
                            
                            Spacer()
                        }
                        
                        Spacer().frame(height : 20)
                    }
                    .background(.primary)
                }
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .resignKeyboardOnDragGesture()
        .alert(isPresented: self.$showAlert) {
            Alerts.showAlert(message: self.alertMessage, dismiss: .ok(nil))
        }
        .onAppear() {
            self.fetchArticles()
        }
        .onReceive(periodChangePublisher) { (output) in
            self.arrArticles = []
            self.fetchArticles()
        }
    }
    
    // MARK:- Private methods for netwokr communication
    
    private func fetchArticles() {
        self.isLoaderShowing = true
        
        UserEndpoints.fetchListing(UserDefaultsManager.shared.period).requestWithGenerics { (isSuccess, statuscode, model : ListingModel?, error) in
            
            self.isLoaderShowing = false
            
            if let _error = error {
                switch _error {
                case .internetUnavailable : Utility.showAlert(message: _error.message, completion: Utility.moveToSettings)
                default : self.alertMessage = .customOptional(error?.message)
                self.showAlert.toggle()
                }
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
    
    // MARK:- Private objc method
    func didPeriodValueChange() {
        self.fetchArticles()
    }
}

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineView(showMenu: .constant(false), showCancelButton: .constant(false))
    }
}
