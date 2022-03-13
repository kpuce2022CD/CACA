// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class UserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query User {
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
    }
    """

  public let operationName: String = "User"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("User", type: .list(.object(User.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: [User?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "User": user.flatMap { (value: [User?]) -> [ResultMap?] in value.map { (value: User?) -> ResultMap? in value.flatMap { (value: User) -> ResultMap in value.resultMap } } }])
    }

    public var user: [User?]? {
      get {
        return (resultMap["User"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [User?] in value.map { (value: ResultMap?) -> User? in value.flatMap { (value: ResultMap) -> User in User(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [User?]) -> [ResultMap?] in value.map { (value: User?) -> ResultMap? in value.flatMap { (value: User) -> ResultMap in value.resultMap } } }, forKey: "User")
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
  }
}

public final class RepositoryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Repository {
      Repository {
        __typename
        repo_name
        repo_ec2_ip
      }
    }
    """

  public let operationName: String = "Repository"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Repository", type: .list(.object(Repository.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(repository: [Repository?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Repository": repository.flatMap { (value: [Repository?]) -> [ResultMap?] in value.map { (value: Repository?) -> ResultMap? in value.flatMap { (value: Repository) -> ResultMap in value.resultMap } } }])
    }

    public var repository: [Repository?]? {
      get {
        return (resultMap["Repository"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Repository?] in value.map { (value: ResultMap?) -> Repository? in value.flatMap { (value: ResultMap) -> Repository in Repository(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Repository?]) -> [ResultMap?] in value.map { (value: Repository?) -> ResultMap? in value.flatMap { (value: Repository) -> ResultMap in value.resultMap } } }, forKey: "Repository")
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
  }
}

public final class MappingRepoUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query mapping_repo_user {
      mapping_repo_user {
        __typename
        user_id
        repo_name
      }
    }
    """

  public let operationName: String = "mapping_repo_user"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("mapping_repo_user", type: .list(.object(MappingRepoUser.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(mappingRepoUser: [MappingRepoUser?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "mapping_repo_user": mappingRepoUser.flatMap { (value: [MappingRepoUser?]) -> [ResultMap?] in value.map { (value: MappingRepoUser?) -> ResultMap? in value.flatMap { (value: MappingRepoUser) -> ResultMap in value.resultMap } } }])
    }

    public var mappingRepoUser: [MappingRepoUser?]? {
      get {
        return (resultMap["mapping_repo_user"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [MappingRepoUser?] in value.map { (value: ResultMap?) -> MappingRepoUser? in value.flatMap { (value: ResultMap) -> MappingRepoUser in MappingRepoUser(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [MappingRepoUser?]) -> [ResultMap?] in value.map { (value: MappingRepoUser?) -> ResultMap? in value.flatMap { (value: MappingRepoUser) -> ResultMap in value.resultMap } } }, forKey: "mapping_repo_user")
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
  }
}

public final class RequestQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query request {
      request {
        __typename
        user_id
        repo_name
        x_pixel
        y_pixel
        request_context
      }
    }
    """

  public let operationName: String = "request"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("request", type: .list(.object(Request.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(request: [Request?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "request": request.flatMap { (value: [Request?]) -> [ResultMap?] in value.map { (value: Request?) -> ResultMap? in value.flatMap { (value: Request) -> ResultMap in value.resultMap } } }])
    }

    public var request: [Request?]? {
      get {
        return (resultMap["request"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Request?] in value.map { (value: ResultMap?) -> Request? in value.flatMap { (value: ResultMap) -> Request in Request(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Request?]) -> [ResultMap?] in value.map { (value: Request?) -> ResultMap? in value.flatMap { (value: Request) -> ResultMap in value.resultMap } } }, forKey: "request")
      }
    }

    public struct Request: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["request"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("repo_name", type: .scalar(String.self)),
          GraphQLField("x_pixel", type: .scalar(String.self)),
          GraphQLField("y_pixel", type: .scalar(String.self)),
          GraphQLField("request_context", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: String? = nil, repoName: String? = nil, xPixel: String? = nil, yPixel: String? = nil, requestContext: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "request", "user_id": userId, "repo_name": repoName, "x_pixel": xPixel, "y_pixel": yPixel, "request_context": requestContext])
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

      public var xPixel: String? {
        get {
          return resultMap["x_pixel"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "x_pixel")
        }
      }

      public var yPixel: String? {
        get {
          return resultMap["y_pixel"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "y_pixel")
        }
      }

      public var requestContext: String? {
        get {
          return resultMap["request_context"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "request_context")
        }
      }
    }
  }
}

