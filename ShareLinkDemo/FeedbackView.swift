import SwiftUI

struct FeedbackView: View {
    @State private var feedbackMessage: String = ""
    @State private var selectedFeedback: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            // 上部の「GOOD」ボタンと「MORE」ボタン
            HStack(spacing: 20) {
                Button(action: {
                    selectedFeedback = "GOOD"
                }) {
                    Text("GOOD")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.yellow)
                        .cornerRadius(10)
                }

                Button(action: {
                    selectedFeedback = "MORE"
                }) {
                    Text("MORE")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }

            // ドロップダウン風のボックス（下矢印付き）
            HStack {
                Text(selectedFeedback.isEmpty ? "選択してください" : selectedFeedback)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .padding(.trailing)
            }
            .frame(height: 50)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))

            // メッセージ入力用テキストフィールド
            TextEditor(text: $feedbackMessage)
                .frame(height: 200)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                .overlay(
                    VStack {
                        if feedbackMessage.isEmpty {
                            Text("ここにメッセージを書くよ")
                                .foregroundColor(.gray)
                                .padding(.top, 8)
                                .padding(.leading, 8)
                        }
                        Spacer()
                    }
                )

            // 送信ボタン
            Button(action: {
                // 送信処理をここに実装
            }) {
                HStack {
                    Spacer()
                    Text("より")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
                }
            }
            .frame(height: 50)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
        }
        .padding()
        .background(Color(UIColor.systemBackground))  // 背景色
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
