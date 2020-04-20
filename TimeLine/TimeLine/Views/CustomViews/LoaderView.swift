//
//  LoaderView.swift
//  TimeLine
//
//  Created by Anshuman on 20/04/20.
//  Copyright © 2020 Anshuman Singh. All rights reserved.
//

import SwiftUI
import UIKit

struct ActivityIndicator : UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView
    
    @Binding var isAnimating : Bool
    fileprivate var configuration = { (indicator: UIView) in }
    var style : UIActivityIndicatorView.Style = .large
    var color : Color = .gray

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: style)
        activityIndicator.color = .lightGray
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct LoaderView<Content>: View where Content: View {

    @Binding var isShowing: Bool
    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)

                VStack(spacing :20) {
                    ActivityIndicator(isAnimating: .constant(true)).zIndex(2)
                    Text.text(.pleaseWait)
                        .foregroundColor(Color(white: 0.5))
                        .fontWeight(.semibold)
                }
                .frame(width: 150, height: 150, alignment: .center)
                .background(.base)
                .cornerRadius(20)
                .shadow(color: Constants.AppTheme.shadow.value, radius: 5)
                .opacity(self.isShowing ? 1 : 0)
            }
        }
    }

}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(isShowing: .constant(true)) {
            NavigationView {
                List(["1", "2", "3", "4", "5"], id: \.self) { row in
                    Text(row)
                }.navigationBarTitle(Text("A List"), displayMode: .large)
            }
        }
    }
}
