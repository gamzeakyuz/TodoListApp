//
//  ListView.swift
//  TodoListApp
//
//  Created by Gamze Akyüz on 4.05.2025.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
//    @State var items: [ItemModel] = [
//        ItemModel(title: "Hi World", isCompleted: true),
//        ItemModel(title: "This is my second item", isCompleted: false),
//        ItemModel(title: "Third", isCompleted: false)
//    ]
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else {
                List {
                    ForEach(listViewModel.items) { item in
                        
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                        
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                    
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List ✏")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }

}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
