//
//  HomeScreen.swift
//  UpGrade
//
//  Created by Victor Rodriguez on 12/1/23.
//

import SwiftUI



struct HomeScreen: View {
    @StateObject var cartManager = CartManager()
    @State var isPresenting: Bool = false
    @State var searchText: String = ""
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        
     
        
        NavigationView{
            ScrollView {
              
                LazyVGrid(columns: columns, spacing:20) {
                    ForEach(productList, id: \.id) { product in ProductCard(product: product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
                
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink {
                                SignOut()
                            } label: {
                                Image(systemName: "person.circle")
                            }
                        }
                        
                        ToolbarItem(placement: .topBarLeading) {
                            NavigationLink {
                                CartView()
                                    .environmentObject(cartManager)
                            } label: {
                                CartButton(numberOfProducts: cartManager.products.count)

                            }
                        }
                        
                    }

            }.navigationTitle("UpGrade")
                .navigationBarTitleDisplayMode(.inline)
               Color("myColor")
             
        }
        
        .searchable(text: $searchText)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeScreen()
}
