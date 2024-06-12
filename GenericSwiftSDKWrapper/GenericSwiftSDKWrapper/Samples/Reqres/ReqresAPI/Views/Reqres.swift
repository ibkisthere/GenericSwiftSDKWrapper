
import SwiftUI

// now we can easily call methods to fetch data and display in the view ,

//all the calls to the api endpoints have been wrapped for easy use 


struct ReqresContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ReqresContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
