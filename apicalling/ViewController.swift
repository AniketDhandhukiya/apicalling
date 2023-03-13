

import UIKit


struct api: Codable{
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

class ViewController: UIViewController {

    var arr : [api] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getApi()
    }

    
    func getApi(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        var ur = URLRequest(url: url!)
        ur.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: ur) { data, response, error in
            do{
                if error == nil{
                    self.arr = try JSONDecoder().decode([api].self, from: data!)
                    print(self.arr)
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
    }

}

