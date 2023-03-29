

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var datatable: UITableView!
    var arr : [WelcomeElement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dda()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = datatable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.lb1.text = "\(arr[indexPath.row].name!.common)"
        cell.lb2.text = "\(arr[indexPath.row].population!)"
        cell.imgview.image = stringToImg(link: arr[indexPath.row].flags!.png)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController1") as! ViewController1
        navigationController?.pushViewController(navigate, animated: true)
        navigate.label11 = "\(arr[indexPath.row].name!.common)"
        navigate.label21 = arr[indexPath.row].population!.description
        navigate.img1 = stringToImg(link: arr[indexPath.row].flags!.png)!
        navigate.img2 = stringToImg(link: arr[indexPath.row].coatOfArms!.png!)!
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 173
    }
    
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
