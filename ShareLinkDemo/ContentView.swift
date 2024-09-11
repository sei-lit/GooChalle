import SwiftUI

struct ContentView: View {
    // フィードバックの内容を保存するためのState変数
    @State private var feedbackText: String = ""
    
    // UIImageを取得するための状態変数
    @State private var image: UIImage? = UIImage(named: "exampleImage")
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("フィードバックを送る")
                    .font(.largeTitle)
                    .padding(.top, 20)
                
                TextEditor(text: $feedbackText)
                    .border(Color.gray, width: 1)
                    .frame(height: 200)
                    .padding()
                
                // 画像表示を追加
                if let uiImage = image {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding()
                }

                // 安全にオプショナルを処理して、ShareLinkでUIImageを共有
                if let uiImage = image {
                    ShareLink(item: uiImage, preview: SharePreview("フィードバック画像", image: uiImage)) {
                        Image(systemName: "square.and.arrow.up")
                        Text("フィードバックを画像と共に共有")
                    }
                    .padding()
                }
                
                // テキストのみのShareLink
                ShareLink(item: feedbackText) {
                    Image(systemName: "square.and.arrow.up")
                    Text("フィードバックをテキストで共有")
                }
                .padding()

                Spacer()
            }
            .padding()
            .navigationTitle("フィードバック")
        }
    }
}

struct Photo: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }


    public var image: Image
    public var caption: String
}

@main
struct FeedbackApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

#Preview {
    ContentView()
}
