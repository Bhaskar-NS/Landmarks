//
//  ContentView.swift
//  Shared
//
//  Created by Bhaskar on 06/01/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModalData())
    }
}
