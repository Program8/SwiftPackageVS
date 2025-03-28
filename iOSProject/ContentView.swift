//
//  ContentView.swift
//  iOSProject
//
//  Created by Vijay Sachan on 3/24/25.
//
import SwiftUI
import MySwiftPackage
struct ContentView: View {
    let fontTitle = Font.title2
    let fontSubTitle = Font.title3
    @State private var fileContents: String = " "
    var body: some View{
        VStack{
            Text("This screen demonstrates how to access different types of files from \"Swift Packages\"")
            List{
                Section(header: Text("1. Access Class").font(.headline)) {
                    VStack (alignment: .leading){
                        Text("\(MyClass().getMessage())").font(fontTitle)
                        
                    }
                }
                Section(header: Text("2. Access image from asset catalog").font(.headline)) {
                    VStack {
                            Image(uiImage: MyResources.shared.getImage(name: .apple))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .frame(maxWidth: .infinity)  // Makes sure the image takes up available space
                                .clipped()  // Ensures the image does not overflow its bounds
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                }
                Section(header: Text("3. Access color from asset catalog").font(.headline)) {
                    Text("This is a custom color from the Swift Package").foregroundStyle(Color(uiColor: MyResources.shared.getColor(name: .Crimson)))
                                    .padding()
                    
                }
                Section(header: Text("4. Access SwiftUI View").font(.headline)) {
                    VStack {
                        CustomButton(title: "Click Me", backgroundColor: .blue, textColor: .white) {
                            print("Button tapped!")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                                    
                    
                }
                Section(header: Text("5. Access .txt file").font(.headline)) {
                    VStack {
                                if fileContents.isEmpty {
                                    Text("Loading...")
                                        .onAppear {
                                            loadTextFile()
                                        }
                                } else {
                                    Text(fileContents)
                                        .padding()
                                }
                            }
                                    
                    
                }
                Section(header: Text("6. Access Localized Strings ").font(.headline)) {
                    VStack {
                        Text(MyResources.shared.localizedStr(name:.hello))
                            .padding()
                            }
                                    
                    
                }
            }.scrollIndicators(.visible)
        }.padding()
        
    }
    func loadTextFile() {
           // Access the text file bundled in the package
        if let fileURL = MyResources.shared.getResourceURL(fileName: "text", fileExtension: "txt") {
               do {
                   // Read the contents of the file as a string
                   let text = try String(contentsOf: fileURL)
                   // Update the state with the contents
                   fileContents = text
               } catch {
                   fileContents="Failed to read text file: \(error)"
               }
        }else{
            fileContents="Failed to load text file"
        }
       }
}
#Preview {
    ContentView()
}
