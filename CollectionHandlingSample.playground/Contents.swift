import Foundation

// 本のカテゴリ
enum BookCategory: String {
    case arts = "アート"
    case business = "ビジネス"
    case comics = "コミック"
}

// 本
struct Book: CustomStringConvertible {
    // タイトル
    var title: String
    
    // 価格
    var price: Int
    
    // 在庫数
    var stock: Int
    
    // カテゴリ（未分類の場合はnil）
    var category: BookCategory?
    
    var description: String {
        return " - \(title), \(price)円, \(stock)冊, \(category?.rawValue ?? "未分類")"
    }
}

let books = [Book(title: "アートオブアート", price: 3000, stock:30, category: .arts),
             Book(title: "ビジネスのきほん", price: 1500, stock:5, category: .business),
             Book(title: "おもしろコミック", price: 500, stock:20, category: .comics),
             Book(title: "昆虫図鑑", price: 2500, stock:30, category: nil),
             Book(title: "ビジネス英会話", price: 1000, stock:50, category: .business),
             Book(title: "いぬとねこ", price: 900, stock:80, category: nil)]

let myMoney = 1000

// filterの例
print("価格が1000円未満の本のみを抽出する")
books.filter { $0.price < 1000 }
    .forEach { print($0.description) }

print("ビジネスカテゴリの本を抽出する")
books.filter { $0.category == .business }
    .forEach { print($0.description) }

// mapの例
print("全ての本の価格を20%オフにし、タイトルの先頭に「(特価)」を追加")
books.map {
    (book: Book) -> Book in
    var discountBook = book
    discountBook.title = "(特価)" + book.title
    discountBook.price = Int(Double(book.price) * 0.8)
    return discountBook
    }.forEach { print($0.description) }

// reduceの例
print("全ての在庫の合計金額を計算する")
let totalPrice = books.reduce(0) { $0 + $1.price * $1.stock }
print(" - 合計金額は\(totalPrice)円です。")

// flatMapの例
print("カテゴリの一覧を抽出する")
Set(books.flatMap { $0.category }).forEach { print(" - \($0)") }