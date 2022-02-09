// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class QueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Query($userId: String, $userEmail: String, $findPwUserId2: String, $repoListUserId2: String, $selectProfilePicUserId2: String, $checkUserUserId2: String, $repoName: String, $selectRepoRepoName2: String, $repoEc2Ip: String, $logRepoRepoName2: String) {
      User {
        __typename
        user_id
        user_pw
        user_name
        user_email
        profilePic
        about
        contact
      }
      Repository {
        __typename
        repo_name
        repo_ec2_ip
      }
      mapping_repo_user {
        __typename
        user_id
        repo_name
      }
      login(user_id: $userId) {
        __typename
        user_id
        user_pw
        user_name
        user_email
        profilePic
        about
        contact
      }
      findId(user_email: $userEmail) {
        __typename
        user_id
        user_pw
        user_name
        user_email
        profilePic
        about
        contact
      }
      findPw(user_id: $findPwUserId2) {
        __typename
        user_id
        user_pw
        user_name
        user_email
        profilePic
        about
        contact
      }
      repoList(user_id: $repoListUserId2) {
        __typename
        user_id
        repo_name
      }
      select_profilePic(user_id: $selectProfilePicUserId2) {
        __typename
        user_id
        user_pw
        user_name
        user_email
        profilePic
        about
        contact
      }
      checkUser(user_id: $checkUserUserId2) {
        __typename
        user_id
        user_pw
        user_name
        user_email
        profilePic
        about
        contact
      }
      groupUser(repo_name: $repoName) {
        __typename
        user_id
        repo_name
      }
      select_repo(repo_name: $selectRepoRepoName2) {
        __typename
        repo_name
        repo_ec2_ip
      }
      select_ec2(repo_ec2_ip: $repoEc2Ip) {
        __typename
        repo_name
        repo_ec2_ip
      }
      log_repo(repo_name: $logRepoRepoName2) {
        __typename
        commit_msg
        date
        commit_id
        user_id
      }
    }
    """

  public let operationName: String = "Query"

  public var userId: String?
  public var userEmail: String?
  public var findPwUserId2: String?
  public var repoListUserId2: String?
  public var selectProfilePicUserId2: String?
  public var checkUserUserId2: String?
  public var repoName: String?
  public var selectRepoRepoName2: String?
  public var repoEc2Ip: String?
  public var logRepoRepoName2: String?

  public init(userId: String? = nil, userEmail: String? = nil, findPwUserId2: String? = nil, repoListUserId2: String? = nil, selectProfilePicUserId2: String? = nil, checkUserUserId2: String? = nil, repoName: String? = nil, selectRepoRepoName2: String? = nil, repoEc2Ip: String? = nil, logRepoRepoName2: String? = nil) {
    self.userId = userId
    self.userEmail = userEmail
    self.findPwUserId2 = findPwUserId2
    self.repoListUserId2 = repoListUserId2
    self.selectProfilePicUserId2 = selectProfilePicUserId2
    self.checkUserUserId2 = checkUserUserId2
    self.repoName = repoName
    self.selectRepoRepoName2 = selectRepoRepoName2
    self.repoEc2Ip = repoEc2Ip
    self.logRepoRepoName2 = logRepoRepoName2
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "userEmail": userEmail, "findPwUserId2": findPwUserId2, "repoListUserId2": repoListUserId2, "selectProfilePicUserId2": selectProfilePicUserId2, "checkUserUserId2": checkUserUserId2, "repoName": repoName, "selectRepoRepoName2": selectRepoRepoName2, "repoEc2Ip": repoEc2Ip, "logRepoRepoName2": logRepoRepoName2]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("User", type: .list(.object(User.selections))),
        GraphQLField("Repository", type: .list(.object(Repository.selections))),
        GraphQLField("mapping_repo_user", type: .list(.object(MappingRepoUser.selections))),
        GraphQLField("login", arguments: ["user_id": GraphQLVariable("userId")], type: .list(.object(Login.selections))),
        GraphQLField("findId", arguments: ["user_email": GraphQLVariable("userEmail")], type: .list(.object(FindId.selections))),
        GraphQLField("findPw", arguments: ["user_id": GraphQLVariable("findPwUserId2")], type: .list(.object(FindPw.selections))),
        GraphQLField("repoList", arguments: ["user_id": GraphQLVariable("repoListUserId2")], type: .list(.object(RepoList.selections))),
        GraphQLField("select_profilePic", arguments: ["user_id": GraphQLVariable("selectProfilePicUserId2")], type: .list(.object(SelectProfilePic.selections))),
        GraphQLField("checkUser", arguments: ["user_id": GraphQLVariable("checkUserUserId2")], type: .list(.object(CheckUser.selections))),
        GraphQLField("groupUser", arguments: ["repo_name": GraphQLVariable("repoName")], type: .list(.object(GroupUser.selections))),
        GraphQLField("select_repo", arguments: ["repo_name": GraphQLVariable("selectRepoRepoName2")], type: .list(.object(SelectRepo.selections))),
        GraphQLField("select_ec2", arguments: ["repo_ec2_ip": GraphQLVariable("repoEc2Ip")], type: .list(.object(SelectEc2.selections))),
        GraphQLField("log_repo", arguments: ["repo_name": GraphQLVariable("logRepoRepoName2")], type: .list(.object(LogRepo.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: [User?]? = nil, repository: [Repository?]? = nil, mappingRepoUser: [MappingRepoUser?]? = nil, login: [Login?]? = nil, findId: [FindId?]? = nil, findPw: [FindPw?]? = nil, repoList: [RepoList?]? = nil, selectProfilePic: [SelectProfilePic?]? = nil, checkUser: [CheckUser?]? = nil, groupUser: [GroupUser?]? = nil, selectRepo: [SelectRepo?]? = nil, selectEc2: [SelectEc2?]? = nil, logRepo: [LogRepo?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "User": user.flatMap { (value: [User?]) -> [ResultMap?] in value.map { (value: User?) -> ResultMap? in value.flatMap { (value: User) -> ResultMap in value.resultMap } } }, "Repository": repository.flatMap { (value: [Repository?]) -> [ResultMap?] in value.map { (value: Repository?) -> ResultMap? in value.flatMap { (value: Repository) -> ResultMap in value.resultMap } } }, "mapping_repo_user": mappingRepoUser.flatMap { (value: [MappingRepoUser?]) -> [ResultMap?] in value.map { (value: MappingRepoUser?) -> ResultMap? in value.flatMap { (value: MappingRepoUser) -> ResultMap in value.resultMap } } }, "login": login.flatMap { (value: [Login?]) -> [ResultMap?] in value.map { (value: Login?) -> ResultMap? in value.flatMap { (value: Login) -> ResultMap in value.resultMap } } }, "findId": findId.flatMap { (value: [FindId?]) -> [ResultMap?] in value.map { (value: FindId?) -> ResultMap? in value.flatMap { (value: FindId) -> ResultMap in value.resultMap } } }, "findPw": findPw.flatMap { (value: [FindPw?]) -> [ResultMap?] in value.map { (value: FindPw?) -> ResultMap? in value.flatMap { (value: FindPw) -> ResultMap in value.resultMap } } }, "repoList": repoList.flatMap { (value: [RepoList?]) -> [ResultMap?] in value.map { (value: RepoList?) -> ResultMap? in value.flatMap { (value: RepoList) -> ResultMap in value.resultMap } } }, "select_profilePic": selectProfilePic.flatMap { (value: [SelectProfilePic?]) -> [ResultMap?] in value.map { (value: SelectProfilePic?) -> ResultMap? in value.flatMap { (value: SelectProfilePic) -> ResultMap in value.resultMap } } }, "checkUser": checkUser.flatMap { (value: [CheckUser?]) -> [ResultMap?] in value.map { (value: CheckUser?) -> ResultMap? in value.flatMap { (value: CheckUser) -> ResultMap in value.resultMap } } }, "groupUser": groupUser.flatMap { (value: [GroupUser?]) -> [ResultMap?] in value.map { (value: GroupUser?) -> ResultMap? in value.flatMap { (value: GroupUser) -> ResultMap in value.resultMap } } }, "select_repo": selectRepo.flatMap { (value: [SelectRepo?]) -> [ResultMap?] in value.map { (value: SelectRepo?) -> ResultMap? in value.flatMap { (value: SelectRepo) -> ResultMap in value.resultMap } } }, "select_ec2": selectEc2.flatMap { (value: [SelectEc2?]) -> [ResultMap?] in value.map { (value: SelectEc2?) -> ResultMap? in value.flatMap { (value: SelectEc2) -> ResultMap in value.resultMap } } }, "log_repo": logRepo.flatMap { (value: [LogRepo?]) -> [ResultMap?] in value.map { (value: LogRepo?) -> ResultMap? in value.flatMap { (value: LogRepo) -> ResultMap in value.resultMap } } }])
    }

    public var user: [User?]? {
      get {
        return (resultMap["User"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [User?] in value.map { (value: ResultMap?) -> User? in value.flatMap { (value: ResultMap) -> User in User(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [User?]) -> [ResultMap?] in value.map { (value: User?) -> ResultMap? in value.flatMap { (value: User) -> ResultMap in value.resultMap } } }, forKey: "User")
      }
    }

    public var repository: [Repository?]? {
      get {
        return (resultMap["Repository"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Repository?] in value.map { (value: ResultMap?) -> Repository? in value.flatMap { (value: ResultMap) -> Repository in Repository(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Repository?]) -> [ResultMap?] in value.map { (value: Repository?) -> ResultMap? in value.flatMap { (value: Repository) -> ResultMap in value.resultMap } } }, forKey: "Repository")
      }
    }

    public var mappingRepoUser: [MappingRepoUser?]? {
      get {
        return (resultMap["mapping_repo_user"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [MappingRepoUser?] in value.map { (value: ResultMap?) -> MappingRepoUser? in value.flatMap { (value: ResultMap) -> MappingRepoUser in MappingRepoUser(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [MappingRepoUser?]) -> [ResultMap?] in value.map { (value: MappingRepoUser?) -> ResultMap? in value.flatMap { (value: MappingRepoUser) -> ResultMap in value.resultMap } } }, forKey: "mapping_repo_user")
      }
    }

    public var login: [Login?]? {
      get {
        return (resultMap["login"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Login?] in value.map { (value: ResultMap?) -> Login? in value.flatMap { (value: ResultMap) -> Login in Login(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Login?]) -> [ResultMap?] in value.map { (value: Login?) -> ResultMap? in value.flatMap { (value: Login) -> ResultMap in value.resultMap } } }, forKey: "login")
      }
    }

    public var findId: [FindId?]? {
      get {
        return (resultMap["findId"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [FindId?] in value.map { (value: ResultMap?) -> FindId? in value.flatMap { (value: ResultMap) -> FindId in FindId(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FindId?]) -> [ResultMap?] in value.map { (value: FindId?) -> ResultMap? in value.flatMap { (value: FindId) -> ResultMap in value.resultMap } } }, forKey: "findId")
      }
    }

    public var findPw: [FindPw?]? {
      get {
        return (resultMap["findPw"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [FindPw?] in value.map { (value: ResultMap?) -> FindPw? in value.flatMap { (value: ResultMap) -> FindPw in FindPw(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FindPw?]) -> [ResultMap?] in value.map { (value: FindPw?) -> ResultMap? in value.flatMap { (value: FindPw) -> ResultMap in value.resultMap } } }, forKey: "findPw")
      }
    }

    public var repoList: [RepoList?]? {
      get {
        return (resultMap["repoList"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [RepoList?] in value.map { (value: ResultMap?) -> RepoList? in value.flatMap { (value: ResultMap) -> RepoList in RepoList(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [RepoList?]) -> [ResultMap?] in value.map { (value: RepoList?) -> ResultMap? in value.flatMap { (value: RepoList) -> ResultMap in value.resultMap } } }, forKey: "repoList")
      }
    }

    public var selectProfilePic: [SelectProfilePic?]? {
      get {
        return (resultMap["select_profilePic"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SelectProfilePic?] in value.map { (value: ResultMap?) -> SelectProfilePic? in value.flatMap { (value: ResultMap) -> SelectProfilePic in SelectProfilePic(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SelectProfilePic?]) -> [ResultMap?] in value.map { (value: SelectProfilePic?) -> ResultMap? in value.flatMap { (value: SelectProfilePic) -> ResultMap in value.resultMap } } }, forKey: "select_profilePic")
      }
    }

    public var checkUser: [CheckUser?]? {
      get {
        return (resultMap["checkUser"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [CheckUser?] in value.map { (value: ResultMap?) -> CheckUser? in value.flatMap { (value: ResultMap) -> CheckUser in CheckUser(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [CheckUser?]) -> [ResultMap?] in value.map { (value: CheckUser?) -> ResultMap? in value.flatMap { (value: CheckUser) -> ResultMap in value.resultMap } } }, forKey: "checkUser")
      }
    }

    public var groupUser: [GroupUser?]? {
      get {
        return (resultMap["groupUser"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [GroupUser?] in value.map { (value: ResultMap?) -> GroupUser? in value.flatMap { (value: ResultMap) -> GroupUser in GroupUser(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GroupUser?]) -> [ResultMap?] in value.map { (value: GroupUser?) -> ResultMap? in value.flatMap { (value: GroupUser) -> ResultMap in value.resultMap } } }, forKey: "groupUser")
      }
    }

    public var selectRepo: [SelectRepo?]? {
      get {
        return (resultMap["select_repo"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SelectRepo?] in value.map { (value: ResultMap?) -> SelectRepo? in value.flatMap { (value: ResultMap) -> SelectRepo in SelectRepo(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SelectRepo?]) -> [ResultMap?] in value.map { (value: SelectRepo?) -> ResultMap? in value.flatMap { (value: SelectRepo) -> ResultMap in value.resultMap } } }, forKey: "select_repo")
      }
    }

    public var selectEc2: [SelectEc2?]? {
      get {
        return (resultMap["select_ec2"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SelectEc2?] in value.map { (value: ResultMap?) -> SelectEc2? in value.flatMap { (value: ResultMap) -> SelectEc2 in SelectEc2(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SelectEc2?]) -> [ResultMap?] in value.map { (value: SelectEc2?) -> ResultMap? in value.flatMap { (value: SelectEc2) -> ResultMap in value.resultMap } } }, forKey: "select_ec2")
      }
    }

    public var logRepo: [LogRepo?]? {
      get {
        return (resultMap["log_repo"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [LogRepo?] in value.map { (value: ResultMap?) -> LogRepo? in value.flatMap { (value: ResultMap) -> LogRepo in LogRepo(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [LogRepo?]) -> [ResultMap?] in value.map { (value: LogRepo?) -> ResultMap? in value.flatMap { (value: LogRepo) -> ResultMap in value.resultMap } } }, forKey: "log_repo")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("user_pw", type: .scalar(String.self)),
          GraphQLField("user_name", type: .scalar(String.self)),
          GraphQLField("user_email", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("about", type: .scalar(String.self)),
          GraphQLField("contact", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: String? = nil, userPw: String? = nil, userName: String? = nil, userEmail: String? = nil, profilePic: String? = nil, about: String? = nil, contact: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "user_id": userId, "user_pw": userPw, "user_name": userName, "user_email": userEmail, "profilePic": profilePic, "about": about, "contact": contact])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userId: String? {
        get {
          return resultMap["user_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var userPw: String? {
        get {
          return resultMap["user_pw"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_pw")
        }
      }

      public var userName: String? {
        get {
          return resultMap["user_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_name")
        }
      }

      public var userEmail: String? {
        get {
          return resultMap["user_email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_email")
        }
      }

      public var profilePic: String? {
        get {
          return resultMap["profilePic"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profilePic")
        }
      }

      public var about: String? {
        get {
          return resultMap["about"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "about")
        }
      }

      public var contact: String? {
        get {
          return resultMap["contact"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "contact")
        }
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Repository"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("repo_name", type: .scalar(String.self)),
          GraphQLField("repo_ec2_ip", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(repoName: String? = nil, repoEc2Ip: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Repository", "repo_name": repoName, "repo_ec2_ip": repoEc2Ip])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var repoName: String? {
        get {
          return resultMap["repo_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "repo_name")
        }
      }

      public var repoEc2Ip: String? {
        get {
          return resultMap["repo_ec2_ip"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "repo_ec2_ip")
        }
      }
    }

    public struct MappingRepoUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["mapping_repo_user"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("repo_name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: String? = nil, repoName: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "mapping_repo_user", "user_id": userId, "repo_name": repoName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userId: String? {
        get {
          return resultMap["user_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var repoName: String? {
        get {
          return resultMap["repo_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "repo_name")
        }
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("user_pw", type: .scalar(String.self)),
          GraphQLField("user_name", type: .scalar(String.self)),
          GraphQLField("user_email", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("about", type: .scalar(String.self)),
          GraphQLField("contact", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: String? = nil, userPw: String? = nil, userName: String? = nil, userEmail: String? = nil, profilePic: String? = nil, about: String? = nil, contact: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "user_id": userId, "user_pw": userPw, "user_name": userName, "user_email": userEmail, "profilePic": profilePic, "about": about, "contact": contact])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userId: String? {
        get {
          return resultMap["user_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var userPw: String? {
        get {
          return resultMap["user_pw"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_pw")
        }
      }

      public var userName: String? {
        get {
          return resultMap["user_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_name")
        }
      }

      public var userEmail: String? {
        get {
          return resultMap["user_email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_email")
        }
      }

      public var profilePic: String? {
        get {
          return resultMap["profilePic"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profilePic")
        }
      }

      public var about: String? {
        get {
          return resultMap["about"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "about")
        }
      }

      public var contact: String? {
        get {
          return resultMap["contact"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "contact")
        }
      }
    }

    public struct FindId: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("user_pw", type: .scalar(String.self)),
          GraphQLField("user_name", type: .scalar(String.self)),
          GraphQLField("user_email", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("about", type: .scalar(String.self)),
          GraphQLField("contact", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: String? = nil, userPw: String? = nil, userName: String? = nil, userEmail: String? = nil, profilePic: String? = nil, about: String? = nil, contact: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "user_id": userId, "user_pw": userPw, "user_name": userName, "user_email": userEmail, "profilePic": profilePic, "about": about, "contact": contact])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userId: String? {
        get {
          return resultMap["user_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var userPw: String? {
        get {
          return resultMap["user_pw"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_pw")
        }
      }

      public var userName: String? {
        get {
          return resultMap["user_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_name")
        }
      }

      public var userEmail: String? {
        get {
          return resultMap["user_email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_email")
        }
      }

      public var profilePic: String? {
        get {
          return resultMap["profilePic"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profilePic")
        }
      }

      public var about: String? {
        get {
          return resultMap["about"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "about")
        }
      }

      public var contact: String? {
        get {
          return resultMap["contact"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "contact")
        }
      }
    }

    public struct FindPw: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("user_pw", type: .scalar(String.self)),
          GraphQLField("user_name", type: .scalar(String.self)),
          GraphQLField("user_email", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("about", type: .scalar(String.self)),
          GraphQLField("contact", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: String? = nil, userPw: String? = nil, userName: String? = nil, userEmail: String? = nil, profilePic: String? = nil, about: String? = nil, contact: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "user_id": userId, "user_pw": userPw, "user_name": userName, "user_email": userEmail, "profilePic": profilePic, "about": about, "contact": contact])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userId: String? {
        get {
          return resultMap["user_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var userPw: String? {
        get {
          return resultMap["user_pw"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_pw")
        }
      }

      public var userName: String? {
        get {
          return resultMap["user_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_name")
        }
      }

      public var userEmail: String? {
        get {
          return resultMap["user_email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_email")
        }
      }

      public var profilePic: String? {
        get {
          return resultMap["profilePic"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profilePic")
        }
      }

      public var about: String? {
        get {
          return resultMap["about"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "about")
        }
      }

      public var contact: String? {
        get {
          return resultMap["contact"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "contact")
        }
      }
    }

    public struct RepoList: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["mapping_repo_user"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("repo_name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: String? = nil, repoName: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "mapping_repo_user", "user_id": userId, "repo_name": repoName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userId: String? {
        get {
          return resultMap["user_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var repoName: String? {
        get {
          return resultMap["repo_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "repo_name")
        }
      }
    }

    public struct SelectProfilePic: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("user_pw", type: .scalar(String.self)),
          GraphQLField("user_name", type: .scalar(String.self)),
          GraphQLField("user_email", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("about", type: .scalar(String.self)),
          GraphQLField("contact", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: String? = nil, userPw: String? = nil, userName: String? = nil, userEmail: String? = nil, profilePic: String? = nil, about: String? = nil, contact: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "user_id": userId, "user_pw": userPw, "user_name": userName, "user_email": userEmail, "profilePic": profilePic, "about": about, "contact": contact])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userId: String? {
        get {
          return resultMap["user_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var userPw: String? {
        get {
          return resultMap["user_pw"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_pw")
        }
      }

      public var userName: String? {
        get {
          return resultMap["user_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_name")
        }
      }

      public var userEmail: String? {
        get {
          return resultMap["user_email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_email")
        }
      }

      public var profilePic: String? {
        get {
          return resultMap["profilePic"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profilePic")
        }
      }

      public var about: String? {
        get {
          return resultMap["about"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "about")
        }
      }

      public var contact: String? {
        get {
          return resultMap["contact"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "contact")
        }
      }
    }

    public struct CheckUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("user_pw", type: .scalar(String.self)),
          GraphQLField("user_name", type: .scalar(String.self)),
          GraphQLField("user_email", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("about", type: .scalar(String.self)),
          GraphQLField("contact", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: String? = nil, userPw: String? = nil, userName: String? = nil, userEmail: String? = nil, profilePic: String? = nil, about: String? = nil, contact: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "user_id": userId, "user_pw": userPw, "user_name": userName, "user_email": userEmail, "profilePic": profilePic, "about": about, "contact": contact])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userId: String? {
        get {
          return resultMap["user_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var userPw: String? {
        get {
          return resultMap["user_pw"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_pw")
        }
      }

      public var userName: String? {
        get {
          return resultMap["user_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_name")
        }
      }

      public var userEmail: String? {
        get {
          return resultMap["user_email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_email")
        }
      }

      public var profilePic: String? {
        get {
          return resultMap["profilePic"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profilePic")
        }
      }

      public var about: String? {
        get {
          return resultMap["about"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "about")
        }
      }

      public var contact: String? {
        get {
          return resultMap["contact"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "contact")
        }
      }
    }

    public struct GroupUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["mapping_repo_user"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("repo_name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: String? = nil, repoName: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "mapping_repo_user", "user_id": userId, "repo_name": repoName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userId: String? {
        get {
          return resultMap["user_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }

      public var repoName: String? {
        get {
          return resultMap["repo_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "repo_name")
        }
      }
    }

    public struct SelectRepo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Repository"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("repo_name", type: .scalar(String.self)),
          GraphQLField("repo_ec2_ip", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(repoName: String? = nil, repoEc2Ip: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Repository", "repo_name": repoName, "repo_ec2_ip": repoEc2Ip])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var repoName: String? {
        get {
          return resultMap["repo_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "repo_name")
        }
      }

      public var repoEc2Ip: String? {
        get {
          return resultMap["repo_ec2_ip"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "repo_ec2_ip")
        }
      }
    }

    public struct SelectEc2: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Repository"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("repo_name", type: .scalar(String.self)),
          GraphQLField("repo_ec2_ip", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(repoName: String? = nil, repoEc2Ip: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Repository", "repo_name": repoName, "repo_ec2_ip": repoEc2Ip])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var repoName: String? {
        get {
          return resultMap["repo_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "repo_name")
        }
      }

      public var repoEc2Ip: String? {
        get {
          return resultMap["repo_ec2_ip"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "repo_ec2_ip")
        }
      }
    }

    public struct LogRepo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["log"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("commit_msg", type: .scalar(String.self)),
          GraphQLField("date", type: .scalar(String.self)),
          GraphQLField("commit_id", type: .scalar(String.self)),
          GraphQLField("user_id", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(commitMsg: String? = nil, date: String? = nil, commitId: String? = nil, userId: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "log", "commit_msg": commitMsg, "date": date, "commit_id": commitId, "user_id": userId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var commitMsg: String? {
        get {
          return resultMap["commit_msg"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "commit_msg")
        }
      }

      public var date: String? {
        get {
          return resultMap["date"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date")
        }
      }

      public var commitId: String? {
        get {
          return resultMap["commit_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "commit_id")
        }
      }

      public var userId: String? {
        get {
          return resultMap["user_id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "user_id")
        }
      }
    }
  }
}

public final class MutationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Mutation($signupUserId2: String, $userPw: String, $userName: String, $signupUserEmail2: String, $createRepoRepoName2: String, $createRepoRepoEc2Ip2: String, $createRepoUserId2: String, $insertProfilePicUserId2: String, $profilePic: String, $plusUserUserId2: String, $plusUserRepoName2: String) {
      signup(
        user_id: $signupUserId2
        user_pw: $userPw
        user_name: $userName
        user_email: $signupUserEmail2
      )
      create_repo(
        repo_name: $createRepoRepoName2
        repo_ec2_ip: $createRepoRepoEc2Ip2
        user_id: $createRepoUserId2
      )
      insert_profilePic(user_id: $insertProfilePicUserId2, profilePic: $profilePic)
      plusUser(user_id: $plusUserUserId2, repo_name: $plusUserRepoName2)
    }
    """

  public let operationName: String = "Mutation"

  public var signupUserId2: String?
  public var userPw: String?
  public var userName: String?
  public var signupUserEmail2: String?
  public var createRepoRepoName2: String?
  public var createRepoRepoEc2Ip2: String?
  public var createRepoUserId2: String?
  public var insertProfilePicUserId2: String?
  public var profilePic: String?
  public var plusUserUserId2: String?
  public var plusUserRepoName2: String?

  public init(signupUserId2: String? = nil, userPw: String? = nil, userName: String? = nil, signupUserEmail2: String? = nil, createRepoRepoName2: String? = nil, createRepoRepoEc2Ip2: String? = nil, createRepoUserId2: String? = nil, insertProfilePicUserId2: String? = nil, profilePic: String? = nil, plusUserUserId2: String? = nil, plusUserRepoName2: String? = nil) {
    self.signupUserId2 = signupUserId2
    self.userPw = userPw
    self.userName = userName
    self.signupUserEmail2 = signupUserEmail2
    self.createRepoRepoName2 = createRepoRepoName2
    self.createRepoRepoEc2Ip2 = createRepoRepoEc2Ip2
    self.createRepoUserId2 = createRepoUserId2
    self.insertProfilePicUserId2 = insertProfilePicUserId2
    self.profilePic = profilePic
    self.plusUserUserId2 = plusUserUserId2
    self.plusUserRepoName2 = plusUserRepoName2
  }

  public var variables: GraphQLMap? {
    return ["signupUserId2": signupUserId2, "userPw": userPw, "userName": userName, "signupUserEmail2": signupUserEmail2, "createRepoRepoName2": createRepoRepoName2, "createRepoRepoEc2Ip2": createRepoRepoEc2Ip2, "createRepoUserId2": createRepoUserId2, "insertProfilePicUserId2": insertProfilePicUserId2, "profilePic": profilePic, "plusUserUserId2": plusUserUserId2, "plusUserRepoName2": plusUserRepoName2]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signup", arguments: ["user_id": GraphQLVariable("signupUserId2"), "user_pw": GraphQLVariable("userPw"), "user_name": GraphQLVariable("userName"), "user_email": GraphQLVariable("signupUserEmail2")], type: .scalar(String.self)),
        GraphQLField("create_repo", arguments: ["repo_name": GraphQLVariable("createRepoRepoName2"), "repo_ec2_ip": GraphQLVariable("createRepoRepoEc2Ip2"), "user_id": GraphQLVariable("createRepoUserId2")], type: .scalar(String.self)),
        GraphQLField("insert_profilePic", arguments: ["user_id": GraphQLVariable("insertProfilePicUserId2"), "profilePic": GraphQLVariable("profilePic")], type: .scalar(String.self)),
        GraphQLField("plusUser", arguments: ["user_id": GraphQLVariable("plusUserUserId2"), "repo_name": GraphQLVariable("plusUserRepoName2")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signup: String? = nil, createRepo: String? = nil, insertProfilePic: String? = nil, plusUser: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "signup": signup, "create_repo": createRepo, "insert_profilePic": insertProfilePic, "plusUser": plusUser])
    }

    public var signup: String? {
      get {
        return resultMap["signup"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "signup")
      }
    }

    public var createRepo: String? {
      get {
        return resultMap["create_repo"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "create_repo")
      }
    }

    public var insertProfilePic: String? {
      get {
        return resultMap["insert_profilePic"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "insert_profilePic")
      }
    }

    public var plusUser: String? {
      get {
        return resultMap["plusUser"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "plusUser")
      }
    }
  }
}
