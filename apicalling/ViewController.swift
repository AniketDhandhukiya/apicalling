

import UIKit
import Alamofire




class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var datatable: UITableView!
    var arr : [WelcomeElement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dda()
        searchbar.placeholder = "search here..."
    }
    

    

    
//    func getApi() {
//        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
//        var ur = URLRequest(url: url!)
//        ur.httpMethod = "GET"
//
//        URLSession.shared.dataTask(with: ur) { data, response, error in
//            do{
//            if error == nil{
//                    self.arr = try JSONDecoder().decode([api].self, from: data!)
////                    print(self.arr)
//                    DispatchQueue.main.async {
//                        self.datatable.reloadData()
//                    }
//                }
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//          }.resume()
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = datatable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.lb1.text = "\(arr[indexPath.row].name!.common)"
        cell.lb2.text = "\(arr[indexPath.row].name!.official)"
        cell.imgview.image = stringToImg(link: arr[indexPath.row].flags!.png)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 173
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
    
    
    
    func dda(){
        AF.request("https://restcountries.com/v3.1/all",method: .get).responseData { respo in
            switch respo.result{
            case.success(let data):
                do {
                    if data == respo.value{
                        self.arr = try JSONDecoder().decode([WelcomeElement].self, from: data)
                        DispatchQueue.main.async {
                            self.datatable.reloadData()
                        }
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
}
    
    func stringToImg(link: String)-> UIImage?{
        let url1 = URL(string: link)
        var data = try? Data(contentsOf: url1! as URL)
        
        return UIImage(data: data!)
    }

}
