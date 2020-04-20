//
//  ArticleRowView.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import SwiftUI

struct ArticleRowView: View {
    
    @State private var isTapped = false
    let article : ArticleModel
    
    var imageUrl : String
    
    init(article : ArticleModel) {
        self.article = article
        self.imageUrl = String()
        if let url = article.media.first?.mediaMetadata.first?.url {
            self.imageUrl = url
        }
    }
    
    var body: some View {
        ZStack {
            Group {
                NavigationLink(destination:
                LazyView { RowDetailView(isTapped: self.$isTapped,model: self.article) } , isActive: self.$isTapped) {
                    EmptyView()
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        ImageViewContainer(imageURL: imageUrl)
                            .frame(width: 75, height: 75)
                            .background(.tertiaryBackground)
                            .clipShape(Circle())
                            //.cornerRadius(30)
                            //.border(Color.gray, width: 1.0).clipped()
                            .overlay(
                                RoundedRectangle(cornerRadius: 37.5)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading, spacing: 15) {
                            Text(article.title)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(2)
                                .font(.headline)
                            
                            HStack {
                              Text(article.byline)
                                .foregroundColor(.tertiary)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(2)
                                .font(.callout)
                                
                                Spacer()
                                
                                Image.system(.calendar)
                                    .foregroundColor(.tertiary)
                                
                                Text(article.publishedDate)
                                    .foregroundColor(.tertiary)
                                    .font(.system(size: 15))
                            }
                        }
                        

                        Image.system(.disclosure)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(.secondary)
                    }
                    Spacer().frame(height : 20)
                    
                }
            }
        }
        .onTapGesture {
            withAnimation {
                self.isTapped.toggle()
            }
        }
//        .overlay(
//            Image.system(.disclosure)
//                .foregroundColor(Color.red)
//            , alignment: .trailing)
        
//        .overlay(
//        HStack(spacing : 5) {
//            Image.system(.calendar)
//                .foregroundColor(.tertiary)
//
//            Text(article.publishedDate)
//                .foregroundColor(.tertiary)
//                .font(.system(size: 15))
//        }
//        .padding(.bottom, 10)
//        , alignment: .bottomTrailing)
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        
//        "media":[{"type":"image","subtype":"photo","caption":"Commuters wait for the J train at Broadway Junction in East New York, Brooklyn on Wednesday.","copyright":"Juan Arredondo for The New York Times","approved_for_syndication":1,"media-metadata":[{"url":"https://static01.nyt.com/images/2020/04/17/us/17VIRUS-CITIES-NYC-copy/17VIRUS-CITIES-NYC-copy-thumbStandard.jpg","format":"Standard Thumbnail","height":75,"width":75},{"url":"https://static01.nyt.com/images/2020/04/17/us/17VIRUS-CITIES-NYC-copy/17VIRUS-CITIES-NYC-copy-mediumThreeByTwo210.jpg","format":"mediumThreeByTwo210","height":140,"width":210},{"url":"https://static01.nyt.com/images/2020/04/17/us/17VIRUS-CITIES-NYC-copy/17VIRUS-CITIES-NYC-copy-mediumThreeByTwo440.jpg","format":"mediumThreeByTwo440","height":293,"width":440}]}],"eta_id":0},{"uri":"nyt://article/5b64dd26-012d-5099-a923-d271064c6230","url":"https://www.nytimes.com/reuters/2020/04/19/business/19reuters-neimanmarcus-bankruptcy-exclusive.html","id":100000007095726,"asset_id":100000007095726,"source":"Reuters Group PLC","published_date":"2020-04-19","updated":"2020-04-19 07:03:03","section":"Business","subsection":"","nytdsection":"business","adx_keywords":"","column":null,"byline":"By Reuters","type":"Article","title":"Exclusive: Neiman Marcus to File for Bankruptcy as Soon as This Week-Sources","abstract":"Neiman Marcus Group is preparing to seek bankruptcy protection as soon as this week, becoming the first major U.S. department store operator to succumb to the economic fallout from the coronavirus outbreak, people familiar with the matter said.","des_facet":[],"org_facet":[],"per_facet":[],"geo_facet":[],"media":[],"eta_id":0}
        Group {
        ArticleRowView(article: ArticleModel(id: 100000007091970, uri: "nyt://article/7a907dc6-8651-52b0-9952-84c7f6a0658f",
                                            url:"https://www.nytimes.com/2020/04/19/us/coronavirus-moving-city-future.html",
                                             assetID: 100000007091970,
                                             source: "New York Times",
                                             publishedDate: "2020-04-19",
                                             updated: "2020-04-20 00:18:30",
                                             section: "U.S.",
                                             subsection: "",
                                             nytdsection: "",
                                             adxKeywords: "",
                                             byline: "By Sabrina Tavernise and Sarah Mervosh",
                                             type: "Article",
                                             title: "America’s Biggest Cities Were Already Losing Their Allure. What Happens Next?",
                                             abstract: "",
                                             desFacet: [""],
                                             orgFacet: [""],
                                             perFacet: [""],
                                             geoFacet: [""],
                                             media: [Media(type: .image, subtype: .photo, caption: "Commuters wait for the J train at Broadway Junction in East New York, Brooklyn on Wednesday.", copyright: "Juan Arredondo for The New York Times", approvedForSyndication: 1, mediaMetadata: [MediaMetadatum(url: "https://static01.nyt.com/images/2020/04/17/us/17VIRUS-CITIES-NYC-copy/17VIRUS-CITIES-NYC-copy-thumbStandard.jpg", format: .standardThumbnail, height: 75, width: 75)])],
                                             etaID: 1)
            )
            .environment(\.colorScheme, .dark)
        }
    }
}
