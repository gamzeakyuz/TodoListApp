//
//  NoItemsView.swift
//  TodoListApp
//
//  Created by Gamze Akyüz on 5.05.2025.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    @State var accentColor: Color = .accentColor
    @State var secondaryAccentColor: Color = .secondaryAccent
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text(" There are no items! ")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text(" Are you a productive person? I think you should click the add button and add a bunch of items to your todo list! ")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: AddView()) {
                    Text(" add something 🖇️")
                            .foregroundColor(.pink)
                            .font(.headline)
                            .frame(height: 60)
                            .frame(maxWidth: .greatestFiniteMagnitude)
                            .background(animate ? accentColor : secondaryAccentColor)
                            .cornerRadius(10)
                            .padding()
                }
                    .padding(.horizontal, animate ? 30 : 50)
                    .shadow(
                        color: animate ? accentColor.opacity(0.7) : secondaryAccentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0.0,
                        y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(50)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