public final class RequestIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query request_id($user_id: String) {
      request_id(user_id: $user_id) {
        __typename
        user_id
        repo_name
        x_pixel
        y_pixel
        request_context
      }
    }
    """

  public let operationName: String = "request_id"

  public var user_id: String?

  public init(user_id: String? = nil) {
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("request_id", arguments: ["user_id": GraphQLVariable("user_id")], type: .list(.object(RequestId.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(requestId: [RequestId?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "request_id": requestId.flatMap { (value: [RequestId?]) -> [ResultMap?] in value.map { (value: RequestId?) -> ResultMap? in value.flatMap { (value: RequestId) -> ResultMap in value.resultMap } } }])
    }

    public var requestId: [RequestId?]? {
      get {
        return (resultMap["request_id"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [RequestId?] in value.map { (value: ResultMap?) -> RequestId? in value.flatMap { (value: ResultMap) -> RequestId in RequestId(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [RequestId?]) -> [ResultMap?] in value.map { (value: RequestId?) -> ResultMap? in value.flatMap { (value: RequestId) -> ResultMap in value.resultMap } } }, forKey: "request_id")
      }
    }

    public struct RequestId: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["request"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("repo_name", type: .scalar(String.self)),
          GraphQLField("x_pixel", type: .scalar(String.self)),
          GraphQLField("y_pixel", type: .scalar(String.self)),
          GraphQLField("request_context", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: String? = nil, repoName: String? = nil, xPixel: String? = nil, yPixel: String? = nil, requestContext: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "request", "user_id": userId, "repo_name": repoName, "x_pixel": xPixel, "y_pixel": yPixel, "request_context": requestContext])
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

      public var xPixel: String? {
        get {
          return resultMap["x_pixel"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "x_pixel")
        }
      }

      public var yPixel: String? {
        get {
          return resultMap["y_pixel"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "y_pixel")
        }
      }

      public var requestContext: String? {
        get {
          return resultMap["request_context"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "request_context")
        }
      }
    }
  }
}

public final class RequestRepoQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query request_repo($repo_name: String) {
      request_repo(repo_name: $repo_name) {
        __typename
        user_id
        repo_name
        x_pixel
        y_pixel
        request_context
      }
    }
    """

  public let operationName: String = "request_repo"

  public var repo_name: String?

  public init(repo_name: String? = nil) {
    self.repo_name = repo_name
  }

  public var variables: GraphQLMap? {
    return ["repo_name": repo_name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("request_repo", arguments: ["repo_name": GraphQLVariable("repo_name")], type: .list(.object(RequestRepo.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(requestRepo: [RequestRepo?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "request_repo": requestRepo.flatMap { (value: [RequestRepo?]) -> [ResultMap?] in value.map { (value: RequestRepo?) -> ResultMap? in value.flatMap { (value: RequestRepo) -> ResultMap in value.resultMap } } }])
    }

    public var requestRepo: [RequestRepo?]? {
      get {
        return (resultMap["request_repo"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [RequestRepo?] in value.map { (value: ResultMap?) -> RequestRepo? in value.flatMap { (value: ResultMap) -> RequestRepo in RequestRepo(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [RequestRepo?]) -> [ResultMap?] in value.map { (value: RequestRepo?) -> ResultMap? in value.flatMap { (value: RequestRepo) -> ResultMap in value.resultMap } } }, forKey: "request_repo")
      }
    }

    public struct RequestRepo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["request"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("repo_name", type: .scalar(String.self)),
          GraphQLField("x_pixel", type: .scalar(String.self)),
          GraphQLField("y_pixel", type: .scalar(String.self)),
          GraphQLField("request_context", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: String? = nil, repoName: String? = nil, xPixel: String? = nil, yPixel: String? = nil, requestContext: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "request", "user_id": userId, "repo_name": repoName, "x_pixel": xPixel, "y_pixel": yPixel, "request_context": requestContext])
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

      public var xPixel: String? {
        get {
          return resultMap["x_pixel"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "x_pixel")
        }
      }

      public var yPixel: String? {
        get {
          return resultMap["y_pixel"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "y_pixel")
        }
      }

      public var requestContext: String? {
        get {
          return resultMap["request_context"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "request_context")
        }
      }
    }
  }
}

public final class RequestXyQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query request_xy($x_pixel: String, $y_pixel: String) {
      request_xy(x_pixel: $x_pixel, y_pixel: $y_pixel) {
        __typename
        user_id
        repo_name
        x_pixel
        y_pixel
        request_context
      }
    }
    """

  public let operationName: String = "request_xy"

  public var x_pixel: String?
  public var y_pixel: String?

  public init(x_pixel: String? = nil, y_pixel: String? = nil) {
    self.x_pixel = x_pixel
    self.y_pixel = y_pixel
  }

  public var variables: GraphQLMap? {
    return ["x_pixel": x_pixel, "y_pixel": y_pixel]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("request_xy", arguments: ["x_pixel": GraphQLVariable("x_pixel"), "y_pixel": GraphQLVariable("y_pixel")], type: .list(.object(RequestXy.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(requestXy: [RequestXy?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "request_xy": requestXy.flatMap { (value: [RequestXy?]) -> [ResultMap?] in value.map { (value: RequestXy?) -> ResultMap? in value.flatMap { (value: RequestXy) -> ResultMap in value.resultMap } } }])
    }

    public var requestXy: [RequestXy?]? {
      get {
        return (resultMap["request_xy"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [RequestXy?] in value.map { (value: ResultMap?) -> RequestXy? in value.flatMap { (value: ResultMap) -> RequestXy in RequestXy(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [RequestXy?]) -> [ResultMap?] in value.map { (value: RequestXy?) -> ResultMap? in value.flatMap { (value: RequestXy) -> ResultMap in value.resultMap } } }, forKey: "request_xy")
      }
    }

    public struct RequestXy: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["request"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("user_id", type: .scalar(String.self)),
          GraphQLField("repo_name", type: .scalar(String.self)),
          GraphQLField("x_pixel", type: .scalar(String.self)),
          GraphQLField("y_pixel", type: .scalar(String.self)),
          GraphQLField("request_context", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: String? = nil, repoName: String? = nil, xPixel: String? = nil, yPixel: String? = nil, requestContext: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "request", "user_id": userId, "repo_name": repoName, "x_pixel": xPixel, "y_pixel": yPixel, "request_context": requestContext])
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

      public var xPixel: String? {
        get {
          return resultMap["x_pixel"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "x_pixel")
        }
      }

      public var yPixel: String? {
        get {
          return resultMap["y_pixel"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "y_pixel")
        }
      }

      public var requestContext: String? {
        get {
          return resultMap["request_context"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "request_context")
        }
      }
    }
  }
}

public final class DiffCommitQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query diff_commit($first_commit: String, $second_commit: String, $repo_name: String, $file_name: String) {
      diff_commit(
        first_commit: $first_commit
        second_commit: $second_commit
        repo_name: $repo_name
        file_name: $file_name
      )
    }
    """

  public let operationName: String = "diff_commit"

  public var first_commit: String?
  public var second_commit: String?
  public var repo_name: String?
  public var file_name: String?

  public init(first_commit: String? = nil, second_commit: String? = nil, repo_name: String? = nil, file_name: String? = nil) {
    self.first_commit = first_commit
    self.second_commit = second_commit
    self.repo_name = repo_name
    self.file_name = file_name
  }

  public var variables: GraphQLMap? {
    return ["first_commit": first_commit, "second_commit": second_commit, "repo_name": repo_name, "file_name": file_name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("diff_commit", arguments: ["first_commit": GraphQLVariable("first_commit"), "second_commit": GraphQLVariable("second_commit"), "repo_name": GraphQLVariable("repo_name"), "file_name": GraphQLVariable("file_name")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(diffCommit: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "diff_commit": diffCommit])
    }

    public var diffCommit: String? {
      get {
        return resultMap["diff_commit"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "diff_commit")
      }
    }
  }
}

public final class LoginQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query login($userId: String) {
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
    }
    """

  public let operationName: String = "login"

  public var userId: String?

  public init(userId: String? = nil) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["user_id": GraphQLVariable("userId")], type: .list(.object(Login.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: [Login?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "login": login.flatMap { (value: [Login?]) -> [ResultMap?] in value.map { (value: Login?) -> ResultMap? in value.flatMap { (value: Login) -> ResultMap in value.resultMap } } }])
    }

    public var login: [Login?]? {
      get {
        return (resultMap["login"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Login?] in value.map { (value: ResultMap?) -> Login? in value.flatMap { (value: ResultMap) -> Login in Login(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Login?]) -> [ResultMap?] in value.map { (value: Login?) -> ResultMap? in value.flatMap { (value: Login) -> ResultMap in value.resultMap } } }, forKey: "login")
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
  }
}

public final class FindIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query findId($userEmail: String) {
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
    }
    """

  public let operationName: String = "findId"

  public var userEmail: String?

  public init(userEmail: String? = nil) {
    self.userEmail = userEmail
  }

  public var variables: GraphQLMap? {
    return ["userEmail": userEmail]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("findId", arguments: ["user_email": GraphQLVariable("userEmail")], type: .list(.object(FindId.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findId: [FindId?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "findId": findId.flatMap { (value: [FindId?]) -> [ResultMap?] in value.map { (value: FindId?) -> ResultMap? in value.flatMap { (value: FindId) -> ResultMap in value.resultMap } } }])
    }

    public var findId: [FindId?]? {
      get {
        return (resultMap["findId"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [FindId?] in value.map { (value: ResultMap?) -> FindId? in value.flatMap { (value: ResultMap) -> FindId in FindId(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FindId?]) -> [ResultMap?] in value.map { (value: FindId?) -> ResultMap? in value.flatMap { (value: FindId) -> ResultMap in value.resultMap } } }, forKey: "findId")
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
  }
}

public final class FindPwQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query findPw($user_id: String) {
      findPw(user_id: $user_id) {
        __typename
        user_id
        user_pw
        user_name
        user_email
        profilePic
        about
        contact
      }
    }
    """

  public let operationName: String = "findPw"

  public var user_id: String?

  public init(user_id: String? = nil) {
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("findPw", arguments: ["user_id": GraphQLVariable("user_id")], type: .list(.object(FindPw.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findPw: [FindPw?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "findPw": findPw.flatMap { (value: [FindPw?]) -> [ResultMap?] in value.map { (value: FindPw?) -> ResultMap? in value.flatMap { (value: FindPw) -> ResultMap in value.resultMap } } }])
    }

    public var findPw: [FindPw?]? {
      get {
        return (resultMap["findPw"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [FindPw?] in value.map { (value: ResultMap?) -> FindPw? in value.flatMap { (value: ResultMap) -> FindPw in FindPw(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FindPw?]) -> [ResultMap?] in value.map { (value: FindPw?) -> ResultMap? in value.flatMap { (value: FindPw) -> ResultMap in value.resultMap } } }, forKey: "findPw")
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
  }
}

public final class RepoListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query repoList($user_id: String) {
      repoList(user_id: $user_id) {
        __typename
        user_id
        repo_name
      }
    }
    """

  public let operationName: String = "repoList"

  public var user_id: String?

  public init(user_id: String? = nil) {
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("repoList", arguments: ["user_id": GraphQLVariable("user_id")], type: .list(.object(RepoList.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(repoList: [RepoList?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "repoList": repoList.flatMap { (value: [RepoList?]) -> [ResultMap?] in value.map { (value: RepoList?) -> ResultMap? in value.flatMap { (value: RepoList) -> ResultMap in value.resultMap } } }])
    }

    public var repoList: [RepoList?]? {
      get {
        return (resultMap["repoList"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [RepoList?] in value.map { (value: ResultMap?) -> RepoList? in value.flatMap { (value: ResultMap) -> RepoList in RepoList(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [RepoList?]) -> [ResultMap?] in value.map { (value: RepoList?) -> ResultMap? in value.flatMap { (value: RepoList) -> ResultMap in value.resultMap } } }, forKey: "repoList")
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
  }
}

public final class SelectProfilePicQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query select_profilePic($user_id: String) {
      select_profilePic(user_id: $user_id) {
        __typename
        user_id
        user_pw
        user_name
        user_email
        profilePic
        about
        contact
      }
    }
    """

  public let operationName: String = "select_profilePic"

  public var user_id: String?

  public init(user_id: String? = nil) {
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("select_profilePic", arguments: ["user_id": GraphQLVariable("user_id")], type: .list(.object(SelectProfilePic.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(selectProfilePic: [SelectProfilePic?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "select_profilePic": selectProfilePic.flatMap { (value: [SelectProfilePic?]) -> [ResultMap?] in value.map { (value: SelectProfilePic?) -> ResultMap? in value.flatMap { (value: SelectProfilePic) -> ResultMap in value.resultMap } } }])
    }

    public var selectProfilePic: [SelectProfilePic?]? {
      get {
        return (resultMap["select_profilePic"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SelectProfilePic?] in value.map { (value: ResultMap?) -> SelectProfilePic? in value.flatMap { (value: ResultMap) -> SelectProfilePic in SelectProfilePic(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SelectProfilePic?]) -> [ResultMap?] in value.map { (value: SelectProfilePic?) -> ResultMap? in value.flatMap { (value: SelectProfilePic) -> ResultMap in value.resultMap } } }, forKey: "select_profilePic")
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
  }
}

public final class CheckUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query checkUser($user_id: String) {
      checkUser(user_id: $user_id) {
        __typename
        user_id
        user_pw
        user_name
        user_email
        profilePic
        about
        contact
      }
    }
    """

  public let operationName: String = "checkUser"

  public var user_id: String?

  public init(user_id: String? = nil) {
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("checkUser", arguments: ["user_id": GraphQLVariable("user_id")], type: .list(.object(CheckUser.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(checkUser: [CheckUser?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "checkUser": checkUser.flatMap { (value: [CheckUser?]) -> [ResultMap?] in value.map { (value: CheckUser?) -> ResultMap? in value.flatMap { (value: CheckUser) -> ResultMap in value.resultMap } } }])
    }

    public var checkUser: [CheckUser?]? {
      get {
        return (resultMap["checkUser"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [CheckUser?] in value.map { (value: ResultMap?) -> CheckUser? in value.flatMap { (value: ResultMap) -> CheckUser in CheckUser(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [CheckUser?]) -> [ResultMap?] in value.map { (value: CheckUser?) -> ResultMap? in value.flatMap { (value: CheckUser) -> ResultMap in value.resultMap } } }, forKey: "checkUser")
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
  }
}

public final class GroupUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query groupUser($repo_name: String) {
      groupUser(repo_name: $repo_name) {
        __typename
        user_id
        repo_name
      }
    }
    """

  public let operationName: String = "groupUser"

  public var repo_name: String?

  public init(repo_name: String? = nil) {
    self.repo_name = repo_name
  }

  public var variables: GraphQLMap? {
    return ["repo_name": repo_name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("groupUser", arguments: ["repo_name": GraphQLVariable("repo_name")], type: .list(.object(GroupUser.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(groupUser: [GroupUser?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "groupUser": groupUser.flatMap { (value: [GroupUser?]) -> [ResultMap?] in value.map { (value: GroupUser?) -> ResultMap? in value.flatMap { (value: GroupUser) -> ResultMap in value.resultMap } } }])
    }

    public var groupUser: [GroupUser?]? {
      get {
        return (resultMap["groupUser"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [GroupUser?] in value.map { (value: ResultMap?) -> GroupUser? in value.flatMap { (value: ResultMap) -> GroupUser in GroupUser(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [GroupUser?]) -> [ResultMap?] in value.map { (value: GroupUser?) -> ResultMap? in value.flatMap { (value: GroupUser) -> ResultMap in value.resultMap } } }, forKey: "groupUser")
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
  }
}

public final class SelectRepoQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query select_repo($repo_name: String) {
      select_repo(repo_name: $repo_name) {
        __typename
        repo_name
        repo_ec2_ip
      }
    }
    """

  public let operationName: String = "select_repo"

  public var repo_name: String?

  public init(repo_name: String? = nil) {
    self.repo_name = repo_name
  }

  public var variables: GraphQLMap? {
    return ["repo_name": repo_name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("select_repo", arguments: ["repo_name": GraphQLVariable("repo_name")], type: .list(.object(SelectRepo.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(selectRepo: [SelectRepo?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "select_repo": selectRepo.flatMap { (value: [SelectRepo?]) -> [ResultMap?] in value.map { (value: SelectRepo?) -> ResultMap? in value.flatMap { (value: SelectRepo) -> ResultMap in value.resultMap } } }])
    }

    public var selectRepo: [SelectRepo?]? {
      get {
        return (resultMap["select_repo"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SelectRepo?] in value.map { (value: ResultMap?) -> SelectRepo? in value.flatMap { (value: ResultMap) -> SelectRepo in SelectRepo(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SelectRepo?]) -> [ResultMap?] in value.map { (value: SelectRepo?) -> ResultMap? in value.flatMap { (value: SelectRepo) -> ResultMap in value.resultMap } } }, forKey: "select_repo")
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
  }
}

public final class SelectEc2Query: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query select_ec2($repo_ec2_ip: String) {
      select_ec2(repo_ec2_ip: $repo_ec2_ip) {
        __typename
        repo_name
        repo_ec2_ip
      }
    }
    """

  public let operationName: String = "select_ec2"

  public var repo_ec2_ip: String?

  public init(repo_ec2_ip: String? = nil) {
    self.repo_ec2_ip = repo_ec2_ip
  }

  public var variables: GraphQLMap? {
    return ["repo_ec2_ip": repo_ec2_ip]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("select_ec2", arguments: ["repo_ec2_ip": GraphQLVariable("repo_ec2_ip")], type: .list(.object(SelectEc2.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(selectEc2: [SelectEc2?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "select_ec2": selectEc2.flatMap { (value: [SelectEc2?]) -> [ResultMap?] in value.map { (value: SelectEc2?) -> ResultMap? in value.flatMap { (value: SelectEc2) -> ResultMap in value.resultMap } } }])
    }

    public var selectEc2: [SelectEc2?]? {
      get {
        return (resultMap["select_ec2"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SelectEc2?] in value.map { (value: ResultMap?) -> SelectEc2? in value.flatMap { (value: ResultMap) -> SelectEc2 in SelectEc2(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SelectEc2?]) -> [ResultMap?] in value.map { (value: SelectEc2?) -> ResultMap? in value.flatMap { (value: SelectEc2) -> ResultMap in value.resultMap } } }, forKey: "select_ec2")
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
  }
}

public final class LogRepoQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query log_repo($repo_name: String) {
      log_repo(repo_name: $repo_name) {
        __typename
        commit_msg
        date
        commit_id
        user_id
      }
    }
    """

  public let operationName: String = "log_repo"

  public var repo_name: String?

  public init(repo_name: String? = nil) {
    self.repo_name = repo_name
  }

  public var variables: GraphQLMap? {
    return ["repo_name": repo_name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("log_repo", arguments: ["repo_name": GraphQLVariable("repo_name")], type: .list(.object(LogRepo.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(logRepo: [LogRepo?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "log_repo": logRepo.flatMap { (value: [LogRepo?]) -> [ResultMap?] in value.map { (value: LogRepo?) -> ResultMap? in value.flatMap { (value: LogRepo) -> ResultMap in value.resultMap } } }])
    }

    public var logRepo: [LogRepo?]? {
      get {
        return (resultMap["log_repo"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [LogRepo?] in value.map { (value: ResultMap?) -> LogRepo? in value.flatMap { (value: ResultMap) -> LogRepo in LogRepo(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [LogRepo?]) -> [ResultMap?] in value.map { (value: LogRepo?) -> ResultMap? in value.flatMap { (value: LogRepo) -> ResultMap in value.resultMap } } }, forKey: "log_repo")
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

public final class SignupMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation signup($user_id: String, $user_pw: String, $user_name: String, $user_email: String) {
      signup(
        user_id: $user_id
        user_pw: $user_pw
        user_name: $user_name
        user_email: $user_email
      )
    }
    """

  public let operationName: String = "signup"

  public var user_id: String?
  public var user_pw: String?
  public var user_name: String?
  public var user_email: String?

  public init(user_id: String? = nil, user_pw: String? = nil, user_name: String? = nil, user_email: String? = nil) {
    self.user_id = user_id
    self.user_pw = user_pw
    self.user_name = user_name
    self.user_email = user_email
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id, "user_pw": user_pw, "user_name": user_name, "user_email": user_email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signup", arguments: ["user_id": GraphQLVariable("user_id"), "user_pw": GraphQLVariable("user_pw"), "user_name": GraphQLVariable("user_name"), "user_email": GraphQLVariable("user_email")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signup: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "signup": signup])
    }

    public var signup: String? {
      get {
        return resultMap["signup"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "signup")
      }
    }
  }
}

public final class CreateRepoMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation create_repo($repo_name: String, $repo_ec2_ip: String, $user_id: String) {
      create_repo(repo_name: $repo_name, repo_ec2_ip: $repo_ec2_ip, user_id: $user_id)
    }
    """

  public let operationName: String = "create_repo"

  public var repo_name: String?
  public var repo_ec2_ip: String?
  public var user_id: String?

  public init(repo_name: String? = nil, repo_ec2_ip: String? = nil, user_id: String? = nil) {
    self.repo_name = repo_name
    self.repo_ec2_ip = repo_ec2_ip
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["repo_name": repo_name, "repo_ec2_ip": repo_ec2_ip, "user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("create_repo", arguments: ["repo_name": GraphQLVariable("repo_name"), "repo_ec2_ip": GraphQLVariable("repo_ec2_ip"), "user_id": GraphQLVariable("user_id")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createRepo: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "create_repo": createRepo])
    }

    public var createRepo: String? {
      get {
        return resultMap["create_repo"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "create_repo")
      }
    }
  }
}

public final class InsertProfilePicMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation insert_profilePic($user_id: String, $profilePic: String) {
      insert_profilePic(user_id: $user_id, profilePic: $profilePic)
    }
    """

  public let operationName: String = "insert_profilePic"

  public var user_id: String?
  public var profilePic: String?

  public init(user_id: String? = nil, profilePic: String? = nil) {
    self.user_id = user_id
    self.profilePic = profilePic
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id, "profilePic": profilePic]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert_profilePic", arguments: ["user_id": GraphQLVariable("user_id"), "profilePic": GraphQLVariable("profilePic")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertProfilePic: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "insert_profilePic": insertProfilePic])
    }

    public var insertProfilePic: String? {
      get {
        return resultMap["insert_profilePic"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "insert_profilePic")
      }
    }
  }
}

public final class PlusUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation plusUser($user_id: String, $repo_name: String) {
      plusUser(user_id: $user_id, repo_name: $repo_name)
    }
    """

  public let operationName: String = "plusUser"

  public var user_id: String?
  public var repo_name: String?

  public init(user_id: String? = nil, repo_name: String? = nil) {
    self.user_id = user_id
    self.repo_name = repo_name
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id, "repo_name": repo_name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("plusUser", arguments: ["user_id": GraphQLVariable("user_id"), "repo_name": GraphQLVariable("repo_name")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(plusUser: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "plusUser": plusUser])
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

public final class CreateRequestMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation create_request($user_id: String, $repo_name: String, $x_pixel: String, $y_pixel: String, $request_context: String) {
      create_request(
        user_id: $user_id
        repo_name: $repo_name
        x_pixel: $x_pixel
        y_pixel: $y_pixel
        request_context: $request_context
      )
    }
    """

  public let operationName: String = "create_request"

  public var user_id: String?
  public var repo_name: String?
  public var x_pixel: String?
  public var y_pixel: String?
  public var request_context: String?

  public init(user_id: String? = nil, repo_name: String? = nil, x_pixel: String? = nil, y_pixel: String? = nil, request_context: String? = nil) {
    self.user_id = user_id
    self.repo_name = repo_name
    self.x_pixel = x_pixel
    self.y_pixel = y_pixel
    self.request_context = request_context
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id, "repo_name": repo_name, "x_pixel": x_pixel, "y_pixel": y_pixel, "request_context": request_context]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("create_request", arguments: ["user_id": GraphQLVariable("user_id"), "repo_name": GraphQLVariable("repo_name"), "x_pixel": GraphQLVariable("x_pixel"), "y_pixel": GraphQLVariable("y_pixel"), "request_context": GraphQLVariable("request_context")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createRequest: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "create_request": createRequest])
    }

    public var createRequest: String? {
      get {
        return resultMap["create_request"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "create_request")
      }
    }
  }
}

public final class UpdateUserpwMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation update_userpw($user_id: String, $user_pw: String) {
      update_userpw(user_id: $user_id, user_pw: $user_pw)
    }
    """

  public let operationName: String = "update_userpw"

  public var user_id: String?
  public var user_pw: String?

  public init(user_id: String? = nil, user_pw: String? = nil) {
    self.user_id = user_id
    self.user_pw = user_pw
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id, "user_pw": user_pw]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("update_userpw", arguments: ["user_id": GraphQLVariable("user_id"), "user_pw": GraphQLVariable("user_pw")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateUserpw: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "update_userpw": updateUserpw])
    }

    public var updateUserpw: String? {
      get {
        return resultMap["update_userpw"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "update_userpw")
      }
    }
  }
}

public final class UpdateNameMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation update_name($user_id: String, $user_name: String) {
      update_name(user_id: $user_id, user_name: $user_name)
    }
    """

  public let operationName: String = "update_name"

  public var user_id: String?
  public var user_name: String?

  public init(user_id: String? = nil, user_name: String? = nil) {
    self.user_id = user_id
    self.user_name = user_name
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id, "user_name": user_name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("update_name", arguments: ["user_id": GraphQLVariable("user_id"), "user_name": GraphQLVariable("user_name")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateName: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "update_name": updateName])
    }

    public var updateName: String? {
      get {
        return resultMap["update_name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "update_name")
      }
    }
  }
}

public final class UpdateEmailMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation update_email($user_id: String, $user_email: String) {
      update_email(user_id: $user_id, user_email: $user_email)
    }
    """

  public let operationName: String = "update_email"

  public var user_id: String?
  public var user_email: String?

  public init(user_id: String? = nil, user_email: String? = nil) {
    self.user_id = user_id
    self.user_email = user_email
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id, "user_email": user_email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("update_email", arguments: ["user_id": GraphQLVariable("user_id"), "user_email": GraphQLVariable("user_email")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateEmail: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "update_email": updateEmail])
    }

    public var updateEmail: String? {
      get {
        return resultMap["update_email"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "update_email")
      }
    }
  }
}

public final class UpdateProfilePicMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation update_profilePic($user_id: String, $profilePic: String) {
      update_profilePic(user_id: $user_id, profilePic: $profilePic)
    }
    """

  public let operationName: String = "update_profilePic"

  public var user_id: String?
  public var profilePic: String?

  public init(user_id: String? = nil, profilePic: String? = nil) {
    self.user_id = user_id
    self.profilePic = profilePic
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id, "profilePic": profilePic]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("update_profilePic", arguments: ["user_id": GraphQLVariable("user_id"), "profilePic": GraphQLVariable("profilePic")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateProfilePic: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "update_profilePic": updateProfilePic])
    }

    public var updateProfilePic: String? {
      get {
        return resultMap["update_profilePic"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "update_profilePic")
      }
    }
  }
}

public final class UpdateAboutMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation update_about($user_id: String, $about: String) {
      update_about(user_id: $user_id, about: $about)
    }
    """

  public let operationName: String = "update_about"

  public var user_id: String?
  public var about: String?

  public init(user_id: String? = nil, about: String? = nil) {
    self.user_id = user_id
    self.about = about
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id, "about": about]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("update_about", arguments: ["user_id": GraphQLVariable("user_id"), "about": GraphQLVariable("about")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateAbout: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "update_about": updateAbout])
    }

    public var updateAbout: String? {
      get {
        return resultMap["update_about"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "update_about")
      }
    }
  }
}

public final class UpdateContactMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation update_contact($user_id: String, $contact: String) {
      update_contact(user_id: $user_id, contact: $contact)
    }
    """

  public let operationName: String = "update_contact"

  public var user_id: String?
  public var contact: String?

  public init(user_id: String? = nil, contact: String? = nil) {
    self.user_id = user_id
    self.contact = contact
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id, "contact": contact]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("update_contact", arguments: ["user_id": GraphQLVariable("user_id"), "contact": GraphQLVariable("contact")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateContact: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "update_contact": updateContact])
    }

    public var updateContact: String? {
      get {
        return resultMap["update_contact"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "update_contact")
      }
    }
  }
}

public final class DeleteRequestUserIdMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation delete_request_userID($user_id: String) {
      delete_request_userID(user_id: $user_id)
    }
    """

  public let operationName: String = "delete_request_userID"

  public var user_id: String?

  public init(user_id: String? = nil) {
    self.user_id = user_id
  }

  public var variables: GraphQLMap? {
    return ["user_id": user_id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("delete_request_userID", arguments: ["user_id": GraphQLVariable("user_id")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteRequestUserId: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "delete_request_userID": deleteRequestUserId])
    }

    public var deleteRequestUserId: String? {
      get {
        return resultMap["delete_request_userID"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "delete_request_userID")
      }
    }
  }
}

public final class DeleteRequestRepoMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation delete_request_repo($repo_name: String) {
      delete_request_repo(repo_name: $repo_name)
    }
    """

  public let operationName: String = "delete_request_repo"

  public var repo_name: String?

  public init(repo_name: String? = nil) {
    self.repo_name = repo_name
  }

  public var variables: GraphQLMap? {
    return ["repo_name": repo_name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("delete_request_repo", arguments: ["repo_name": GraphQLVariable("repo_name")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteRequestRepo: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "delete_request_repo": deleteRequestRepo])
    }

    public var deleteRequestRepo: String? {
      get {
        return resultMap["delete_request_repo"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "delete_request_repo")
      }
    }
  }
}

public final class DeleteRequestXyMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation delete_request_xy($x_pixel: String, $y_pixel: String) {
      delete_request_xy(x_pixel: $x_pixel, y_pixel: $y_pixel)
    }
    """

  public let operationName: String = "delete_request_xy"

  public var x_pixel: String?
  public var y_pixel: String?

  public init(x_pixel: String? = nil, y_pixel: String? = nil) {
    self.x_pixel = x_pixel
    self.y_pixel = y_pixel
  }

  public var variables: GraphQLMap? {
    return ["x_pixel": x_pixel, "y_pixel": y_pixel]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("delete_request_xy", arguments: ["x_pixel": GraphQLVariable("x_pixel"), "y_pixel": GraphQLVariable("y_pixel")], type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteRequestXy: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "delete_request_xy": deleteRequestXy])
    }

    public var deleteRequestXy: String? {
      get {
        return resultMap["delete_request_xy"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "delete_request_xy")
      }
    }
  }
}
