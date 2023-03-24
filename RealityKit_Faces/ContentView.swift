//
//  ContentView.swift
//  RealityKit_Faces
//
//  Created by Peter Rogers on 24/03/2023.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @ObservedObject var arViewModel : ARViewModel = ARViewModel()
    @State private var showGlasses = false
    @State private var showHat = false
    
    var body: some View {
        VStack{
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
            HStack{
                Button(showGlasses ? "Hide Glasses" : "Show Glasses") {
                    showGlasses.toggle()
                    arViewModel.showSunglasses(show:showGlasses)
                }
                .buttonStyle(BlueButton())
                
                Button(showHat ? "Hide Hat" : "Show Hat") {
                    showHat.toggle()
                    arViewModel.showHat(show:showHat)
                }
                .buttonStyle(BlueButton())
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    var arViewModel: ARViewModel
    
    func makeUIView(context: Context) -> ARView {
        return arViewModel.arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
