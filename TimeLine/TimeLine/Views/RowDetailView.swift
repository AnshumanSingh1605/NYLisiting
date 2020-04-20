//
//  RowDetailView.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import SwiftUI

struct RowDetailView: View {
    
    @Binding var isTapped : Bool
    
    let model : ArticleModel
    
    private var imageUrl : String {
        var arrMetaData : [MediaMetadatum] = []
        for media in model.media {
            arrMetaData += media.mediaMetadata
        }
        arrMetaData = arrMetaData.filter { $0.format != .standardThumbnail }
        if arrMetaData.count > 0 {
            return arrMetaData.first?.url ?? String()
        } else {
            arrMetaData = arrMetaData.filter { $0.format == .standardThumbnail }
            return arrMetaData.first?.url ?? String()
        }
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            Constants.AppTheme.primary.value.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    ImageViewContainer(imageURL: imageUrl)
                        .background(.tertiaryBackground)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding([.top,.horizontal], 10)
                    
                    Text(model.title)
                        .fontWeight(.semibold)
                        .font(.largeTitle)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal)
                    HStack {
                      Text(model.byline)
                        .foregroundColor(.tertiary)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .font(.headline)
                        
                        Spacer()
                        
                        HStack {
                            Image.system(.calendar)
                                .foregroundColor(.tertiary)
                            
                            Text(model.publishedDate)
                                .foregroundColor(.tertiary)
                                .font(.system(size: 15))
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .onDisappear(perform: {
                self.isTapped = false
            })
        }
    }
}

//struct RowDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowDetailView()
//    }
//}
