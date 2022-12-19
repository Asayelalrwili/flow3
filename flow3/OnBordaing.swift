//
//  OnBoarding.swift
//  Ivy
//
//  Created by Alaa Alabdullah on 14/12/2022.
//

import SwiftUI

enum OnbordingType: CaseIterable {
    case scan
    case track
    case remind
    
    
    
    var image: String {
        switch self {
        case .scan:
            return "read"
        case .track:
            return "help"
        case .remind:
            return "clear"
            
        }
    }
    
    
    var description: String {
        switch self {
        case .scan:
            return "انشطه يويمه تمدك بالسعادة وتحرر عقلك من الافكار السلبيه."
        case .track:
            return "شارك كل مشاعرك بثقه وصراحه فكلنا داعمون على نفس الطريق."
        case .remind:
            return "مستعد تتخطى و تكون لنفسك ولمجتمعك داعم ؟"
            
            
        }
        
    }
}

struct OnbordingView: View {
    
    var selectedOnbordingType: OnbordingType = .scan
    
    
    var body: some View {
        
        ZStack {
            
                TabView {
                    
                    ForEach(OnbordingType.allCases, id: \.description) { onbording in
                        SingleOnbording(onbordingType: onbording)
                    }
                    
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            
        }
    }
}

struct OnbordingView_Previews: PreviewProvider {
    static var previews: some View {
        OnbordingView()
    }
}

struct SingleOnbording: View {
    
    let onbordingType: OnbordingType
    
    @State private var showLogingPage = false
    @State private var showTabViewPage = false
    
    var body: some View {
        
        
            VStack {
                Button("skip"){
                    showTabViewPage.toggle()
                }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing ,30)
                    .foregroundColor(.secondary)
                    .fullScreenCover(isPresented: $showTabViewPage) {
                        EmptyView()
                    }
                
                Spacer()
            
                Image(onbordingType.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                Text(onbordingType.description)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                
                if onbordingType == .remind {
                    
                       // SignFace()
                        //SignupID()
                        
                    
                }
               Spacer()
                
                
            }
            .padding(.horizontal,40)
            
        
        }
        

        
    }
