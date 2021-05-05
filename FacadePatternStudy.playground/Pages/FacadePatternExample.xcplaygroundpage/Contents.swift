
import Foundation

class StringUtility {
    func PDFFileName(name: String) -> String {
        return "\(name).pdf"
    }
}

class FileUtility {
    let fileManager = FileManager.default

    func makePath(directory: FileManager.SearchPathDirectory, domain: FileManager.SearchPathDomainMask, fileName: String) -> URL {
        let directoryUrl = fileManager.urls(for: directory, in: domain).first!
        let destinationUrl = directoryUrl.appendingPathComponent(fileName)
        return destinationUrl
    }
    
    func FileDownload(directory: URL, url: URL) {
        let task = URLSession.shared.downloadTask(with: url) { (tmpLocalUrl, response, error) in
            if let tmpLocalUrl = tmpLocalUrl, error == nil {
                do {
                    let pdfData = try Data(contentsOf: tmpLocalUrl)
                    try pdfData.write(to: directory)
                    print("SUCCESS")
                } catch {
                    print("ERROR")
                }
            } else {
                print("ERROR");
            }
        }
        task.resume()
    }
}

class FileFacade {
    let fileUtility = FileUtility()
    let stringUtility = StringUtility()
    
    init() {  }
    
    func PDFDownload(url: String, fileName: String, directory: FileManager.SearchPathDirectory, domain: FileManager.SearchPathDomainMask) {
        guard let pdfUrl = URL(string: url) else { return }
        
        let downloadFileName = stringUtility.PDFFileName(name: fileName)
        let downloadPath = fileUtility.makePath(directory: directory, domain: domain, fileName: downloadFileName)
        
        fileUtility.FileDownload(directory: downloadPath, url: pdfUrl)
    }
    
}

///호출부
let fileFacade = FileFacade()
fileFacade.PDFDownload(url: "https://www.tutorialspoint.com/swift/swift_tutorial.pdf",
                       fileName: "PDF이름",
                       directory: .documentDirectory,
                       domain: .userDomainMask)
