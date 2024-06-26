
import SwiftUI

// now we can easily call methods to fetch data and display in the view ,

//all the calls to the api endpoints have been wrapped
import Combine

struct ReqresContentView: View {
    @ObservedObject var viewModel = JSONPlaceholderViewModel()
    var body: some View {
        VStack {
                if let response = viewModel.response {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(0..<10) { _ in
                                Text(response)
                            }
                        }
                    }
                    .frame(height: 700)
                    } else if let error = viewModel.error {
                        Text(error)
                    } else {
                        Text("Loading...")
                    }
                }
                .onAppear {
                    viewModel.fetchUsers()
                }
    }
}

struct ReqresContentView_Previews: PreviewProvider {
    static var previews: some View {
        ReqresContentView()
    }
}
