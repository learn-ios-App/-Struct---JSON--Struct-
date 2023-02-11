import UIKit

struct Person: Codable {
    var name: String
    var age: Int
}

let people = [
    Person(name: "Bob", age: 39),
    Person(name: "John", age: 10)
]

let jsonPeople = encodePeople(people: people)
print(jsonPeople)

let rebornPeople = decodePeople(json: jsonPeople)
print(rebornPeople)

//[Person] -> Data -> Stringの流れでエンコード
func encodePeople(people: [Person]) -> String {
    print("エンコードします")
    do {
        //実際は強制アンラップは使わない
        let jsonDate = try JSONEncoder().encode(people)
        let jsonPeople = String(data: jsonDate, encoding: .utf8)!
        return jsonPeople
    } catch {
        print("エンコード失敗しました")
        return ""
    }
}

//String -> Data -> [Person]の流れでデコード
func decodePeople(json: String) -> [Person] {
    print("デコードします")
    do {
        //実際は強制アンラップは使わない
        let jsonData = json.data(using: .utf8)!
        let people = try JSONDecoder().decode([Person].self, from: jsonData)
        return people
    } catch {
        print("デコード失敗しました")
        return []
    }
}
