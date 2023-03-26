

import UIKit
import Alamofire


struct api: Codable{
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var datatable: UITableView!
    var arr : [api] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getApi()
    }
    

    

    
    func getApi() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        var ur = URLRequest(url: url!)
        ur.httpMethod = "GET"

        URLSession.shared.dataTask(with: ur) { data, response, error in
            do{
            if error == nil{
                    self.arr = try JSONDecoder().decode([api].self, from: data!)
//                    print(self.arr)
                    DispatchQueue.main.async {
                        self.datatable.reloadData()
                    }
                }
            }
            catch{
                print(error.localizedDescription)
            }
          }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = datatable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.lb1.text = "\(arr[indexPath.row].id)"
        cell.lb2.text = arr[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
//    func getApi(){
//        AF.request("https://jsonplaceholder.typicode.com/posts",method: .get).responseData { response in
//            switch response.result{
//            case .success(let data):
//                do {
//                    if data == response.value{
//                        self.arr = try JSONDecoder().decode([api].self     , from: data)
//                        DispatchQueue.main.async {
//                            self.datatable.reloadData()
//                        }
//                    }
//                }
//                catch {
//                    print(error.localizedDescription)
//                }
//
//
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//
//        }
//
//    }
}

