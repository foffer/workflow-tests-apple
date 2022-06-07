//
//  UploadView.swift
//  WorkflowTest
//
//  Created by Christoffer Buusmann on 06/06/2022.
//

import SwiftUI

struct UploadView: View {
    @StateObject var viewModel = UploadViewModel()
    
    var body: some View {
        Text("This view will configure the upload action")
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}


class UploadViewModel: ObservableObject {
    // ... dummy view model
}
