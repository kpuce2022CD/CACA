typealias LaunchData = LaunchListQuery.Data.Launch

struct Launches: Decodable {
    var cursor : String
    var hasMore : Bool
    
    init(){
        self.cursor = ""
        self.hasMore = false
    }
    
    init(_ launches: LaunchData?){
        self.cursor = launches?.cursor ?? ""
        self.hasMore = launches?.hasMore ?? false
    }

}
