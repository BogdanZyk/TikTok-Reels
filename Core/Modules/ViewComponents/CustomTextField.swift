//
//  CustomTextField.swift
//  TikTok Reels (iOS)
//
//  Created by Bogdan Zykov on 02.09.2022.
//


import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var promt: String = "Text here"
    var font: Font = .system(size: 16)
    var height: CGFloat = 44
    var cornerRadius: CGFloat = 10
    var isSecureTF: Bool = false
    var isFocused: Bool = false
    @State private var showPass: Bool = false
    var body: some View {
        HStack{
            dinamicTextFieldView(showPass)
            Spacer()
            if isSecureTF{
                eyeButton
            }
        }
        .foregroundColor(.black)
        .padding(.horizontal, 20)
        .frame(height: height)
        .hLeading()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .font(font)
        .onAppear {
            showPass = isSecureTF
        }
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            CustomTextField(text: .constant("dffdf"))
                .padding()
                .preferredColorScheme(.dark)
        }
    }
}

extension CustomTextField{
    
    private func dinamicTextFieldView(_ isSecure: Bool) -> some View{
        Group{
          if isSecure {
                SecureField(text: $text) {
                    Text(promt)
                        
                }
            }else{
                TextField(text: $text) {
                    Text(promt)
                }
            }
        }
    }
    private var eyeButton: some View{
        Button {
            showPass.toggle()
        } label: {
            Image(systemName: showPass ? "eye.fill" : "eye.slash.fill")
                .font(.callout)
                .foregroundColor(.secondary)
        }
    }
}
