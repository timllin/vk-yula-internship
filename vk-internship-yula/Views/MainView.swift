//
//  MainView.swift
//  vk-internship-yula
//
//  Created by Тимур Калимуллин on 30.03.2024.
//

import SwiftUI

struct MainView: View {
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @StateObject private var mainViewModel = MainViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(mainViewModel.services, id: \.name) { service in
                    ServiceView(title: .constant(service.name),
                                description: .constant(service.description),
                                iconUrl: .constant(service.iconUrl))
                    .onTapGesture {
                        mainViewModel.openService(service)
                    }
                    .listRowInsets(EdgeInsets())
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .scrollContentBackground(.hidden)
            .background(.black)
            .listStyle(.plain)
            .navigationTitle("Сервисы")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: mainViewModel.fetchServices)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
