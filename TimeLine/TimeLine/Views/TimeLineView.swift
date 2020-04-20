//
//  TimeLineView.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import SwiftUI

struct TimeLineView : View {
    
    @Binding var showMenu: Bool
    @ObservedObject var viewModel : TimeLineViewModel
    
    init(showMenu : Binding<Bool>) {
        self._showMenu = showMenu
        self.viewModel = TimeLineViewModel()
    }
    
    var body: some View {
        LoaderView(isShowing: $viewModel.isLoaderShowing) {
            VStack(alignment: .leading, spacing: 10) {
                List {
                    ForEach(self.viewModel.arrArticles, id: \.id) { article in
                       // ArticleRowView(article: article)
                        NavigationLink(destination: RowDetailView(model: article)) {
                            ArticleRowView(article: article)
                        }
                    }
                }
                
                HStack {
                    
                   Spacer()
                    
                   Text(self.viewModel.copyright)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                    .foregroundColor(Color.red)
                    .font(.footnote)
                    .padding(.top, 10)
                    
                    Spacer()
                }
                
            }
        }
    }
}

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineView(showMenu: .constant(false))
    }
}
