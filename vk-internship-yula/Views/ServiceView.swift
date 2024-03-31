//
//  ServiceView.swift
//  vk-internship-yula
//
//  Created by Тимур Калимуллин on 30.03.2024.
//

import SwiftUI

struct ServiceView: View {
    @Binding var title: String
    @Binding var description: String
    @Binding var iconUrl: String

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: iconUrl)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }.frame(width: 60, height: 60)
            VStack(alignment: .leading, spacing: 8) {
                Text(title).font(.title3).foregroundColor(.white)
                Text(description).font(.footnote).foregroundColor(.white)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "chevron.right").foregroundColor(.gray)
        }
        .padding(.horizontal)
        .background(.black)
    }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceView(title: .constant("test"), description: .constant("test"), iconUrl: .constant("https://publicstorage.hb.bizmrg.com/sirius/calendar.png"))
    }
}
