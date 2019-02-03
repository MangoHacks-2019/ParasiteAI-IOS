//  This file was automatically generated and should not be edited.

import Apollo

public enum PatientOrderBy: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case idAsc
  case idDesc
  case createdAtAsc
  case createdAtDesc
  case updatedAtAsc
  case updatedAtDesc
  case deletedAtAsc
  case deletedAtDesc
  case pnameAsc
  case pnameDesc
  case resultAsc
  case resultDesc
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "id_ASC": self = .idAsc
      case "id_DESC": self = .idDesc
      case "createdAt_ASC": self = .createdAtAsc
      case "createdAt_DESC": self = .createdAtDesc
      case "updatedAt_ASC": self = .updatedAtAsc
      case "updatedAt_DESC": self = .updatedAtDesc
      case "deletedAt_ASC": self = .deletedAtAsc
      case "deletedAt_DESC": self = .deletedAtDesc
      case "pname_ASC": self = .pnameAsc
      case "pname_DESC": self = .pnameDesc
      case "result_ASC": self = .resultAsc
      case "result_DESC": self = .resultDesc
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .idAsc: return "id_ASC"
      case .idDesc: return "id_DESC"
      case .createdAtAsc: return "createdAt_ASC"
      case .createdAtDesc: return "createdAt_DESC"
      case .updatedAtAsc: return "updatedAt_ASC"
      case .updatedAtDesc: return "updatedAt_DESC"
      case .deletedAtAsc: return "deletedAt_ASC"
      case .deletedAtDesc: return "deletedAt_DESC"
      case .pnameAsc: return "pname_ASC"
      case .pnameDesc: return "pname_DESC"
      case .resultAsc: return "result_ASC"
      case .resultDesc: return "result_DESC"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: PatientOrderBy, rhs: PatientOrderBy) -> Bool {
    switch (lhs, rhs) {
      case (.idAsc, .idAsc): return true
      case (.idDesc, .idDesc): return true
      case (.createdAtAsc, .createdAtAsc): return true
      case (.createdAtDesc, .createdAtDesc): return true
      case (.updatedAtAsc, .updatedAtAsc): return true
      case (.updatedAtDesc, .updatedAtDesc): return true
      case (.deletedAtAsc, .deletedAtAsc): return true
      case (.deletedAtDesc, .deletedAtDesc): return true
      case (.pnameAsc, .pnameAsc): return true
      case (.pnameDesc, .pnameDesc): return true
      case (.resultAsc, .resultAsc): return true
      case (.resultDesc, .resultDesc): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public final class PatientsListQuery: GraphQLQuery {
  public let operationDefinition =
    "query PatientsList($first: Int, $orderBy: [PatientOrderBy]) {\n  patientsList(first: $first, orderBy: $orderBy) {\n    __typename\n    items {\n      __typename\n      pname\n      result\n    }\n  }\n}"

  public var first: Int?
  public var orderBy: [PatientOrderBy?]?

  public init(first: Int? = nil, orderBy: [PatientOrderBy?]? = nil) {
    self.first = first
    self.orderBy = orderBy
  }

  public var variables: GraphQLMap? {
    return ["first": first, "orderBy": orderBy]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("patientsList", arguments: ["first": GraphQLVariable("first"), "orderBy": GraphQLVariable("orderBy")], type: .nonNull(.object(PatientsList.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(patientsList: PatientsList) {
      self.init(unsafeResultMap: ["__typename": "Query", "patientsList": patientsList.resultMap])
    }

    public var patientsList: PatientsList {
      get {
        return PatientsList(unsafeResultMap: resultMap["patientsList"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "patientsList")
      }
    }

    public struct PatientsList: GraphQLSelectionSet {
      public static let possibleTypes = ["PatientListResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(items: [Item]) {
        self.init(unsafeResultMap: ["__typename": "PatientListResponse", "items": items.map { (value: Item) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// List items
      public var items: [Item] {
        get {
          return (resultMap["items"] as! [ResultMap]).map { (value: ResultMap) -> Item in Item(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Item) -> ResultMap in value.resultMap }, forKey: "items")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Patient"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pname", type: .scalar(String.self)),
          GraphQLField("result", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(pname: String? = nil, result: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Patient", "pname": pname, "result": result])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var pname: String? {
          get {
            return resultMap["pname"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "pname")
          }
        }

        public var result: String? {
          get {
            return resultMap["result"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "result")
          }
        }
      }
    }
  }
}

public final class CreateDoctorMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateDoctor($name: [String!], $doctorID: Int!) {\n  doctorCreate(data: {name: $name, dID: $doctorID}) {\n    __typename\n    id\n    name\n  }\n}"

  public var name: [String]?
  public var doctorID: Int

  public init(name: [String]?, doctorID: Int) {
    self.name = name
    self.doctorID = doctorID
  }

  public var variables: GraphQLMap? {
    return ["name": name, "doctorID": doctorID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("doctorCreate", arguments: ["data": ["name": GraphQLVariable("name"), "dID": GraphQLVariable("doctorID")]], type: .nonNull(.object(DoctorCreate.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(doctorCreate: DoctorCreate) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "doctorCreate": doctorCreate.resultMap])
    }

    public var doctorCreate: DoctorCreate {
      get {
        return DoctorCreate(unsafeResultMap: resultMap["doctorCreate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "doctorCreate")
      }
    }

    public struct DoctorCreate: GraphQLSelectionSet {
      public static let possibleTypes = ["Doctor"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("name", type: .list(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: [String?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Doctor", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: [String?]? {
        get {
          return resultMap["name"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class CreatePatientMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreatePatient($pname: String!, $result: String!) {\n  patientCreate(data: {pname: $pname, result: $result}) {\n    __typename\n    id\n    pname\n  }\n}"

  public var pname: String
  public var result: String

  public init(pname: String, result: String) {
    self.pname = pname
    self.result = result
  }

  public var variables: GraphQLMap? {
    return ["pname": pname, "result": result]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("patientCreate", arguments: ["data": ["pname": GraphQLVariable("pname"), "result": GraphQLVariable("result")]], type: .nonNull(.object(PatientCreate.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(patientCreate: PatientCreate) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "patientCreate": patientCreate.resultMap])
    }

    public var patientCreate: PatientCreate {
      get {
        return PatientCreate(unsafeResultMap: resultMap["patientCreate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "patientCreate")
      }
    }

    public struct PatientCreate: GraphQLSelectionSet {
      public static let possibleTypes = ["Patient"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("pname", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, pname: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Patient", "id": id, "pname": pname])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var pname: String? {
        get {
          return resultMap["pname"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "pname")
        }
      }
    }
  }
}